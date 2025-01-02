import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgCreateClient defines a message to create an IBC client
class MsgCreateClient extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// light client state
  final Any? clientState;

  /// consensus state associated with the client that corresponds to a given
  /// height.
  final Any? consensusState;

  /// signer address
  final String? signer;
  const MsgCreateClient({this.clientState, this.consensusState, this.signer});

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
  TypeUrl get service => IbcTypes.createClient;
  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(IbcTypes.msgCreateClientResponse);
  }
}
