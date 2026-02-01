import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgRegisterPayee defines the request type for the RegisterPayee rpc
class MsgRegisterPayee extends IbcService<EmptyServiceRequestResponse> {
  /// unique port identifier
  final String? portId;

  /// unique channel identifier
  final String? channelId;

  /// the relayer address
  final String? relayer;

  /// the payee address
  final String? payee;
  const MsgRegisterPayee({
    this.portId,
    this.channelId,
    this.relayer,
    this.payee,
  });
  factory MsgRegisterPayee.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgRegisterPayee(
      portId: decode.getField(1),
      channelId: decode.getField(2),
      relayer: decode.getField(3),
      payee: decode.getField(4),
    );
  }
  factory MsgRegisterPayee.fromJson(Map<String, dynamic> json) {
    return MsgRegisterPayee(
      portId: json.as("port_id"),
      channelId: json.as("channel_id"),
      relayer: json.as("relayer"),
      payee: json.as("payee"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "port_id": portId,
      "channel_id": channelId,
      "relayer": relayer,
      "payee": payee,
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgRegisterPayee;

  @override
  List get values => [portId, channelId, relayer, payee];

  @override
  List<String?> get signers => [relayer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(IbcTypes.msgRegisterPayeeResponse);
  }
}
