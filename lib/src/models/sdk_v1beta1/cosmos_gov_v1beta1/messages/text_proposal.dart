import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// TextProposal defines a standard text proposal whose changes need to be manually updated in case of approval.
class GovTextProposal extends CosmosMessage {
  /// title of the proposal.
  final String? title;

  /// description associated with the proposal.
  final String? description;
  const GovTextProposal({this.title, this.description});
  factory GovTextProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovTextProposal(
        title: decode.getField(1), description: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"title": title, "description": description};
  }

  @override
  TypeUrl get typeUrl => GovV1beta1types.govTextProposal;

  @override
  List get values => [title, description];
}
