import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/messages/validator.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryDelegatorValidatorResponse response type for the Query/DelegatorValidator RPC method.
class QueryDelegatorValidatorResponse extends CosmosMessage {
  /// validator defines the validator info.
  final StakingValidator validator;
  const QueryDelegatorValidatorResponse(this.validator);
  factory QueryDelegatorValidatorResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryDelegatorValidatorResponse(
        StakingValidator.deserialize(decode.getField(1)));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"validator": validator.toJson()};
  }

  @override
  String get typeUrl =>
      StakingV1beta1Types.queryDelegatorValidatorResponse.typeUrl;

  @override
  List get values => [validator];
}
