import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QueryPacketReceiptResponse defines the client query response for a packet receipt
/// which also includes a proof, and the height from which the proof was retrieved
class QueryPacketReceiptResponse extends CosmosMessage {
  /// success flag for if receipt exists
  final bool? received;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final IbcClientHeight proofHeight;

  factory QueryPacketReceiptResponse.fromRpc(Map<String, dynamic> json) {
    return QueryPacketReceiptResponse(
      received: json["received"],
      proof: CosmosUtils.tryToBytes(json["proof"]),
      proofHeight: IbcClientHeight.fromRpc(json["proof_height"]),
    );
  }
  QueryPacketReceiptResponse(
      {this.received, List<int>? proof, required this.proofHeight})
      : proof = BytesUtils.tryToBytes(proof, unmodifiable: true);
  factory QueryPacketReceiptResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryPacketReceiptResponse(
      received: decode.getField(1),
      proof: decode.getField(2),
      proofHeight: IbcClientHeight.deserialize(decode.getField(3)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "received": received,
      "proof": BytesUtils.tryToHexString(proof),
      "proof_height": proofHeight.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryPacketReceiptResponse;

  @override
  List get values => [received, proof, proofHeight];
}
