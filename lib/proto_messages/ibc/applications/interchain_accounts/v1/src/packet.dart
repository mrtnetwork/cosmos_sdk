import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Type defines a classification of message issued from a controller chain to its associated interchain accounts
/// host
enum Type implements ProtoEnumVariant {
  /// Default zero value enumeration
  typeUnspecified(0, 'TYPE_UNSPECIFIED'),

  /// Execute a transaction on an interchain accounts host chain
  typeExecuteTx(1, 'TYPE_EXECUTE_TX');

  const Type(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static Type fromValue(int? value) {
    value ??= 0;
    return Type.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching Type found for the given value. $value",
                details: {"name": "Type", "value": value?.toString()},
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static Type from(Object? value) {
    value ??= 0;
    return Type.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching Type found for the given value. $value",
                details: {"name": "Type", "value": value?.toString()},
              ),
    );
  }
}

/// InterchainAccountPacketData is comprised of a raw transaction, type of transaction and optional memo field.
class InterchainAccountPacketData extends CosmosProtoMessage {
  final Type? type;

  final BuBytes? data;

  final String? memo;

  InterchainAccountPacketData({this.type, List<int>? data, this.memo})
    : data = data?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.enumType(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [type, data, memo];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'type': config.encodeEnum(type),
      'data': config.encodeBinary(data),
      'memo': memo,
    };
  }

  factory InterchainAccountPacketData.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return InterchainAccountPacketData(
      type: json.valueTo<Type?, Object?>(
        key: 'type',
        parse: (v) => Type.from(v),
      ),
      data: config.decodeBinary<List<int>?>(
        json.valueAs('data', normalizeKeyLookup: config.normalizeKeys),
      ),
      memo: json.valueAsString<String?>(
        'memo',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory InterchainAccountPacketData.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return InterchainAccountPacketData(
      type: decode.getEnum<Type?>(1, Type.values),
      data: decode.getBytes<List<int>?>(2),
      memo: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsInterchainAccountsV1InterchainAccountPacketData;
}
