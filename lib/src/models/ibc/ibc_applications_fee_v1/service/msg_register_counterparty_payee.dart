import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgRegisterCounterpartyPayee defines the request type for the RegisterCounterpartyPayee rpc
class MsgRegisterCounterpartyPayee extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// unique port identifier
  final String? portId;

  /// unique channel identifier
  final String? channelId;

  /// the relayer address
  final String? relayer;

  /// the counterparty payee address
  final String? counterpartyPayee;
  const MsgRegisterCounterpartyPayee(
      {this.portId, this.channelId, this.relayer, this.counterpartyPayee});
  factory MsgRegisterCounterpartyPayee.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgRegisterCounterpartyPayee(
        portId: decode.getField(1),
        channelId: decode.getField(2),
        relayer: decode.getField(3),
        counterpartyPayee: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "port_id": portId,
      "channel_id": channelId,
      "relayer": relayer,
      "counterparty_payee": counterpartyPayee,
    };
  }

  @override
  String get typeUrl => IbcTypes.msgRegisterCounterpartyPayee.typeUrl;

  @override
  List get values => [portId, channelId, relayer, counterpartyPayee];

  @override
  String get service => IbcTypes.registerCounterpartyPayee.typeUrl;

  @override
  List<String?> get signers => [relayer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        IbcTypes.msgRegisterCounterpartyPayeeResponse.typeUrl);
  }
}
