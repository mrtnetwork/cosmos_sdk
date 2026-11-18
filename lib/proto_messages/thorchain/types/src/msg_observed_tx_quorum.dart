import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/common/src/common.dart"
    as common_common;
import "package:cosmos_sdk/proto_messages/thorchain/types/src/tx.dart"
    as types_tx;

class MsgObservedTxQuorum extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<types_tx.MsgEmpty>,
        ICosmosProtoAminoMessage {
  final common_common.QuorumTx? quoTx;

  final BuBytes? signer;

  MsgObservedTxQuorum({this.quoTx, List<int>? signer})
    : signer = signer?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "thorchain/ObservedTxQuorum",
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
  List<Object?> get protoValues => [quoTx, signer];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'quoTx': config.encodeMessage(quoTx),
      'signer': config.encodeBinary(signer),
    };
  }

  factory MsgObservedTxQuorum.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgObservedTxQuorum(
      quoTx: json.valueTo<common_common.QuorumTx?, Object>(
        key: 'quoTx',
        parse:
            (v) => common_common.QuorumTx.fromJson(
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

  factory MsgObservedTxQuorum.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgObservedTxQuorum(
      quoTx: decode.messageTo<common_common.QuorumTx?>(
        1,
        (b) => common_common.QuorumTx.deserialize(b),
      ),
      signer: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesMsgObservedTxQuorum;
  @override
  types_tx.MsgEmpty onServiceResponse(List<int> bytes) {
    return types_tx.MsgEmpty.deserialize(bytes);
  }

  @override
  types_tx.MsgEmpty onServiceResponseJson(Map<String, dynamic> json) {
    return types_tx.MsgEmpty.fromJson(json);
  }
}
