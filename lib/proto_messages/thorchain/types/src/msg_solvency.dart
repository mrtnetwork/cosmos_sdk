import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/common/src/common.dart"
    as common_common;
import "package:cosmos_sdk/proto_messages/thorchain/types/src/tx.dart"
    as types_tx;

class MsgSolvency extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<types_tx.MsgEmpty>,
        ICosmosProtoAminoMessage {
  final String? id;

  final String? chain;

  final String? pubKey;

  final List<common_common.Coin> coins;

  final BigInt? height;

  final BuBytes? signer;

  MsgSolvency({
    this.id,
    this.chain,
    this.pubKey,
    this.coins = const [],
    this.height,
    List<int>? signer,
  }) : signer = signer?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "thorchain/MsgSolvency"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.bytes(
          6,
          options: [ProtoOptionString(name: "amino.encoding", value: "bech32")],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [id, chain, pubKey, coins, height, signer];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'id': id,
      'chain': chain,
      'pub_key': pubKey,
      'coins': coins.map((e) => config.encodeMessage(e)).toList(),
      'height': config.encodeBigint(height),
      'signer': config.encodeBinary(signer),
    };
  }

  factory MsgSolvency.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSolvency(
      id: json.valueAsString<String?>(
        'id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      chain: json.valueAsString<String?>(
        'chain',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      pubKey: json.valueAsString<String?>(
        'pub_key',
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
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signer: config.decodeBinary<List<int>?>(
        json.valueAs('signer', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory MsgSolvency.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSolvency(
      id: decode.getString<String?>(1),
      chain: decode.getString<String?>(2),
      pubKey: decode.getString<String?>(3),
      coins:
          decode
              .getListOfBytes(4)
              .map((b) => common_common.Coin.deserialize(b))
              .toList(),
      height: decode.getBigInt<BigInt?>(5),
      signer: decode.getBytes<List<int>?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesMsgSolvency;
  @override
  types_tx.MsgEmpty onServiceResponse(List<int> bytes) {
    return types_tx.MsgEmpty.deserialize(bytes);
  }

  @override
  types_tx.MsgEmpty onServiceResponseJson(Map<String, dynamic> json) {
    return types_tx.MsgEmpty.fromJson(json);
  }
}

class MsgSolvencyQuorum extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<types_tx.MsgEmpty>,
        ICosmosProtoAminoMessage {
  final common_common.QuorumSolvency? quoSolvency;

  final BuBytes? signer;

  MsgSolvencyQuorum({this.quoSolvency, List<int>? signer})
    : signer = signer?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "thorchain/MsgSolvencyQuorum",
        ),
      ],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.bytes(
          2,
          options: [ProtoOptionString(name: "amino.encoding", value: "bech32")],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [quoSolvency, signer];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'quoSolvency': config.encodeMessage(quoSolvency),
      'signer': config.encodeBinary(signer),
    };
  }

  factory MsgSolvencyQuorum.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSolvencyQuorum(
      quoSolvency: json.valueTo<common_common.QuorumSolvency?, Object>(
        key: 'quoSolvency',
        parse:
            (v) => common_common.QuorumSolvency.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signer: config.decodeBinary<List<int>?>(
        json.valueAs('signer', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory MsgSolvencyQuorum.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSolvencyQuorum(
      quoSolvency: decode.messageTo<common_common.QuorumSolvency?>(
        1,
        (b) => common_common.QuorumSolvency.deserialize(b),
      ),
      signer: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesMsgSolvencyQuorum;
  @override
  types_tx.MsgEmpty onServiceResponse(List<int> bytes) {
    return types_tx.MsgEmpty.deserialize(bytes);
  }

  @override
  types_tx.MsgEmpty onServiceResponseJson(Map<String, dynamic> json) {
    return types_tx.MsgEmpty.fromJson(json);
  }
}
