import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainObservedNetworkFeeVoter extends CosmosMessage {
  final BigInt? blockHeight;
  final BigInt? reportBlockHeight;
  final String? chain;
  final List<String>? signers;
  final BigInt? feeRate;
  final BigInt? transactionSize;
  ThorchainObservedNetworkFeeVoter(
      {this.blockHeight,
      this.reportBlockHeight,
      this.chain,
      List<String>? signers,
      this.feeRate,
      this.transactionSize})
      : signers = signers?.emptyAsNull?.immutable;
  factory ThorchainObservedNetworkFeeVoter.deserialized(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainObservedNetworkFeeVoter(
        blockHeight: decode.getField(1),
        reportBlockHeight: decode.getField(2),
        chain: decode.getField(3),
        signers: decode.getFields(4),
        feeRate: decode.getField(5),
        transactionSize: decode.getField(6));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "block_height": blockHeight?.toString(),
      "report_block_height": reportBlockHeight?.toString(),
      "chain": chain,
      "signers": signers,
      "fee_rate": feeRate?.toString(),
      "transaction_size": transactionSize?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.observedNetworkFeeVoter;

  @override
  List get values => [
        blockHeight,
        reportBlockHeight,
        chain,
        signers,
        feeRate,
        transactionSize
      ];
}
