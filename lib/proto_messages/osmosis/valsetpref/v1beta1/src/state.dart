import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// ValidatorPreference defines the message structure for
/// CreateValidatorSetPreference. It allows a user to set {val_addr, weight} in
/// state. If a user does not have a validator set preference list set, and has
/// staked, make their preference list default to their current staking
/// distribution.
class ValidatorPreference extends CosmosProtoMessage {
  /// val_oper_address holds the validator address the user wants to delegate
  /// funds to.
  final String? valOperAddress;

  /// weight is decimal between 0 and 1, and they all sum to 1.
  final String? weight;

  const ValidatorPreference({this.valOperAddress, this.weight});

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
  List<Object?> get protoValues => [valOperAddress, weight];

  @override
  Map<String, dynamic> toJson() {
    return {'val_oper_address': valOperAddress, 'weight': weight};
  }

  factory ValidatorPreference.fromJson(Map<String, dynamic> json) {
    return ValidatorPreference(
      valOperAddress: json.valueAsString<String?>(
        'val_oper_address',
        acceptCamelCase: true,
      ),
      weight: json.valueAsString<String?>('weight', acceptCamelCase: true),
    );
  }

  factory ValidatorPreference.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ValidatorPreference(
      valOperAddress: decode.getString<String?>(1),
      weight: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisValsetprefV1beta1ValidatorPreference;
}
