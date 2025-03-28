import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgBurn defines a message for burning coins.
/// Since: cosmos-sdk 0.51
class MsgBurn extends BankV1Beta1Service<EmptyServiceRequestResponse> {
  final CosmosBaseAddress address;
  final List<Coin> amount;

  const MsgBurn({required this.address, required this.amount});
  factory MsgBurn.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgBurn(
        address: CosmosBaseAddress(decode.getField(1)),
        amount: decode
            .getFields<List<int>>(2)
            .map((e) => Coin.deserialize(e))
            .toList());
  }
  factory MsgBurn.fromJson(Map<String, dynamic> json) {
    return MsgBurn(
        address: CosmosBaseAddress(json.as("address")),
        amount:
            json.asListOfMap("amount")!.map((e) => Coin.fromJson(e)).toList());
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
  TypeUrl get typeUrl => BankV1beta1Types.msgBurn;

  @override
  List<String?> get signers => [address.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(BankV1beta1Types.msgBurnResponse);
  }
}
