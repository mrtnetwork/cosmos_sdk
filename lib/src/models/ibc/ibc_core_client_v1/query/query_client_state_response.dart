import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QueryClientStateResponse is the response type for the Query/ClientState
/// RPC method. Besides the client state, it includes a proof and the height
/// from which the proof was retrieved.
class IbcClientQueryClientStateResponse extends CosmosMessage {
  /// client state associated with the request identifier
  final AnyMessage? clientState;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final IbcClientHeight proofHeight;
  factory IbcClientQueryClientStateResponse.fromJson(
      Map<String, dynamic> json) {
    return IbcClientQueryClientStateResponse(
        clientState: json["client_state"] == null
            ? null
            : AnyMessage.fromJson(json["client_state"]),
        proof: CosmosUtils.tryToBytes(json["proof"]),
        proofHeight: IbcClientHeight.fromJson(json["proof_height"]));
  }
  IbcClientQueryClientStateResponse(
      {this.clientState, List<int>? proof, required this.proofHeight})
      : proof = BytesUtils.tryToBytes(proof, unmodifiable: true);
  factory IbcClientQueryClientStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcClientQueryClientStateResponse(
      clientState: decode
          .getResult(1)
          ?.to<AnyMessage, List<int>>((e) => AnyMessage.deserialize(e)),
      proof: decode.getField(2),
      proofHeight: IbcClientHeight.deserialize(decode.getField(3)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "client_state": clientState?.toJson(),
      "proof": BytesUtils.tryToHexString(proof),
      "proof_height": proofHeight.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryClientStateResponse;

  @override
  List get values => [clientState, proof, proofHeight];
}
