import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/core/service.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class ThorchainMsgSend extends ThorchainV1Service<EmptyServiceRequestResponse> {
  final CosmosBaseAddress fromAddress;
  final CosmosBaseAddress toAddress;
  final List<Coin> amount;
  ThorchainMsgSend({
    required this.fromAddress,
    required this.toAddress,
    required List<Coin> amount,
  }) : amount = amount.immutable;
  factory ThorchainMsgSend.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgSend(
      fromAddress: CosmosBaseAddress.fromBytes(decode.getField(1)),
      toAddress: CosmosBaseAddress.fromBytes(decode.getField(2)),
      amount: decode
          .getFields<List<int>>(3)
          .map((e) => Coin.deserialize(e))
          .toList(),
    );
  }
  factory ThorchainMsgSend.fromJson(Map<String, dynamic> json) {
    return ThorchainMsgSend(
      fromAddress: CosmosBaseAddress.fromBytes(
          json.asBytes("from_address", throwOnNull: true)!),
      toAddress: CosmosBaseAddress.fromBytes(
          json.asBytes("to_address", throwOnNull: true)!),
      amount:
          json.asListOfMap("amount")?.map((e) => Coin.fromJson(e)).toList() ??
              [],
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "from_address": fromAddress.address,
      "to_address": toAddress.address,
      "amount": amount.map((e) => e.toJson()).toList()
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.msgSend;

  @override
  List get values => [fromAddress.toBytes(), toAddress.toBytes(), amount];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(typeUrl);
  }

  @override
  List<String?> get signers => [fromAddress.address];
}
