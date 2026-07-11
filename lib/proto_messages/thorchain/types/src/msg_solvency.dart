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

  final List<int>? signer;

  const MsgSolvency({
    this.id,
    this.chain,
    this.pubKey,
    this.coins = const [],
    this.height,
    this.signer,
  });

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
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chain': chain,
      'pub_key': pubKey,
      'coins': coins.map((e) => e.toJson()).toList(),
      'height': height?.toString(),
      'signer': switch (signer) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgSolvency.fromJson(Map<String, dynamic> json) {
    return MsgSolvency(
      id: json.valueAsString<String?>('id', acceptCamelCase: true),
      chain: json.valueAsString<String?>('chain', acceptCamelCase: true),
      pubKey: json.valueAsString<String?>('pub_key', acceptCamelCase: true),
      coins:
          (json.valueEnsureAsList<dynamic>('coins', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  common_common.Coin,
                  Map<String, dynamic>
                >(value: e, parse: (v) => common_common.Coin.fromJson(v)),
              )
              .toList(),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      signer: json.valueAsBytes<List<int>?>(
        'signer',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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

  final List<int>? signer;

  const MsgSolvencyQuorum({this.quoSolvency, this.signer});

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
  Map<String, dynamic> toJson() {
    return {
      'quoSolvency': quoSolvency?.toJson(),
      'signer': switch (signer) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgSolvencyQuorum.fromJson(Map<String, dynamic> json) {
    return MsgSolvencyQuorum(
      quoSolvency: json
          .valueTo<common_common.QuorumSolvency?, Map<String, dynamic>>(
            key: 'quoSolvency',
            parse: (v) => common_common.QuorumSolvency.fromJson(v),
            acceptCamelCase: true,
          ),
      signer: json.valueAsBytes<List<int>?>(
        'signer',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
