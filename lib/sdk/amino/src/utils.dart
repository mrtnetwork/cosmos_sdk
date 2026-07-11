import 'package:blockchain_utils/blockchain_utils.dart'; // Bech32Encoder
import 'package:cosmos_sdk/sdk/exception/exception.dart';
import 'package:cosmos_sdk/sdk/types/bech32_config.dart';

/// expected options
///  {amino.dont_omitempty: {true, false}, amino.encoding: {inline_json, legacy_coins, asset, bech32, keygen_type},
///  amino.oneof_name: {...}, amino.message_encoding: {key_field, threshold_string, module_account},
///  amino.field_name: {gentxs, address, creation_height, id, pubkeys, public_key}}
class CosmosAminoUtils {
  static const _dontOmitEmpty = 'amino.dont_omitempty';
  static const _encoding = 'amino.encoding';
  static const _oneofName = 'amino.oneof_name';
  static const _messageEncoding = 'amino.message_encoding';
  static const _fieldName = 'amino.field_name';
  static const _castType = 'gogoproto.casttype';
  static Object? sortAminoJsonTx(Object? obj) {
    if (obj is Map) {
      final keys =
          obj.keys.cast<String>().toList()..sort((a, b) => a.compareTo(b));
      final Map<String, dynamic> result = {};
      for (final i in keys) {
        final value = obj[i];
        result[i] = sortAminoJsonTx(value);
      }
      return result;
    } else if (obj is List) {
      return obj.map((e) => sortAminoJsonTx(e)).toList();
    }
    return obj;
  }

  static Map<String, dynamic> toAminoJson({
    required Map<String, dynamic> json,
    required Map<String, List<ProtoOption>> options,
    required CosmosBech32Config config,
  }) {
    final result = <String, dynamic>{};

    for (final entry in json.entries) {
      final key = entry.key;
      final fieldOptions = options[key] ?? const <ProtoOption>[];

      dynamic value = entry.value;

      final dontOmitEmpty = _boolOption(fieldOptions, _dontOmitEmpty);
      final encoding = _stringOption(fieldOptions, _encoding);
      final oneofName = _stringOption(fieldOptions, _oneofName);
      final messageEncoding = _stringOption(fieldOptions, _messageEncoding);
      final fieldNameOverride = _stringOption(fieldOptions, _fieldName);

      // 1. scalar/bytes-level encoding transforms.
      value = _applyEncoding(value, encoding, fieldOptions, config);

      // 2. message-level encoding transforms (threshold_string, key_field...).
      value = _applyMessageEncoding(value, messageEncoding);

      // 3. oneof/interface wrapping.
      if (oneofName != null && value != null) {
        value = {'type': oneofName, 'value': value};
      }

      // 4. omitempty.
      if (!dontOmitEmpty && _isEmpty(value)) {
        continue;
      }

      // 5. field naming: explicit override wins, otherwise snake_case.
      final outKey = fieldNameOverride ?? _toSnakeCase(key);
      result[outKey] = value;
    }

    return result;
  }

  // ---- option helpers ------------------------------------------------

  static ProtoOption? _find(List<ProtoOption> options, String suffix) {
    for (final o in options) {
      if (o.name.contains(suffix)) return o;
    }
    return null;
  }

  static bool _boolOption(List<ProtoOption> options, String suffix) {
    final o = _find(options, suffix);
    return o != null && o.value == true;
  }

  static String? _stringOption(List<ProtoOption> options, String suffix) {
    final o = _find(options, suffix);
    if (o == null || o.value == null) return null;
    return o.value.toString();
  }

  /// Resolves the address kind (account/validator/consensus) from the
  /// field's `gogoproto.casttype` option, e.g.
  /// "github.com/cosmos/cosmos-sdk/types.AccAddress" -> account.
  /// Defaults to [CosmosAddressType.account] if no casttype is present,
  /// since that's the overwhelmingly common case for bare `bytes` fields.
  static CosmosAddressType _addressTypeOption(List<ProtoOption> options) {
    final castType = _stringOption(options, _castType);
    if (castType == null) return CosmosAddressType.account;
    if (castType.contains('ValAddress')) return CosmosAddressType.validator;
    if (castType.contains('ConsAddress')) return CosmosAddressType.consensus;
    return CosmosAddressType.account;
  }

  // ---- value transforms -----------------------------------------------

  static dynamic _applyEncoding(
    dynamic value,
    String? encoding,
    List<ProtoOption> fieldOptions,
    CosmosBech32Config config,
  ) {
    if (encoding == null || value == null) return value;

    switch (encoding) {
      case 'inline_json':
        if (value is String) {
          try {
            return StringUtils.toJson(value);
          } catch (_) {
            return value;
          }
        }
        return value;

      case 'legacy_coins':
        // Coin[] fields keep [] rather than being omitted (paired with
        // dont_omitempty upstream); amount/denom already come through as
        // strings from Coin.toJson(), so no shape change needed.
        return value;

      case 'bech32':
        if (value is String) return value; // already encoded upstream
        final bytes =
            value is List<int>
                ? value
                : throw AminoJsonParserException(
                  'bech32 encoding expects raw bytes, got ${value.runtimeType}',
                );
        final addressType = _addressTypeOption(fieldOptions);
        final hrp = config.hrpFor(addressType);
        return Bech32Encoder.encode(hrp, bytes);

      case 'asset':
        return value;

      case 'keygen_type':
        return value;

      default:
        return value;
    }
  }

  static dynamic _applyMessageEncoding(dynamic value, String? messageEncoding) {
    if (messageEncoding == null || value == null) return value;
    switch (messageEncoding) {
      case 'threshold_string':
        return value.toString();

      case 'key_field':
        if (value is Map && value.containsKey('key')) return value;
        return {'key': value};
      case 'module_account':
        return value;

      default:
        return value;
    }
  }

  // ---- misc -------------------------------------------------------

  static bool _isEmpty(dynamic value) {
    if (value == null) return true;
    if (value is String) return value.isEmpty;
    if (value is num) return value == 0;
    if (value is bool) return value == false;
    if (value is Map) return value.isEmpty;
    if (value is Iterable) return value.isEmpty;
    return false;
  }

  static String _toSnakeCase(String input) {
    final buffer = StringBuffer();
    for (var i = 0; i < input.length; i++) {
      final ch = input[i];
      final isUpper = ch.toUpperCase() == ch && ch.toLowerCase() != ch;
      if (isUpper) {
        if (i != 0) buffer.write('_');
        buffer.write(ch.toLowerCase());
      } else {
        buffer.write(ch);
      }
    }
    return buffer.toString();
  }
}
