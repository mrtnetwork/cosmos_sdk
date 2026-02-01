import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/error_receipt.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QueryUpgradeErrorResponse is the response type for the Query/QueryUpgradeError RPC method
class QueryUpgradeErrorResponse extends CosmosMessage {
  final IbcChannelErrorReceipt errorReceipt;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final IbcClientHeight proofHeight;
  factory QueryUpgradeErrorResponse.fromJson(Map<String, dynamic> json) {
    return QueryUpgradeErrorResponse(
      errorReceipt: IbcChannelErrorReceipt.fromJson(json["error_receipt"]),
      proof: CosmosUtils.tryToBytes(json["proof"]),
      proofHeight: IbcClientHeight.fromJson(json["proof_height"]),
    );
  }
  QueryUpgradeErrorResponse({
    required this.errorReceipt,
    List<int>? proof,
    required this.proofHeight,
  }) : proof = BytesUtils.tryToBytes(proof, unmodifiable: true);
  factory QueryUpgradeErrorResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryUpgradeErrorResponse(
      errorReceipt: IbcChannelErrorReceipt.deserialize(decode.getField(1)),
      proof: decode.getField(2),
      proofHeight: IbcClientHeight.deserialize(decode.getField(3)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "error_receipt": errorReceipt.toJson(),
      "proof": BytesUtils.tryToHexString(proof),
      "proof_height": proofHeight.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryUpgradeErrorResponse;

  @override
  List get values => [errorReceipt, proof, proofHeight];
}
