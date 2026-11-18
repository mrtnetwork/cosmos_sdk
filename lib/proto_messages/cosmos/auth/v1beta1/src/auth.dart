import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;

/// BaseAccount defines a base account type. It contains all the necessary fields
/// for basic account functionality. Any custom account type should extend this
/// type for additional functionality (e.g. vesting).
class BaseAccount extends CosmosProtoMessage {
  final String? address;

  final google_protobuf_any.Any? pubKey;

  final BigInt? accountNumber;

  final BigInt? sequence;

  const BaseAccount({
    this.address,
    this.pubKey,
    this.accountNumber,
    this.sequence,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "cosmos-sdk/BaseAccount"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(
          2,
          options: [
            ProtoOptionString(name: "amino.field_name", value: "public_key"),
          ],
        ),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.uint64(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, pubKey, accountNumber, sequence];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'address': address,
      'pub_key': config.encodeMessage(pubKey),
      'account_number': config.encodeBigint(accountNumber),
      'sequence': config.encodeBigint(sequence),
    };
  }

  factory BaseAccount.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return BaseAccount(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      pubKey: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'pub_key',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      accountNumber: json.valueAsBigInt<BigInt?>(
        'account_number',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      sequence: json.valueAsBigInt<BigInt?>(
        'sequence',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory BaseAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BaseAccount(
      address: decode.getString<String?>(1),
      pubKey: decode.messageTo<google_protobuf_any.Any?>(
        2,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      accountNumber: decode.getBigInt<BigInt?>(3),
      sequence: decode.getBigInt<BigInt?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthV1beta1BaseAccount;
}

/// Params defines the parameters for the auth module.
class Params extends CosmosProtoMessage {
  final BigInt? maxMemoCharacters;

  final BigInt? txSigLimit;

  final BigInt? txSizeCostPerByte;

  final BigInt? sigVerifyCostEd25519;

  final BigInt? sigVerifyCostSecp256k1;

  const Params({
    this.maxMemoCharacters,
    this.txSigLimit,
    this.txSizeCostPerByte,
    this.sigVerifyCostEd25519,
    this.sigVerifyCostSecp256k1,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/x/auth/Params",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.uint64(4, options: const []),
        ProtoFieldConfig.uint64(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    maxMemoCharacters,
    txSigLimit,
    txSizeCostPerByte,
    sigVerifyCostEd25519,
    sigVerifyCostSecp256k1,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'max_memo_characters': config.encodeBigint(maxMemoCharacters),
      'tx_sig_limit': config.encodeBigint(txSigLimit),
      'tx_size_cost_per_byte': config.encodeBigint(txSizeCostPerByte),
      'sig_verify_cost_ed25519': config.encodeBigint(sigVerifyCostEd25519),
      'sig_verify_cost_secp256k1': config.encodeBigint(sigVerifyCostSecp256k1),
    };
  }

  factory Params.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Params(
      maxMemoCharacters: json.valueAsBigInt<BigInt?>(
        'max_memo_characters',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      txSigLimit: json.valueAsBigInt<BigInt?>(
        'tx_sig_limit',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      txSizeCostPerByte: json.valueAsBigInt<BigInt?>(
        'tx_size_cost_per_byte',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      sigVerifyCostEd25519: json.valueAsBigInt<BigInt?>(
        'sig_verify_cost_ed25519',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      sigVerifyCostSecp256k1: json.valueAsBigInt<BigInt?>(
        'sig_verify_cost_secp256k1',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      maxMemoCharacters: decode.getBigInt<BigInt?>(1),
      txSigLimit: decode.getBigInt<BigInt?>(2),
      txSizeCostPerByte: decode.getBigInt<BigInt?>(3),
      sigVerifyCostEd25519: decode.getBigInt<BigInt?>(4),
      sigVerifyCostSecp256k1: decode.getBigInt<BigInt?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthV1beta1Params;
}
