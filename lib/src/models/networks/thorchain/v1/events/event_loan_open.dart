import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventLoanOpen extends CosmosMessage {
  final BigInt collateralDeposited;
  final ThorchainAsset collateralAsset;
  final BigInt collateralizationRatio;
  final BigInt debtIssued;
  final String? owner;
  final ThorchainAsset targetAsset;
  final String? txId;
  const ThorchainEventLoanOpen({
    required this.collateralDeposited,
    required this.collateralAsset,
    required this.collateralizationRatio,
    required this.debtIssued,
    this.owner,
    required this.targetAsset,
    this.txId,
  });
  factory ThorchainEventLoanOpen.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventLoanOpen(
      collateralDeposited: BigInt.parse(decode.getField(1)),
      collateralAsset: ThorchainAsset.deserialize(decode.getField(2)),
      collateralizationRatio: BigInt.parse(decode.getField(3)),
      debtIssued: BigInt.parse(decode.getField(4)),
      owner: decode.getField(5),
      targetAsset: ThorchainAsset.deserialize(decode.getField(6)),
      txId: decode.getField(7),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  Map<String, dynamic> toJson() {
    return {
      "collateral_deposited": collateralDeposited.toString(),
      "collateral_asset": collateralAsset.toJson(),
      "collateralization_ratio": collateralizationRatio.toString(),
      "debt_issued": debtIssued.toString(),
      "owner": owner,
      "target_asset": targetAsset.toJson(),
      "tx_id": txId,
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.eventLoanOpen;

  @override
  List get values => [
    collateralDeposited.toString(),
    collateralAsset,
    collateralizationRatio.toString(),
    debtIssued.toString(),
    owner,
    targetAsset,
    txId,
  ];
}
