import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/address/address/address.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/common/asset.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/common/tx.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/messages/order_type.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

class ThorchainMsgSwap extends ThorchainV1Service<EmptyServiceRequestResponse> {
  final ThorchainTx tx;
  final ThorchainAsset targetAsset;
  final String? destination;
  final BigInt tradeTarget;
  final String? affiliateAddress;
  final BigInt affiliateBasisPoints;
  final CosmosBaseAddress? signer;
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
      this.signer,
      this.aggregator,
      this.aggregatorTargetAddress,
      this.aggregatorTargetLimit,
      this.orderType,
      this.streamQuantity,
      this.streamInterval});
  factory ThorchainMsgSwap.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgSwap(
      tx: ThorchainTx.deserialize(decode.getField(1)),
      targetAsset: ThorchainAsset.deserialize(decode.getField(2)),
      destination: decode.getField(3),
      tradeTarget: BigintUtils.parse(decode.getField<String>(4)),
      affiliateAddress: decode.getField(5),
      affiliateBasisPoints: BigintUtils.parse(decode.getField<String>(6)),
      signer: decode.getResult(7)?.to<CosmosBaseAddress, List<int>>(
          (e) => CosmosBaseAddress.fromBytes(e)),
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
  factory ThorchainMsgSwap.fromJson(Map<String, dynamic> json) {
    return ThorchainMsgSwap(
      tx: ThorchainTx.fromJson(json.asMap("tx")),
      targetAsset: ThorchainAsset.fromJson(json.asMap("target_asset")),
      destination: json.as("destination"),
      tradeTarget: json.asBigInt("trade_target"),
      affiliateAddress: json.as("affiliate_address"),
      affiliateBasisPoints: json.asBigInt("affiliate_basis_points"),
      signer: json.maybeAs<CosmosBaseAddress, String>(
        key: "signer",
        onValue: (e) {
          return CosmosBaseAddress.fromBytes(CosmosUtils.toBytes(e));
        },
      ),
      aggregator: json.as("aggregator"),
      aggregatorTargetAddress: json.as("aggregator_target_address"),
      aggregatorTargetLimit: json.asBigInt("aggregator_target_limit"),
      orderType: json.maybeAs<ThorchainOrderType, String>(
          key: "order_type", onValue: ThorchainOrderType.fromValue),
      streamQuantity: json.asBigInt("stream_quantity"),
      streamInterval: json.asBigInt("stream_interval"),
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
      "signer": signer?.address,
      "aggregator": aggregator,
      "aggregator_target_address": aggregatorTargetAddress,
      "aggregator_target_limit": aggregatorTargetLimit?.toString(),
      "order_type": orderType?.value,
      "stream_quantity": streamQuantity?.toString(),
      "stream_interval": streamInterval?.toString()
    };
  }

  @override
  ThorchainV1Types get typeUrl => ThorchainV1Types.msgSwap;

  @override
  List get values => [
        tx,
        targetAsset,
        destination,
        tradeTarget.toString(),
        affiliateAddress,
        affiliateBasisPoints.toString(),
        signer?.toBytes(),
        aggregator,
        aggregatorTargetAddress,
        aggregatorTargetLimit?.toString(),
        orderType?.name,
        streamQuantity,
        streamInterval
      ];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(typeUrl);
  }

  @override
  List<String?> get signers => [signer?.address];
}
