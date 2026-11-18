import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/types/src/type_keygen.dart"
    as types_type_keygen;
import "package:cosmos_sdk/proto_messages/thorchain/types/src/type_blame.dart"
    as types_type_blame;
import "package:cosmos_sdk/proto_messages/thorchain/types/src/tx.dart"
    as types_tx;

class MsgTssPool extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<types_tx.MsgEmpty>,
        ICosmosProtoAminoMessage {
  final String? id;

  final String? poolPubKey;

  final types_type_keygen.KeygenType? keygenType;

  final List<String> pubKeys;

  final BigInt? height;

  final List<types_type_blame.Blame> blame;

  final List<String> chains;

  final BuBytes? signer;

  final BigInt? keygenTime;

  final BuBytes? keysharesBackup;

  final BuBytes? secp256k1Signature;

  final String? poolPubKeyEddsa;

  final BuBytes? keysharesBackupEddsa;

  final BuBytes? keysharesBackupFrost;

  final String? poolPubKeyFrost;

  final BigInt? observedMoneroHeight;

  MsgTssPool({
    this.id,
    this.poolPubKey,
    this.keygenType,
    this.pubKeys = const [],
    this.height,
    this.blame = const [],
    this.chains = const [],
    List<int>? signer,
    this.keygenTime,
    List<int>? keysharesBackup,
    List<int>? secp256k1Signature,
    this.poolPubKeyEddsa,
    List<int>? keysharesBackupEddsa,
    List<int>? keysharesBackupFrost,
    this.poolPubKeyFrost,
    this.observedMoneroHeight,
  }) : signer = signer?.asImmutableBytes,
       keysharesBackup = keysharesBackup?.asImmutableBytes,
       secp256k1Signature = secp256k1Signature?.asImmutableBytes,
       keysharesBackupEddsa = keysharesBackupEddsa?.asImmutableBytes,
       keysharesBackupFrost = keysharesBackupFrost?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "thorchain/TssPool"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.enumType(
          3,
          options: [
            ProtoOptionString(name: "amino.encoding", value: "keygen_type"),
          ],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.bytes(
          8,
          options: [ProtoOptionString(name: "amino.encoding", value: "bech32")],
        ),
        ProtoFieldConfig.int64(9),
        ProtoFieldConfig.bytes(10),
        ProtoFieldConfig.bytes(11),
        ProtoFieldConfig.string(12, options: const []),
        ProtoFieldConfig.bytes(13, options: const []),
        ProtoFieldConfig.bytes(14, options: const []),
        ProtoFieldConfig.string(15, options: const []),
        ProtoFieldConfig.int64(16),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    id,
    poolPubKey,
    keygenType,
    pubKeys,
    height,
    blame,
    chains,
    signer,
    keygenTime,
    keysharesBackup,
    secp256k1Signature,
    poolPubKeyEddsa,
    keysharesBackupEddsa,
    keysharesBackupFrost,
    poolPubKeyFrost,
    observedMoneroHeight,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'id': id,
      'pool_pub_key': poolPubKey,
      'keygen_type': config.encodeEnum(keygenType),
      'pub_keys': pubKeys.map((e) => e).toList(),
      'height': config.encodeBigint(height),
      'blame': blame.map((e) => config.encodeMessage(e)).toList(),
      'chains': chains.map((e) => e).toList(),
      'signer': config.encodeBinary(signer),
      'keygen_time': config.encodeBigint(keygenTime),
      'keyshares_backup': config.encodeBinary(keysharesBackup),
      'secp256k1_signature': config.encodeBinary(secp256k1Signature),
      'pool_pub_key_eddsa': poolPubKeyEddsa,
      'keyshares_backup_eddsa': config.encodeBinary(keysharesBackupEddsa),
      'keyshares_backup_frost': config.encodeBinary(keysharesBackupFrost),
      'pool_pub_key_frost': poolPubKeyFrost,
      'observed_monero_height': config.encodeBigint(observedMoneroHeight),
    };
  }

  factory MsgTssPool.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgTssPool(
      id: json.valueAsString<String?>(
        'id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      poolPubKey: json.valueAsString<String?>(
        'pool_pub_key',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      keygenType: json.valueTo<types_type_keygen.KeygenType?, Object?>(
        key: 'keygen_type',
        parse: (v) => types_type_keygen.KeygenType.from(v),
      ),
      pubKeys:
          (json.valueEnsureAsList<dynamic>(
            'pub_keys',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      blame:
          (json.valueEnsureAsList<dynamic>(
                'blame',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<types_type_blame.Blame, Object>(
                  value: e,
                  parse:
                      (v) => types_type_blame.Blame.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      chains:
          (json.valueEnsureAsList<dynamic>(
            'chains',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      signer: config.decodeBinary<List<int>?>(
        json.valueAs('signer', normalizeKeyLookup: config.normalizeKeys),
      ),
      keygenTime: json.valueAsBigInt<BigInt?>(
        'keygen_time',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      keysharesBackup: config.decodeBinary<List<int>?>(
        json.valueAs(
          'keyshares_backup',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      secp256k1Signature: config.decodeBinary<List<int>?>(
        json.valueAs(
          'secp256k1_signature',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      poolPubKeyEddsa: json.valueAsString<String?>(
        'pool_pub_key_eddsa',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      keysharesBackupEddsa: config.decodeBinary<List<int>?>(
        json.valueAs(
          'keyshares_backup_eddsa',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      keysharesBackupFrost: config.decodeBinary<List<int>?>(
        json.valueAs(
          'keyshares_backup_frost',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      poolPubKeyFrost: json.valueAsString<String?>(
        'pool_pub_key_frost',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      observedMoneroHeight: json.valueAsBigInt<BigInt?>(
        'observed_monero_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgTssPool.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgTssPool(
      id: decode.getString<String?>(1),
      poolPubKey: decode.getString<String?>(2),
      keygenType: decode.getEnum<types_type_keygen.KeygenType?>(
        3,
        types_type_keygen.KeygenType.values,
      ),
      pubKeys: decode.getListOrEmpty<String>(4),
      height: decode.getBigInt<BigInt?>(5),
      blame:
          decode
              .getListOfBytes(6)
              .map((b) => types_type_blame.Blame.deserialize(b))
              .toList(),
      chains: decode.getListOrEmpty<String>(7),
      signer: decode.getBytes<List<int>?>(8),
      keygenTime: decode.getBigInt<BigInt?>(9),
      keysharesBackup: decode.getBytes<List<int>?>(10),
      secp256k1Signature: decode.getBytes<List<int>?>(11),
      poolPubKeyEddsa: decode.getString<String?>(12),
      keysharesBackupEddsa: decode.getBytes<List<int>?>(13),
      keysharesBackupFrost: decode.getBytes<List<int>?>(14),
      poolPubKeyFrost: decode.getString<String?>(15),
      observedMoneroHeight: decode.getBigInt<BigInt?>(16),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesMsgTssPool;
  @override
  types_tx.MsgEmpty onServiceResponse(List<int> bytes) {
    return types_tx.MsgEmpty.deserialize(bytes);
  }

  @override
  types_tx.MsgEmpty onServiceResponseJson(Map<String, dynamic> json) {
    return types_tx.MsgEmpty.fromJson(json);
  }
}
