import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class ThorchainMsgSend extends CosmosMessage {
  final List<int>? fromAddress;
  final List<int>? toAddress;
  final List<Coin> amount;
  ThorchainMsgSend({
    List<int>? fromAddress,
    List<int>? toAddress,
    required List<Coin> amount,
  })  : amount = amount.mutable,
        fromAddress = BytesUtils.tryToBytes(fromAddress, unmodifiable: true),
        toAddress = BytesUtils.tryToBytes(toAddress, unmodifiable: true);
  factory ThorchainMsgSend.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgSend(
      fromAddress: decode.getField(1),
      toAddress: decode.getField(2),
      amount: decode.getFields(3).map((e) => Coin.deserialize(e)).toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "from_address": BytesUtils.tryToHexString(fromAddress),
      "to_address": BytesUtils.tryToHexString(toAddress),
      "amount": amount.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgSend.typeUrl;

  @override
  List get values => [fromAddress, toAddress, amount];
}
