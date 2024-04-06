import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgBurn defines a message for burning coins.
/// Since: cosmos-sdk 0.51
class MsgBurn extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  final BaseAddress address;
  final List<Coin> amount;

  const MsgBurn({required this.address, required this.amount});
  factory MsgBurn.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgBurn(
        address: BaseAddress(decode.getField(1)),
        amount: decode
            .getFields<List<int>>(2)
            .map((e) => Coin.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "address": address.address,
      "amount": amount.map((e) => e.toJson()).toList()
    };
  }

  @override
  List get values => [address.address, amount];

  @override
  @override
  String get typeUrl => BankV1beta1Types.msgBurn.typeUrl;
  @override
  String get service => BankV1beta1Types.burn.typeUrl;

  @override
  List<String?> get signers => [address.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        BankV1beta1Types.msgBurnResponse.typeUrl);
  }
}
