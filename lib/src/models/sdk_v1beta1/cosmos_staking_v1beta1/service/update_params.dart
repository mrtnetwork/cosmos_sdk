import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import '../messages/params.dart';

/// MsgUpdateParams is the Msg/UpdateParams request type.
/// Since: cosmos-sdk 0.47
class StakingMsgUpdateParams extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten)
  final CosmosBaseAddress? authority;

  /// params defines the x/staking parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final StakingParams params;

  const StakingMsgUpdateParams({
    required this.authority,
    required this.params,
  });

  factory StakingMsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return StakingMsgUpdateParams(
        authority: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        params: StakingParams.deserialize(decode.getField(2)));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority?.address,
      'params': params.toJson(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.stakingMsgUpdateParams;

  @override
  List get values => [authority?.address, params];

  @override
  TypeUrl get service => StakingV1beta1Types.updateParams;
  @override
  List<String?> get signers => [authority?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        StakingV1beta1Types.stakingMsgUpdateParamsResponse);
  }
}
