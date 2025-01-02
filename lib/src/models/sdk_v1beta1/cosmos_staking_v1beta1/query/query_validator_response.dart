import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/messages/validator.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryValidatorResponse is response type for the Query/Validator RPC method
class QueryValidatorResponse extends CosmosMessage {
  /// validator defines the validator info.
  final StakingValidator validator;
  const QueryValidatorResponse(this.validator);
  factory QueryValidatorResponse.fromRpc(Map<String, dynamic> json) {
    return QueryValidatorResponse(StakingValidator.fromRpc(json["validator"]));
  }
  factory QueryValidatorResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryValidatorResponse(
        StakingValidator.deserialize(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"validator": validator.toJson()};
  }

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.queryValidatorResponse;

  @override
  List get values => [validator];
}
