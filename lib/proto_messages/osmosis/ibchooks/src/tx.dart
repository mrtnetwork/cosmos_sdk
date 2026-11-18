import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class MsgEmitIBCAck extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgEmitIBCAckResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final BigInt? packetSequence;

  final String? channel;

  const MsgEmitIBCAck({this.sender, this.packetSequence, this.channel});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "osmosis/MsgEmitIBCAck"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, packetSequence, channel];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'sender': sender,
      'packet_sequence': config.encodeBigint(packetSequence),
      'channel': channel,
    };
  }

  factory MsgEmitIBCAck.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgEmitIBCAck(
      sender: json.valueAsString<String?>(
        'sender',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      packetSequence: json.valueAsBigInt<BigInt?>(
        'packet_sequence',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      channel: json.valueAsString<String?>(
        'channel',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgEmitIBCAck.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgEmitIBCAck(
      sender: decode.getString<String?>(1),
      packetSequence: decode.getBigInt<BigInt?>(2),
      channel: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIbchooksMsgEmitIBCAck;
  @override
  MsgEmitIBCAckResponse onServiceResponse(List<int> bytes) {
    return MsgEmitIBCAckResponse.deserialize(bytes);
  }

  @override
  MsgEmitIBCAckResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgEmitIBCAckResponse.fromJson(json);
  }
}

class MsgEmitIBCAckResponse extends CosmosProtoMessage {
  final String? contractResult;

  final String? ibcAck;

  const MsgEmitIBCAckResponse({this.contractResult, this.ibcAck});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [contractResult, ibcAck];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'contract_result': contractResult, 'ibc_ack': ibcAck};
  }

  factory MsgEmitIBCAckResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgEmitIBCAckResponse(
      contractResult: json.valueAsString<String?>(
        'contract_result',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ibcAck: json.valueAsString<String?>(
        'ibc_ack',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgEmitIBCAckResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgEmitIBCAckResponse(
      contractResult: decode.getString<String?>(1),
      ibcAck: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIbchooksMsgEmitIBCAckResponse;
}
