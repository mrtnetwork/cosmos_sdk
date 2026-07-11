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

  final List<int>? signer;

  final BigInt? keygenTime;

  final List<int>? keysharesBackup;

  final List<int>? secp256k1Signature;

  final String? poolPubKeyEddsa;

  final List<int>? keysharesBackupEddsa;

  final List<int>? keysharesBackupFrost;

  final String? poolPubKeyFrost;

  final BigInt? observedMoneroHeight;

  const MsgTssPool({
    this.id,
    this.poolPubKey,
    this.keygenType,
    this.pubKeys = const [],
    this.height,
    this.blame = const [],
    this.chains = const [],
    this.signer,
    this.keygenTime,
    this.keysharesBackup,
    this.secp256k1Signature,
    this.poolPubKeyEddsa,
    this.keysharesBackupEddsa,
    this.keysharesBackupFrost,
    this.poolPubKeyFrost,
    this.observedMoneroHeight,
  });

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
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pool_pub_key': poolPubKey,
      'keygen_type': keygenType?.protoName,
      'pub_keys': pubKeys.map((e) => e).toList(),
      'height': height?.toString(),
      'blame': blame.map((e) => e.toJson()).toList(),
      'chains': chains.map((e) => e).toList(),
      'signer': switch (signer) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'keygen_time': keygenTime?.toString(),
      'keyshares_backup': switch (keysharesBackup) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'secp256k1_signature': switch (secp256k1Signature) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'pool_pub_key_eddsa': poolPubKeyEddsa,
      'keyshares_backup_eddsa': switch (keysharesBackupEddsa) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'keyshares_backup_frost': switch (keysharesBackupFrost) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'pool_pub_key_frost': poolPubKeyFrost,
      'observed_monero_height': observedMoneroHeight?.toString(),
    };
  }

  factory MsgTssPool.fromJson(Map<String, dynamic> json) {
    return MsgTssPool(
      id: json.valueAsString<String?>('id', acceptCamelCase: true),
      poolPubKey: json.valueAsString<String?>(
        'pool_pub_key',
        acceptCamelCase: true,
      ),
      keygenType: json.valueTo<types_type_keygen.KeygenType?, Object?>(
        key: 'keygen_type',
        parse: (v) => types_type_keygen.KeygenType.from(v),
      ),
      pubKeys:
          (json.valueEnsureAsList<dynamic>(
            'pub_keys',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      blame:
          (json.valueEnsureAsList<dynamic>('blame', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  types_type_blame.Blame,
                  Map<String, dynamic>
                >(value: e, parse: (v) => types_type_blame.Blame.fromJson(v)),
              )
              .toList(),
      chains:
          (json.valueEnsureAsList<dynamic>(
            'chains',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      signer: json.valueAsBytes<List<int>?>(
        'signer',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      keygenTime: json.valueAsBigInt<BigInt?>(
        'keygen_time',
        acceptCamelCase: true,
      ),
      keysharesBackup: json.valueAsBytes<List<int>?>(
        'keyshares_backup',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      secp256k1Signature: json.valueAsBytes<List<int>?>(
        'secp256k1_signature',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      poolPubKeyEddsa: json.valueAsString<String?>(
        'pool_pub_key_eddsa',
        acceptCamelCase: true,
      ),
      keysharesBackupEddsa: json.valueAsBytes<List<int>?>(
        'keyshares_backup_eddsa',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      keysharesBackupFrost: json.valueAsBytes<List<int>?>(
        'keyshares_backup_frost',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      poolPubKeyFrost: json.valueAsString<String?>(
        'pool_pub_key_frost',
        acceptCamelCase: true,
      ),
      observedMoneroHeight: json.valueAsBigInt<BigInt?>(
        'observed_monero_height',
        acceptCamelCase: true,
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
