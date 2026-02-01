import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/upgrade.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QueryUpgradeResponse is the response type for the QueryUpgradeResponse RPC method
class QueryUpgradeResponse extends CosmosMessage {
  final IbcChannelUpgrade upgrade;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final IbcClientHeight proofHeight;
  factory QueryUpgradeResponse.fromJson(Map<String, dynamic> json) {
    return QueryUpgradeResponse(
      upgrade: IbcChannelUpgrade.fromJson(json["upgrade"]),
      proof: CosmosUtils.tryToBytes(json["proof"]),
      proofHeight: IbcClientHeight.fromJson(json["proof_height"]),
    );
  }
  QueryUpgradeResponse({
    required this.upgrade,
    List<int>? proof,
    required this.proofHeight,
  }) : proof = BytesUtils.tryToBytes(proof, unmodifiable: true);
  factory QueryUpgradeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryUpgradeResponse(
      upgrade: IbcChannelUpgrade.deserialize(decode.getField(1)),
      proof: decode.getField(2),
      proofHeight: IbcClientHeight.deserialize(decode.getField(3)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "upgrade": upgrade.toJson(),
      "proof": BytesUtils.tryToHexString(proof),
      "proof_height": proofHeight.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryUpgradeResponse;

  @override
  List get values => [upgrade, proof, proofHeight];
}
