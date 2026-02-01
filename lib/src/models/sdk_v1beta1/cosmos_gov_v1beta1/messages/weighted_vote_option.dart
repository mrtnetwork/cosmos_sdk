import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/messages/vote_option.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// WeightedVoteOption defines a unit of vote for vote split.
/// Since: cosmos-sdk 0.43
class GovWeightedVoteOption extends CosmosMessage {
  /// option defines the valid vote options, it must not contain duplicate vote options.
  final GovVoteOption? option;

  /// weight is the vote weight associated with the vote option.
  final String weight;
  const GovWeightedVoteOption({this.option, required this.weight});
  factory GovWeightedVoteOption.fromJson(Map<String, dynamic> json) {
    return GovWeightedVoteOption(
      weight: json["weight"],
      option:
          json["option"] == null
              ? null
              : GovVoteOption.fromName(json["option"]),
    );
  }

  factory GovWeightedVoteOption.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovWeightedVoteOption(
      option: decode
          .getResult(1)
          ?.to<GovVoteOption, int>((e) => GovVoteOption.fromValue(e)),
      weight: decode.getField(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"option": option?.value, "weight": weight};
  }

  @override
  TypeUrl get typeUrl => GovV1beta1types.goveWeightedVoteOption;

  @override
  List get values => [option?.value, weight];
}
