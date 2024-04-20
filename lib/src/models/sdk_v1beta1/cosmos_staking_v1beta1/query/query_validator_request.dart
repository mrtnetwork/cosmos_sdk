import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/query/query_validator_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryValidatorRequest is response type for the Query/Validator RPC method
class QueryValidatorRequest extends CosmosMessage
    with QueryMessage<QueryValidatorResponse> {
  /// validator_addr defines the validator address to query for.
  final CosmosBaseAddress? validatorAddr;
  const QueryValidatorRequest(this.validatorAddr);
  factory QueryValidatorRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryValidatorRequest(decode
        .getResult(1)
        ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"validator_addr": validatorAddr?.address};
  }

  @override
  String get typeUrl => StakingV1beta1Types.queryValidatorRequest.typeUrl;

  @override
  List get values => [validatorAddr];

  @override
  String get queryPath => StakingV1beta1Types.validator.typeUrl;

  @override
  QueryValidatorResponse onResponse(List<int> bytes) {
    return QueryValidatorResponse.deserialize(bytes);
  }
}
