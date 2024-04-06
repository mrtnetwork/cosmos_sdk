import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainLoan extends CosmosMessage {
  final String? owner;
  final ThorchainAsset asset;
  final BigInt debtIssued;
  final BigInt debtRepaid;
  final BigInt collateralDeposited;
  final BigInt collateralWithdrawn;
  final BigInt? lastOpenHeight;
  final BigInt? lastRepayHeight;
  ThorchainLoan(
      {this.owner,
      required this.asset,
      required this.debtIssued,
      required this.debtRepaid,
      required this.collateralDeposited,
      required this.collateralWithdrawn,
      this.lastOpenHeight,
      this.lastRepayHeight});
  factory ThorchainLoan.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainLoan(
        owner: decode.getField(1),
        asset: ThorchainAsset.deserialize(decode.getField(2)),
        debtIssued: BigInt.parse(decode.getField(3)),
        debtRepaid: BigInt.parse(decode.getField(4)),
        collateralDeposited: BigInt.parse(decode.getField(5)),
        collateralWithdrawn: BigInt.parse(decode.getField(6)),
        lastOpenHeight: decode.getField(9),
        lastRepayHeight: decode.getField(10));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 9, 10];

  @override
  Map<String, dynamic> toJson() {
    return {
      "owner": owner,
      "asset": asset.toJson(),
      "debt_issued": debtIssued.toString(),
      "debt_repaid": debtRepaid.toString(),
      "collateral_deposited": collateralDeposited.toString(),
      "collateral_withdrawn": collateralWithdrawn.toString(),
      "last_open_height": lastOpenHeight?.toString(),
      "last_repay_height": lastRepayHeight?.toString()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.loan.typeUrl;

  @override
  List get values => [
        owner,
        asset,
        debtIssued.toString(),
        debtRepaid.toString(),
        collateralDeposited.toString(),
        collateralWithdrawn.toString(),
        lastOpenHeight,
        lastRepayHeight
      ];
}
