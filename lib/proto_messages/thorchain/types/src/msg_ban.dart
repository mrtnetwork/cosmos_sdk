import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/types/src/tx.dart"
    as types_tx;

class MsgBan extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<types_tx.MsgEmpty>,
        ICosmosProtoAminoMessage {
  final BuBytes? nodeAddress;

  final BuBytes? signer;

  MsgBan({List<int>? nodeAddress, List<int>? signer})
    : nodeAddress = nodeAddress?.asImmutableBytes,
      signer = signer?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "thorchain/MsgBan"),
      ],
      fields: [
        ProtoFieldConfig.bytes(
          2,
          options: [ProtoOptionString(name: "amino.encoding", value: "bech32")],
        ),
        ProtoFieldConfig.bytes(
          3,
          options: [ProtoOptionString(name: "amino.encoding", value: "bech32")],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [nodeAddress, signer];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'node_address': config.encodeBinary(nodeAddress),
      'signer': config.encodeBinary(signer),
    };
  }

  factory MsgBan.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgBan(
      nodeAddress: config.decodeBinary<List<int>?>(
        json.valueAs('node_address', normalizeKeyLookup: config.normalizeKeys),
      ),
      signer: config.decodeBinary<List<int>?>(
        json.valueAs('signer', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory MsgBan.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBan(
      nodeAddress: decode.getBytes<List<int>?>(2),
      signer: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesMsgBan;
  @override
  types_tx.MsgEmpty onServiceResponse(List<int> bytes) {
    return types_tx.MsgEmpty.deserialize(bytes);
  }

  @override
  types_tx.MsgEmpty onServiceResponseJson(Map<String, dynamic> json) {
    return types_tx.MsgEmpty.fromJson(json);
  }
}
