import 'package:blockchain_utils/binary/utils.dart';
import 'package:blockchain_utils/numbers/bigint_utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgLoanOpen extends CosmosMessage {
  final String? owner;
  final ThorchainAsset collateralAsset;
  final BigInt collateralAmount;
  final String targetAddress;
  final ThorchainAsset targetAsset;
  final BigInt minOut;
  final String? affiliateAddress;
  final BigInt affiliateBasisPoints;
  final String? aggregator;
  final String? aggregatorTargetAddress;
  final BigInt aggregatorTargetLimit;
  final List<int>? signer;
  final String? txId;
  ThorchainMsgLoanOpen(
      {this.owner,
      required this.collateralAsset,
      required this.collateralAmount,
      required this.targetAddress,
      required this.targetAsset,
      required this.minOut,
      this.affiliateAddress,
      required this.affiliateBasisPoints,
      this.aggregator,
      this.aggregatorTargetAddress,
      required this.aggregatorTargetLimit,
      List<int>? signer,
      this.txId})
      : signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgLoanOpen.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgLoanOpen(
        owner: decode.getField(1),
        collateralAsset: ThorchainAsset.deserialize(decode.getField(2)),
        collateralAmount: BigintUtils.parse(decode.getField<String>(3)),
        targetAddress: decode.getField(4),
        targetAsset: ThorchainAsset.deserialize(decode.getField(5)),
        minOut: BigintUtils.parse(decode.getField<String>(6)),
        affiliateAddress: decode.getField(7),
        affiliateBasisPoints: BigintUtils.parse(decode.getField<String>(8)),
        aggregator: decode.getField(9),
        aggregatorTargetAddress: decode.getField(10),
        aggregatorTargetLimit: BigintUtils.parse(decode.getField<String>(11)),
        signer: decode.getField(12),
        txId: decode.getField(13));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];

  @override
  Map<String, dynamic> toJson() {
    return {
      "owner": owner,
      "collateral_asset": collateralAsset.toJson(),
      "collateral_amount": collateralAmount.toString(),
      "target_address": targetAddress,
      "target_asset": targetAsset.toJson(),
      "min_out": minOut.toString(),
      "affiliate_address": affiliateAddress,
      "affiliate_basis_points": affiliateBasisPoints.toString(),
      "aggregator": aggregator,
      "aggregator_target_address": aggregatorTargetAddress,
      "aggregator_target_limit": aggregatorTargetLimit.toString(),
      "signer": BytesUtils.tryToHexString(signer),
      "tx_id": txId
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgLoanOpen.typeUrl;

  @override
  List get values => [
        owner,
        collateralAsset,
        collateralAmount.toString(),
        targetAddress,
        targetAsset,
        minOut.toString(),
        affiliateAddress,
        affiliateBasisPoints.toString(),
        aggregator,
        aggregatorTargetAddress,
        aggregatorTargetLimit,
        signer,
        txId
      ];
}
