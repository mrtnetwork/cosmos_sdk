import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// BIP44Params is used as path field in ledger item in Record.
class BIP44Params extends CosmosProtoMessage {
  /// purpose is a constant set to 44' (or 0x8000002C) following the BIP43 recommendation
  final int? purpose;

  /// coin_type is a constant that improves privacy
  final int? coinType;

  /// account splits the key space into independent user identities
  final int? account;

  /// change is a constant used for public derivation. Constant 0 is used for external chain and constant 1 for internal
  /// chain.
  final bool? change;

  /// address_index is used as child index in BIP32 derivation
  final int? addressIndex;

  const BIP44Params({
    this.purpose,
    this.coinType,
    this.account,
    this.change,
    this.addressIndex,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "crypto/keys/hd/BIP44Params",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint32(1),
        ProtoFieldConfig.uint32(2),
        ProtoFieldConfig.uint32(3),
        ProtoFieldConfig.bool(4),
        ProtoFieldConfig.uint32(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    purpose,
    coinType,
    account,
    change,
    addressIndex,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'purpose': purpose,
      'coin_type': coinType,
      'account': account,
      'change': change,
      'address_index': addressIndex,
    };
  }

  factory BIP44Params.fromJson(Map<String, dynamic> json) {
    return BIP44Params(
      purpose: json.valueAsInt<int?>('purpose', acceptCamelCase: true),
      coinType: json.valueAsInt<int?>('coin_type', acceptCamelCase: true),
      account: json.valueAsInt<int?>('account', acceptCamelCase: true),
      change: json.valueAsBool<bool?>('change', acceptCamelCase: true),
      addressIndex: json.valueAsInt<int?>(
        'address_index',
        acceptCamelCase: true,
      ),
    );
  }

  factory BIP44Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BIP44Params(
      purpose: decode.getInt<int?>(1),
      coinType: decode.getInt<int?>(2),
      account: decode.getInt<int?>(3),
      change: decode.getBool<bool?>(4),
      addressIndex: decode.getInt<int?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosCryptoHdV1BIP44Params;
}
