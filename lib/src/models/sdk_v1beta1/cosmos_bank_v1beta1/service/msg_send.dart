import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgSend represents a message to send coins from one account to another.
class MsgSend extends BankV1Beta1Service<EmptyServiceRequestResponse>
    with AminoMessage<EmptyServiceRequestResponse> {
  final CosmosBaseAddress fromAddress;
  final CosmosBaseAddress toAddress;
  final List<Coin> amount;
  factory MsgSend.fromJson(Map<String, dynamic> json) {
    return MsgSend(
      fromAddress: CosmosBaseAddress(json.as("from_address")),
      toAddress: CosmosBaseAddress(json.as("to_address")),
      amount: json.asListOfMap("amount")!.map((e) => Coin.fromJson(e)).toList(),
    );
  }

  MsgSend({
    required this.fromAddress,
    required this.toAddress,
    required List<Coin> amount,
  }) : amount = amount.immutable;
  factory MsgSend.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgSend(
      fromAddress: CosmosBaseAddress(decode.getField(1)),
      toAddress: CosmosBaseAddress(decode.getField(2)),
      amount:
          decode
              .getFields<List<int>>(3)
              .map((e) => Coin.deserialize(e))
              .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "amount": amount.map((e) => e.toJson()).toList(),
      "from_address": fromAddress.address,
      "to_address": toAddress.address,
    };
  }

  @override
  List get values => [fromAddress.address, toAddress.address, amount];

  @override
  @override
  TypeUrl get typeUrl => BankV1beta1Types.msgSend;

  @override
  List<String?> get signers => [fromAddress.address];
  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(BankV1beta1Types.msgSendResponse);
  }
}
