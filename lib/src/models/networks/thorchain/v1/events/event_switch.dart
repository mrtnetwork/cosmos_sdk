import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventSwitch extends CosmosMessage {
  final List<int>? toAddress;
  final String? fromAddress;
  final ThorchainCoin burn;
  final String? txId;
  ThorchainEventSwitch(
      {List<int>? toAddress, this.fromAddress, required this.burn, this.txId})
      : toAddress = BytesUtils.tryToBytes(toAddress, unmodifiable: true);
  factory ThorchainEventSwitch.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventSwitch(
        toAddress: decode.getField(1),
        fromAddress: decode.getField(2),
        burn: ThorchainCoin.deserialize(decode.getField(3)),
        txId: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "to_address": BytesUtils.tryToHexString(toAddress),
      "from_address": fromAddress,
      "burn": burn.toJson(),
      "tx_id": txId
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.eventSwitch.typeUrl;

  @override
  List get values => [toAddress, fromAddress, burn, txId];
}
