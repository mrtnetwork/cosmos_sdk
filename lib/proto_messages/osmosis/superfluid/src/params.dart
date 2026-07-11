import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Params holds parameters for the superfluid module
class Params extends CosmosProtoMessage {
  /// minimum_risk_factor is to be cut on OSMO equivalent value of lp tokens for
  /// superfluid staking, default: 5%. The minimum risk factor works
  /// to counter-balance the staked amount on chain's exposure to various asset
  /// volatilities, and have base staking be 'resistant' to volatility.
  final String? minimumRiskFactor;

  const Params({this.minimumRiskFactor});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [minimumRiskFactor];

  @override
  Map<String, dynamic> toJson() {
    return {'minimum_risk_factor': minimumRiskFactor};
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      minimumRiskFactor: json.valueAsString<String?>(
        'minimum_risk_factor',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(minimumRiskFactor: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidParams;
}
