import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventSwitchV87 extends CosmosMessage {
  final List<int>? toAddress;
  final String? fromAddress;
  final ThorchainCoin burn;
  final String? txId;
  final BigInt mint;
  ThorchainEventSwitchV87(
      {List<int>? toAddress,
      this.fromAddress,
      required this.burn,
      this.txId,
      required this.mint})
      : toAddress = BytesUtils.tryToBytes(toAddress);
  factory ThorchainEventSwitchV87.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventSwitchV87(
      toAddress: decode.getField(1),
      fromAddress: decode.getField(2),
      burn: ThorchainCoin.deserialize(decode.getField(3)),
      txId: decode.getField(4),
      mint: BigInt.parse(decode.getField(5)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "to_address": BytesUtils.tryToHexString(toAddress),
      "from_address": fromAddress,
      "burn": burn.toJson(),
      "tx_id": txId,
      "mint": mint.toString()
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.eventSwitchV87;

  @override
  List get values => [toAddress, fromAddress, burn, txId, mint.toString()];
}
