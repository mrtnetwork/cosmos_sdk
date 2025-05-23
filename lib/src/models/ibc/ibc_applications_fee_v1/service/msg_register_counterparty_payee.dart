import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgRegisterCounterpartyPayee defines the request type for the RegisterCounterpartyPayee rpc
class MsgRegisterCounterpartyPayee
    extends IbcService<EmptyServiceRequestResponse> {
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
  factory MsgRegisterCounterpartyPayee.fromJson(Map<String, dynamic> json) {
    return MsgRegisterCounterpartyPayee(
        portId: json.as("port_id"),
        channelId: json.as("channel_id"),
        relayer: json.as("relayer"),
        counterpartyPayee: json.as("counterparty_payee"));
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
  TypeUrl get typeUrl => IbcTypes.msgRegisterCounterpartyPayee;

  @override
  List get values => [portId, channelId, relayer, counterpartyPayee];

  @override
  List<String?> get signers => [relayer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        IbcTypes.msgRegisterCounterpartyPayeeResponse);
  }
}
