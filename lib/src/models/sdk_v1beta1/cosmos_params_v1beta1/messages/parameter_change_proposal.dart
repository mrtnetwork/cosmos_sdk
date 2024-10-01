import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_params_v1beta1/messages/param_change.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_params_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// ParameterChangeProposal defines a proposal to change one or more parameters.
class ParameterChangeProposal extends CosmosMessage {
  final String? title;
  final String? description;
  final List<ParamChange> changes;
  ParameterChangeProposal(
      {this.title, this.description, required List<ParamChange> changes})
      : changes = changes.immutable;
  factory ParameterChangeProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ParameterChangeProposal(
        title: decode.getField(1),
        description: decode.getField(2),
        changes: decode
            .getFields(3)
            .map((e) => ParamChange.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "changes": changes.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => ParamsV1beta1.parameterChangeProposal.typeUrl;

  @override
  List get values => [title, description, changes];
}
