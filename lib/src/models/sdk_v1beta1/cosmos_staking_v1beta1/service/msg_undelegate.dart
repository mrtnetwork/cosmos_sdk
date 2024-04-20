import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

import 'msg_undelegate_response.dart';

/// MsgUndelegate defines a SDK message for performing an undelegation from a delegate and a validator.
class MsgUndelegate extends CosmosMessage
    with ServiceMessage<MsgUndelegateResponse> {
  final CosmosBaseAddress? delegatorAddress;
  final CosmosBaseAddress? validatorAddress;
  final Coin amount;

  const MsgUndelegate({
    this.delegatorAddress,
    this.validatorAddress,
    required this.amount,
  });
  factory MsgUndelegate.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgUndelegate(
        delegatorAddress: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        validatorAddress: decode
            .getResult(2)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        amount: Coin.deserialize(decode.getField(3)));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_address': delegatorAddress?.address,
      'validator_address': validatorAddress?.address,
      'amount': amount.toJson(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  String get typeUrl => StakingV1beta1Types.msgUndelegate.typeUrl;

  @override
  List get values =>
      [delegatorAddress?.address, validatorAddress?.address, amount];

  @override
  String get service => StakingV1beta1Types.undelegate.typeUrl;
  @override
  List<String?> get signers => [delegatorAddress?.address];

  @override
  MsgUndelegateResponse onResponse(List<int> bytes) {
    return MsgUndelegateResponse.deserialize(bytes);
  }
}
