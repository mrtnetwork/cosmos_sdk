import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'super_fluid_delegations_by_validator_denom_response.dart';

class OsmosisSuperfluidSuperfluidDelegationsByValidatorDenomRequest
    extends CosmosMessage
    with
        QueryMessage<
            OsmosisSuperfluidSuperfluidDelegationsByValidatorDenomResponse>,
        RPCMessage<
            OsmosisSuperfluidSuperfluidDelegationsByValidatorDenomResponse> {
  final String? validatorAddress;
  final String? denom;
  const OsmosisSuperfluidSuperfluidDelegationsByValidatorDenomRequest(
      {this.validatorAddress, this.denom});
  factory OsmosisSuperfluidSuperfluidDelegationsByValidatorDenomRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidSuperfluidDelegationsByValidatorDenomRequest(
        validatorAddress: decode.getField(1), denom: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"validator_address": validatorAddress, "denom": denom};
  }

  @override
  String get typeUrl => OsmosisSuperfluidTypes
      .superfluidDelegationsByValidatorDenomRequest.typeUrl;

  @override
  List get values => [validatorAddress, denom];

  @override
  Map<String, String?> get queryParameters =>
      {"denom": denom, "validator_address": validatorAddress};

  @override
  String get queryPath =>
      OsmosisSuperfluidTypes.superfluidDelegationsByValidatorDenom.typeUrl;

  @override
  String get rpcPath =>
      OsmosisSuperfluidTypes.superfluidDelegationsByValidatorDenom
          .rpcUrl(pathParameters: []);

  @override
  OsmosisSuperfluidSuperfluidDelegationsByValidatorDenomResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidSuperfluidDelegationsByValidatorDenomResponse
        .fromRpc(json);
  }

  @override
  OsmosisSuperfluidSuperfluidDelegationsByValidatorDenomResponse onResponse(
      List<int> bytes) {
    return OsmosisSuperfluidSuperfluidDelegationsByValidatorDenomResponse
        .deserialize(bytes);
  }
}
