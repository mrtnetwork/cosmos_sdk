import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// ParamChange defines an individual parameter change, for use in
/// ParameterChangeProposal.
class ParamChange extends CosmosProtoMessage {
  final String? subspace;

  final String? key;

  final String? value;

  const ParamChange({this.subspace, this.key, this.value});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [subspace, key, value];

  @override
  Map<String, dynamic> toJson() {
    return {'subspace': subspace, 'key': key, 'value': value};
  }

  factory ParamChange.fromJson(Map<String, dynamic> json) {
    return ParamChange(
      subspace: json.valueAsString<String?>('subspace', acceptCamelCase: true),
      key: json.valueAsString<String?>('key', acceptCamelCase: true),
      value: json.valueAsString<String?>('value', acceptCamelCase: true),
    );
  }

  factory ParamChange.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ParamChange(
      subspace: decode.getString<String?>(1),
      key: decode.getString<String?>(2),
      value: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosParamsV1beta1ParamChange;
}
