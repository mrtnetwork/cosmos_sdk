import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgDisableTokenizeShares tokenizes a delegation.
///
/// Since: cosmos-sdk 0.47-lsm
class MsgDisableTokenizeShares
    extends StakingV1Beta1Service<EmptyServiceRequestResponse> {
  final String? delegatorAddress;
  const MsgDisableTokenizeShares({required this.delegatorAddress});
  factory MsgDisableTokenizeShares.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgDisableTokenizeShares(delegatorAddress: decode.getField(1));
  }
  factory MsgDisableTokenizeShares.fromJson(Map<String, dynamic> json) {
    return MsgDisableTokenizeShares(
      delegatorAddress: json.as("delegator_address"),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"delegator_address": delegatorAddress};
  }

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.msgDisableTokenizeShares;

  @override
  List get values => [delegatorAddress];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      StakingV1beta1Types.msgDisableTokenizeSharesResponse,
    );
  }

  @override
  List<String?> get signers => [delegatorAddress];
}
