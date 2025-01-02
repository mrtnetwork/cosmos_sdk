import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_vesting_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgCreateVestingAccount defines a message that enables creating a vesting account.
class MsgCreateVestingAccount extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  final CosmosBaseAddress? fromAddress;
  final CosmosBaseAddress? toAddress;
  final List<Coin> amount;

  /// end of vesting as unix time (in seconds).
  final BigInt? endTime;
  final bool delayed;

  /// start of vesting as unix time (in seconds).
  ///
  /// Since 0.51.x
  final BigInt? startTime;

  /// Constructs a new instance of [MsgCreateVestingAccount].
  const MsgCreateVestingAccount({
    required this.fromAddress,
    required this.toAddress,
    required this.amount,
    required this.endTime,
    required this.delayed,
    required this.startTime,
  });
  factory MsgCreateVestingAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgCreateVestingAccount(
        fromAddress: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        toAddress: decode
            .getResult(2)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        amount: decode.getFields(3).map((e) => Coin.deserialize(e)).toList(),
        endTime: decode.getField(4),
        delayed: decode.getField(5),
        startTime: decode.getField(6));
  }

  /// Converts this instance of [MsgCreateVestingAccount] to a JSON object.
  @override
  Map<String, dynamic> toJson() {
    return {
      'from_address': fromAddress?.address,
      'to_address': toAddress?.address,
      'amount': amount.map((coin) => coin.toJson()).toList(),
      'end_time': endTime?.toString(),
      'delayed': delayed,
      'start_time': startTime?.toString(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  TypeUrl get service => VestingV1beta1Types.createVestingAccount;

  @override
  TypeUrl get typeUrl => VestingV1beta1Types.msgCreateVestingAccount;

  @override
  List get values => [
        fromAddress?.address,
        toAddress?.address,
        amount,
        endTime,
        delayed,
        startTime
      ];

  @override
  List<String?> get signers => [fromAddress?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        VestingV1beta1Types.msgCreateVestingAccountResponse);
  }
}
