import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Params holds parameters for the superfluid module
class OsmosisSuperfluidParams extends CosmosMessage {
  /// minimum_risk_factor is to be cut on OSMO equivalent value of lp tokens for
  /// superfluid staking, default: 5%. The minimum risk factor works
  /// to counter-balance the staked amount on chain's exposure to various asset
  /// volatilities, and have base staking be 'resistant' to volatility.
  final String minimumRiskFactor;

  const OsmosisSuperfluidParams(this.minimumRiskFactor);
  factory OsmosisSuperfluidParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidParams(decode.getField(1));
  }
  factory OsmosisSuperfluidParams.fromRpc(Map<String, dynamic> json) {
    return OsmosisSuperfluidParams(json["minimum_risk_factor"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"minimum_risk_factor": minimumRiskFactor};
  }

  @override
  TypeUrl get typeUrl => OsmosisSuperfluidTypes.params;

  @override
  List get values => [minimumRiskFactor];
}
