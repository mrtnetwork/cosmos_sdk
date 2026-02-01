import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/service/msg_tokenize_share_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgTokenizeShares tokenizes a delegation.
///
/// Since: cosmos-sdk 0.47-lsm
class MsgTokenizeShares
    extends StakingV1Beta1Service<MsgTokenizeSharesResponse> {
  final String? delegatorAddress;
  final String? validatorAddress;
  final Coin? amount;
  final String? tokenizedShareOwner;

  const MsgTokenizeShares({
    required this.delegatorAddress,
    required this.validatorAddress,
    required this.amount,
    required this.tokenizedShareOwner,
  });
  factory MsgTokenizeShares.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgTokenizeShares(
      validatorAddress: decode.getField(2),
      delegatorAddress: decode.getField(1),
      amount: decode.getResult(3)?.to<Coin, List<int>>(Coin.deserialize),
      tokenizedShareOwner: decode.getField(4),
    );
  }
  factory MsgTokenizeShares.fromJson(Map<String, dynamic> json) {
    return MsgTokenizeShares(
      validatorAddress: json.as("validator_address"),
      delegatorAddress: json.as("delegator_address"),
      amount: json.maybeAs<Coin, Map<String, dynamic>>(
        key: "amount",
        onValue: Coin.fromJson,
      ),
      tokenizedShareOwner: json.as("tokenized_share_owner"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "delegator_address": delegatorAddress,
      "validator_address": validatorAddress,
      "amount": amount?.toJson(),
      "tokenized_share_owner": tokenizedShareOwner,
    };
  }

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.msgTokenizeShares;

  @override
  List get values => [
    delegatorAddress,
    validatorAddress,
    amount,
    tokenizedShareOwner,
  ];

  @override
  MsgTokenizeSharesResponse onResponse(List<int> bytes) {
    return MsgTokenizeSharesResponse.deserialize(bytes);
  }

  @override
  List<String?> get signers => [delegatorAddress];
}
