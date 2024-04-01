import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/query/query_verify_membership_response.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_commitment_v1/messages/merkle_path.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryVerifyMembershipRequest is the request type for the Query/VerifyMembership RPC method
class QueryVerifyMembershipRequest extends CosmosMessage
    with QueryMessage<QueryVerifyMembershipResponse> {
  /// client unique identifier.
  final String? clientId;

  /// the proof to be verified by the client.
  final List<int>? proof;

  /// the height of the commitment root at which the proof is verified.
  final IbcClientHeight proofHeight;

  /// the commitment key path.
  final IbcCommitmentMerklePath merklePath;

  /// the value which is proven.
  final List<int>? value;

  /// optional time delay
  final BigInt? timeDelay;

  /// optional block delay
  final BigInt? blockDelay;
  QueryVerifyMembershipRequest(
      {this.clientId,
      List<int>? proof,
      required this.proofHeight,
      required this.merklePath,
      List<int>? value,
      this.timeDelay,
      this.blockDelay})
      : proof = BytesUtils.tryToBytes(proof),
        value = BytesUtils.tryToBytes(value);
  factory QueryVerifyMembershipRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryVerifyMembershipRequest(
        clientId: decode.getField(1),
        proof: decode.getField(2),
        proofHeight: IbcClientHeight.deserialize(decode.getField(3)),
        merklePath: IbcCommitmentMerklePath.deserialize(decode.getField(4)),
        value: decode.getField(5),
        timeDelay: decode.getField(6),
        blockDelay: decode.getField(7));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  String get queryPath => IbcTypes.verifyMembership.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "client_id": clientId,
      "proof": BytesUtils.tryToHexString(proof),
      "proof_height": proofHeight.toJson(),
      "merkle_path": merklePath.toJson(),
      "value": BytesUtils.tryToHexString(value),
      "time_delay": timeDelay?.toString(),
      "block_delay": blockDelay?.toString()
    };
  }

  @override
  String get typeUrl => IbcTypes.queryVerifyMembershipRequest.typeUrl;

  @override
  List get values =>
      [clientId, proof, proofHeight, merklePath, value, timeDelay, blockDelay];

  @override
  QueryVerifyMembershipResponse onResponse(List<int> bytes) {
    return QueryVerifyMembershipResponse.deserialize(bytes);
  }
}
