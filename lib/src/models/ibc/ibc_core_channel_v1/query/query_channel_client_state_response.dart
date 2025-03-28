import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/identified_client_state.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QueryChannelClientStateResponse is the Response type for the Query/QueryChannelClientState RPC method
class QueryChannelClientStateResponse extends CosmosMessage {
  /// client state associated with the channel
  final IbcClientIdentifiedClientState? identifiedClientState;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final IbcClientHeight proofHeight;

  factory QueryChannelClientStateResponse.fromJson(Map<String, dynamic> json) {
    return QueryChannelClientStateResponse(
        proof: CosmosUtils.tryToBytes(json["proof"]),
        proofHeight: IbcClientHeight.fromJson(json["proof_height"]),
        identifiedClientState: json["identified_client_state"] == null
            ? null
            : IbcClientIdentifiedClientState.fromJson(
                json["identified_client_state"]));
  }
  QueryChannelClientStateResponse(
      {this.identifiedClientState, List<int>? proof, required this.proofHeight})
      : proof = BytesUtils.tryToBytes(proof, unmodifiable: true);
  factory QueryChannelClientStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryChannelClientStateResponse(
      identifiedClientState: decode
          .getResult(1)
          ?.to<IbcClientIdentifiedClientState, List<int>>(
              (e) => IbcClientIdentifiedClientState.deserialize(e)),
      proof: decode.getField(2),
      proofHeight: IbcClientHeight.deserialize(decode.getField(3)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "identified_client_state": identifiedClientState?.toJson(),
      "proof": BytesUtils.tryToHexString(proof),
      "proof_height": proofHeight.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryChannelClientStateResponse;

  @override
  List get values => [identifiedClientState, proof, proofHeight];
}
