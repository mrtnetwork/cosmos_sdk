import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'msg_enable_tokenize_shares_response.dart';

/// MsgEnableTokenizeShares re-enables tokenization of shares for a given address.
///
/// Since: cosmos-sdk 0.47-lsm
class MsgEnableTokenizeShares
    extends StakingV1Beta1Service<MsgEnableTokenizeSharesResponse> {
  final String? delegatorAddress;
  const MsgEnableTokenizeShares({required this.delegatorAddress});
  factory MsgEnableTokenizeShares.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgEnableTokenizeShares(delegatorAddress: decode.getField(1));
  }
  factory MsgEnableTokenizeShares.fromJson(Map<String, dynamic> json) {
    return MsgEnableTokenizeShares(
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
  TypeUrl get typeUrl => StakingV1beta1Types.msgEnableTokenizeShares;

  @override
  List get values => [delegatorAddress];

  @override
  MsgEnableTokenizeSharesResponse onResponse(List<int> bytes) {
    return MsgEnableTokenizeSharesResponse.deserialize(bytes);
  }

  @override
  List<String?> get signers => [delegatorAddress];
}
