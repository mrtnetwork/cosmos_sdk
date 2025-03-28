import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_validator_account_response.dart';

/// QueryValidatorAccountRequest is the request type for the
/// Query/ValidatorAccount RPC method.
class EvmosEthermintEVMV1QueryValidatorAccountRequest extends CosmosMessage
    with QueryMessage<EvmosEthermintEVMV1QueryValidatorAccountResponse> {
  /// cons_address is the validator cons address to query the account for.
  final String consAddress;
  const EvmosEthermintEVMV1QueryValidatorAccountRequest(this.consAddress);
  factory EvmosEthermintEVMV1QueryValidatorAccountRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1QueryValidatorAccountRequest(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"cons_address": consAddress};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.validatorAccountRequest;

  @override
  List get values => [consAddress];

  @override
  EvmosEthermintEVMV1QueryValidatorAccountResponse onResponse(List<int> bytes) {
    return EvmosEthermintEVMV1QueryValidatorAccountResponse.deserialize(bytes);
  }

  @override
  EvmosEthermintEVMV1QueryValidatorAccountResponse onJsonResponse(
      Map<String, dynamic> json) {
    return EvmosEthermintEVMV1QueryValidatorAccountResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [consAddress];
}
