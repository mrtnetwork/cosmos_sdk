import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryPacketAcknowledgementResponse defines the client query response for a
/// packet which also includes a proof and the height from which the proof was retrieved
class QueryPacketAcknowledgementResponse extends CosmosMessage {
  /// packet associated with the request fields
  final List<int>? acknowledgement;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final IbcClientHeight proofHeight;
  QueryPacketAcknowledgementResponse(
      {List<int>? acknowledgement, List<int>? proof, required this.proofHeight})
      : acknowledgement =
            BytesUtils.tryToBytes(acknowledgement, unmodifiable: true),
        proof = BytesUtils.tryToBytes(proof, unmodifiable: true);

  factory QueryPacketAcknowledgementResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryPacketAcknowledgementResponse(
      acknowledgement: decode.getField(1),
      proof: decode.getField(2),
      proofHeight: IbcClientHeight.deserialize(decode.getField(3)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "acknowledgement": BytesUtils.tryToHexString(acknowledgement),
      "proof": BytesUtils.tryToHexString(proof),
      "proof_height": proofHeight.toJson()
    };
  }

  @override
  String get typeUrl => IbcTypes.queryPacketAcknowledgementResponse.typeUrl;

  @override
  List get values => [acknowledgement, proof, proofHeight];
}
