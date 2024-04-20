import 'package:cosmos_sdk/src/address/address/address.dart';
import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_vesting_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// CreatePermanentLockedAccount defines a method that enables creating a permanent locked account.
///
/// Since: cosmos-sdk 0.46
class MsgCreatePermanentLockedAccount extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  final CosmosBaseAddress? fromAddress;
  final CosmosBaseAddress? toAddress;
  final List<Coin> amount;

  /// Constructs a new instance of [MsgCreatePermanentLockedAccount].
  MsgCreatePermanentLockedAccount({
    this.fromAddress,
    this.toAddress,
    required List<Coin> amount,
  }) : amount = amount.mutable;

  factory MsgCreatePermanentLockedAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgCreatePermanentLockedAccount(
        fromAddress: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        toAddress: decode
            .getResult(2)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        amount: decode.getFields(3).map((e) => Coin.deserialize(e)).toList());
  }

  /// Converts this instance of [MsgCreatePermanentLockedAccount] to a JSON object.
  @override
  Map<String, dynamic> toJson() {
    return {
      'from_address': fromAddress?.address,
      'to_address': toAddress?.address,
      'amount': amount.map((coin) => coin.toJson()).toList(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  String get service =>
      VestingV1beta1Types.createPermanentLockedAccount.typeUrl;

  @override
  String get typeUrl =>
      VestingV1beta1Types.msgCreatePermanentLockedAccount.typeUrl;

  @override
  List get values => [fromAddress?.address, toAddress?.address, amount];

  @override
  List<String?> get signers => [fromAddress?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        VestingV1beta1Types.msgCreatePermanentLockedAccountResponse.typeUrl);
  }
}
