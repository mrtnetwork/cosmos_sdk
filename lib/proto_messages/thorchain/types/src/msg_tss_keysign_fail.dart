import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/types/src/type_blame.dart"
    as types_type_blame;
import "package:cosmos_sdk/proto_messages/thorchain/common/src/common.dart"
    as common_common;
import "package:cosmos_sdk/proto_messages/thorchain/types/src/tx.dart"
    as types_tx;

class MsgTssKeysignFail extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<types_tx.MsgEmpty>,
        ICosmosProtoAminoMessage {
  final String? id;

  final BigInt? height;

  final types_type_blame.Blame? blame;

  final String? memo;

  final List<common_common.Coin> coins;

  final String? pubKey;

  final BuBytes? signer;

  MsgTssKeysignFail({
    this.id,
    this.height,
    this.blame,
    this.memo,
    this.coins = const [],
    this.pubKey,
    List<int>? signer,
  }) : signer = signer?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "thorchain/TssKeysignFail",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.bytes(
          7,
          options: [ProtoOptionString(name: "amino.encoding", value: "bech32")],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    id,
    height,
    blame,
    memo,
    coins,
    pubKey,
    signer,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'id': id,
      'height': config.encodeBigint(height),
      'blame': config.encodeMessage(blame),
      'memo': memo,
      'coins': coins.map((e) => config.encodeMessage(e)).toList(),
      'pub_key': pubKey,
      'signer': config.encodeBinary(signer),
    };
  }

  factory MsgTssKeysignFail.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgTssKeysignFail(
      id: json.valueAsString<String?>(
        'id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      blame: json.valueTo<types_type_blame.Blame?, Object>(
        key: 'blame',
        parse:
            (v) => types_type_blame.Blame.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      memo: json.valueAsString<String?>(
        'memo',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      coins:
          (json.valueEnsureAsList<dynamic>(
                'coins',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<common_common.Coin, Object>(
                  value: e,
                  parse:
                      (v) => common_common.Coin.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      pubKey: json.valueAsString<String?>(
        'pub_key',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signer: config.decodeBinary<List<int>?>(
        json.valueAs('signer', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory MsgTssKeysignFail.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgTssKeysignFail(
      id: decode.getString<String?>(1),
      height: decode.getBigInt<BigInt?>(2),
      blame: decode.messageTo<types_type_blame.Blame?>(
        3,
        (b) => types_type_blame.Blame.deserialize(b),
      ),
      memo: decode.getString<String?>(4),
      coins:
          decode
              .getListOfBytes(5)
              .map((b) => common_common.Coin.deserialize(b))
              .toList(),
      pubKey: decode.getString<String?>(6),
      signer: decode.getBytes<List<int>?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesMsgTssKeysignFail;
  @override
  types_tx.MsgEmpty onServiceResponse(List<int> bytes) {
    return types_tx.MsgEmpty.deserialize(bytes);
  }

  @override
  types_tx.MsgEmpty onServiceResponseJson(Map<String, dynamic> json) {
    return types_tx.MsgEmpty.fromJson(json);
  }
}
