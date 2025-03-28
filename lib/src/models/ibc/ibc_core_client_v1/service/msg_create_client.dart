import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgCreateClient defines a message to create an IBC client
class MsgCreateClient extends IbcService<EmptyServiceRequestResponse> {
  /// light client state
  final Any? clientState;

  /// consensus state associated with the client that corresponds to a given
  /// height.
  final Any? consensusState;

  /// signer address
  final String? signer;
  const MsgCreateClient({this.clientState, this.consensusState, this.signer});
  factory MsgCreateClient.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgCreateClient(
        clientState: decode.getResult(1)?.to<Any, List<int>>(Any.deserialize),
        consensusState:
            decode.getResult(2)?.to<Any, List<int>>(Any.deserialize),
        signer: decode.getField(3));
  }
  factory MsgCreateClient.fromJson(Map<String, dynamic> json) {
    return MsgCreateClient(
        clientState: json.maybeAs<Any, Map<String, dynamic>>(
            key: "client_state", onValue: Any.fromJson),
        consensusState: json.maybeAs<Any, Map<String, dynamic>>(
            key: "consensus_state", onValue: Any.fromJson),
        signer: json.as("signer"));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "client_state": clientState?.toJson(),
      "consensus_state": consensusState?.toJson(),
      "signer": signer,
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgCreateClient;

  @override
  List get values => [clientState, consensusState, signer];

  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(IbcTypes.msgCreateClientResponse);
  }
}
