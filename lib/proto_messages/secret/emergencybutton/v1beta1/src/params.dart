import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Params defines the parameters for the ibc-rate-limit module.
class Params extends CosmosProtoMessage {
  final String? switchStatus;

  final String? pauserAddress;

  const Params({this.switchStatus, this.pauserAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [switchStatus, pauserAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'switch_status': switchStatus, 'pauser_address': pauserAddress};
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      switchStatus: json.valueAsString<String?>(
        'switch_status',
        acceptCamelCase: true,
      ),
      pauserAddress: json.valueAsString<String?>(
        'pauser_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      switchStatus: decode.getString<String?>(1),
      pauserAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretEmergencybuttonV1beta1Params;
}
