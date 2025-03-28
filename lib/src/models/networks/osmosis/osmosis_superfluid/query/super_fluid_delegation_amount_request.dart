import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'super_fluid_delegation_amount_response.dart';

class OsmosisSuperfluidSuperfluidDelegationAmountRequest extends CosmosMessage
    with QueryMessage<OsmosisSuperfluidSuperfluidDelegationAmountResponse> {
  final String? delegatorAddress;
  final String? validatorAddress;
  final String? denom;
  const OsmosisSuperfluidSuperfluidDelegationAmountRequest(
      {this.delegatorAddress, this.validatorAddress, this.denom});
  factory OsmosisSuperfluidSuperfluidDelegationAmountRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidSuperfluidDelegationAmountRequest(
        delegatorAddress: decode.getField(1),
        validatorAddress: decode.getField(2),
        denom: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "delegator_address": delegatorAddress,
      "validator_address": validatorAddress,
      "denom": denom
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisSuperfluidTypes.superfluidDelegationAmountRequest;

  @override
  List get values => [delegatorAddress, validatorAddress, denom];

  @override
  Map<String, String?> get queryParameters => {
        "delegator_address": delegatorAddress,
        "validator_address": validatorAddress,
        "denom": denom
      };

  @override
  OsmosisSuperfluidSuperfluidDelegationAmountResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidSuperfluidDelegationAmountResponse.fromJson(json);
  }

  @override
  OsmosisSuperfluidSuperfluidDelegationAmountResponse onResponse(
      List<int> bytes) {
    return OsmosisSuperfluidSuperfluidDelegationAmountResponse.deserialize(
        bytes);
  }
}
