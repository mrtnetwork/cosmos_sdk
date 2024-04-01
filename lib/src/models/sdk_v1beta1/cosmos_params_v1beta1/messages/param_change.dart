import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_params_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ParamChange defines an individual parameter change, for use in ParameterChangeProposal.
class ParamChange extends CosmosMessage {
  final String? subspace;
  final String? key;
  final String? value;
  const ParamChange({this.subspace, this.key, this.value});
  factory ParamChange.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ParamChange(
        subspace: decode.getField(1),
        key: decode.getField(2),
        value: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"subspace": subspace, "key": key, "value": value};
  }

  @override
  String get typeUrl => ParamsV1beta1.paramChange.typeUrl;

  @override
  List get values => [subspace, key, value];
}
