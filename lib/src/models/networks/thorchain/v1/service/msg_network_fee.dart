import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgNetworkFee extends CosmosMessage {
  final BigInt? blockHeight;
  final String? chain;
  final BigInt? transactionSize;
  final BigInt? transactionFeeRate;
  final List<int>? signer;
  ThorchainMsgNetworkFee(
      {this.blockHeight,
      this.chain,
      this.transactionSize,
      this.transactionFeeRate,
      List<int>? signer})
      : signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgNetworkFee.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgNetworkFee(
        blockHeight: decode.getField(1),
        chain: decode.getField(2),
        transactionSize: decode.getField(3),
        transactionFeeRate: decode.getField(4),
        signer: decode.getField(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "block_height": blockHeight?.toString(),
      "chain": chain,
      "transaction_size": transactionSize?.toString(),
      "transaction_fee_rate": transactionFeeRate?.toString(),
      "signer": BytesUtils.tryToHexString(signer),
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgNetworkFee.typeUrl;

  @override
  List get values =>
      [blockHeight, chain, transactionSize, transactionFeeRate, signer];
}
