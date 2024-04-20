import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

import 'msg_begin_redelegate_response.dart';

/// MsgBeginRedelegate defines a SDK message for performing a redelegation of coins from a
/// delegator and source validator to a destination validator.
class MsgBeginRedelegate extends CosmosMessage
    with ServiceMessage<MsgBeginRedelegateResponse> {
  final CosmosBaseAddress? delegatorAddress;
  final CosmosBaseAddress? validatorSrcAddress;
  final CosmosBaseAddress? validatorDstAddress;
  final Coin amount;

  const MsgBeginRedelegate({
    this.delegatorAddress,
    this.validatorSrcAddress,
    this.validatorDstAddress,
    required this.amount,
  });
  factory MsgBeginRedelegate.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgBeginRedelegate(
        delegatorAddress: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        validatorSrcAddress: decode
            .getResult(2)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        validatorDstAddress: decode
            .getResult(3)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        amount: Coin.deserialize(decode.getField(4)));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_address': delegatorAddress?.address,
      'validator_src_address': validatorSrcAddress?.address,
      'validator_dst_address': validatorDstAddress?.address,
      'amount': amount.toJson(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  String get typeUrl => StakingV1beta1Types.msgBeginRedelegate.typeUrl;

  @override
  List get values => [
        delegatorAddress?.address,
        validatorSrcAddress?.address,
        validatorDstAddress?.address,
        amount
      ];

  @override
  String get service => StakingV1beta1Types.beginRedelegate.typeUrl;

  @override
  List<String?> get signers => [delegatorAddress?.address];

  @override
  MsgBeginRedelegateResponse onResponse(List<int> bytes) {
    return MsgBeginRedelegateResponse.fromBytes(bytes);
  }
}
