import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// TallyParams defines the params for tallying votes on governance proposals.
class GovTallyParams extends CosmosMessage {
  /// Minimum percentage of total stake needed to vote for a result to be
  /// considered valid.
  final List<int> quorum;

  /// Minimum proportion of Yes votes for proposal to pass. Default value: 0.5.
  final List<int> threshold;

  /// Minimum value of Veto votes to Total votes ratio for proposal to be
  /// vetoed. Default value: 1/3.
  final List<int> vetoThreshold;
  GovTallyParams(
      {required List<int> quorum,
      required List<int> threshold,
      required List<int> vetoThreshold})
      : quorum = BytesUtils.toBytes(quorum, unmodifiable: true),
        threshold = BytesUtils.toBytes(threshold, unmodifiable: true),
        vetoThreshold = BytesUtils.toBytes(vetoThreshold, unmodifiable: true);
  factory GovTallyParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovTallyParams(
        quorum: decode.getField(1),
        threshold: decode.getField(2),
        vetoThreshold: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "quorum": BytesUtils.toHexString(quorum),
      "threshold": BytesUtils.toHexString(threshold),
      "veto_threshold": BytesUtils.toHexString(vetoThreshold)
    };
  }

  @override
  String get typeUrl => GovV1beta1types.govTallyParams.typeUrl;

  @override
  List get values => [quorum, threshold, vetoThreshold];
}
