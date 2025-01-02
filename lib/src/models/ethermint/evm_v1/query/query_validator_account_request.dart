import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_validator_account_response.dart';

/// QueryValidatorAccountRequest is the request type for the
/// Query/ValidatorAccount RPC method.
class EVMV1QueryValidatorAccountRequest extends CosmosMessage
    with QueryMessage<EVMV1QueryValidatorAccountResponse> {
  /// cons_address is the validator cons address to query the account for.
  final String consAddress;
  const EVMV1QueryValidatorAccountRequest(this.consAddress);
  factory EVMV1QueryValidatorAccountRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1QueryValidatorAccountRequest(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"cons_address": consAddress};
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.validatorAccountRequest;

  @override
  List get values => [consAddress];

  @override
  EVMV1QueryValidatorAccountResponse onResponse(List<int> bytes) {
    return EVMV1QueryValidatorAccountResponse.deserialize(bytes);
  }

  @override
  EVMV1QueryValidatorAccountResponse onJsonResponse(Map<String, dynamic> json) {
    return EVMV1QueryValidatorAccountResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters => [consAddress];
}
