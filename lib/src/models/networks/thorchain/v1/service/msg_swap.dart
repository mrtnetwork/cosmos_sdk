import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/common/asset.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/common/tx.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/messages/order_type.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgSwap extends CosmosMessage {
  final ThorchainTx tx;
  final ThorchainAsset targetAsset;
  final String? destination;
  final BigInt tradeTarget;
  final String? affiliateAddress;
  final BigInt affiliateBasisPoints;
  final List<int>? signer;
  final String? aggregator;
  final String? aggregatorTargetAddress;
  final BigInt? aggregatorTargetLimit;
  final ThorchainOrderType? orderType;
  final BigInt? streamQuantity;
  final BigInt? streamInterval;
  ThorchainMsgSwap(
      {required this.tx,
      required this.targetAsset,
      this.destination,
      required this.tradeTarget,
      this.affiliateAddress,
      required this.affiliateBasisPoints,
      List<int>? signer,
      this.aggregator,
      this.aggregatorTargetAddress,
      this.aggregatorTargetLimit,
      this.orderType,
      this.streamQuantity,
      this.streamInterval})
      : signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgSwap.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgSwap(
      tx: ThorchainTx.deserialize(decode.getField(1)),
      targetAsset: ThorchainAsset.deserialize(decode.getField(2)),
      destination: decode.getField(3),
      tradeTarget: BigintUtils.parse(decode.getField<String>(4)),
      affiliateAddress: decode.getField(5),
      affiliateBasisPoints: BigintUtils.parse(decode.getField<String>(6)),
      signer: decode.getField(7),
      aggregator: decode.getField(8),
      aggregatorTargetAddress: decode.getField(9),
      aggregatorTargetLimit: BigintUtils.tryParse(decode.getField<String?>(10)),
      orderType: decode
          .getResult(11)
          ?.to<ThorchainOrderType, int>((e) => ThorchainOrderType.fromValue(e)),
      streamQuantity: decode.getField(12),
      streamInterval: decode.getField(13),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx": tx.toJson(),
      "target_asset": targetAsset.toJson(),
      "destination": destination,
      "trade_target": tradeTarget.toString(),
      "affiliate_address": affiliateAddress,
      "affiliate_basis_points": affiliateBasisPoints.toString(),
      "signer": BytesUtils.tryToHexString(signer),
      "aggregator": aggregator,
      "aggregator_target_address": aggregatorTargetAddress,
      "aggregator_target_limit": aggregatorTargetLimit?.toString(),
      "order_type": orderType?.value,
      "stream_quantity": streamQuantity?.toString(),
      "stream_interval": streamInterval?.toString()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgSwap.typeUrl;

  @override
  List get values => [
        tx,
        targetAsset,
        destination,
        tradeTarget.toString(),
        affiliateAddress,
        affiliateBasisPoints.toString(),
        signer,
        aggregator,
        aggregatorTargetAddress,
        aggregatorTargetLimit?.toString(),
        orderType?.name,
        streamQuantity,
        streamInterval
      ];
}
