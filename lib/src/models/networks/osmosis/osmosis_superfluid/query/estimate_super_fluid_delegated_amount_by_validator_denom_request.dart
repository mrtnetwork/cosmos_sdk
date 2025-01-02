import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'estimate_super_fluid_delegated_amount_by_validator_denom_response.dart';

class OsmosisSuperfluidEstimateSuperfluidDelegatedAmountByValidatorDenomRequest
    extends CosmosMessage
    with
        QueryMessage<
            OsmosisSuperfluidEstimateSuperfluidDelegatedAmountByValidatorDenomResponse> {
  final String? validatorAddress;
  final String? denom;
  const OsmosisSuperfluidEstimateSuperfluidDelegatedAmountByValidatorDenomRequest(
      {this.validatorAddress, this.denom});
  factory OsmosisSuperfluidEstimateSuperfluidDelegatedAmountByValidatorDenomRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidEstimateSuperfluidDelegatedAmountByValidatorDenomRequest(
        validatorAddress: decode.getField(1), denom: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"validator_address": validatorAddress, "denom": denom};
  }

  @override
  TypeUrl get typeUrl => OsmosisSuperfluidTypes
      .estimateSuperfluidDelegatedAmountByValidatorDenomRequest;

  @override
  List get values => [validatorAddress, denom];

  @override
  Map<String, String?> get queryParameters =>
      {"validator_address": validatorAddress, "denom": denom};

  @override
  OsmosisSuperfluidEstimateSuperfluidDelegatedAmountByValidatorDenomResponse
      onJsonResponse(Map<String, dynamic> json) {
    return OsmosisSuperfluidEstimateSuperfluidDelegatedAmountByValidatorDenomResponse
        .fromRpc(json);
  }

  @override
  OsmosisSuperfluidEstimateSuperfluidDelegatedAmountByValidatorDenomResponse
      onResponse(List<int> bytes) {
    return OsmosisSuperfluidEstimateSuperfluidDelegatedAmountByValidatorDenomResponse
        .deserialize(bytes);
  }
}
