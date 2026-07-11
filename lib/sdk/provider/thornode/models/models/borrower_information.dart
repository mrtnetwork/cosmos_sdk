class AssetBorrowerPositionResponse {
  final String owner;
  final String asset;
  final String debtIssued;
  final String debtRepaid;
  final String debtCurrent;
  final String collateralDeposited;
  final String collateralWithdrawn;
  final String collateralCurrent;
  final int lastOpenHeight;
  final int lastRepayHeight;

  const AssetBorrowerPositionResponse({
    required this.owner,
    required this.asset,
    required this.debtIssued,
    required this.debtRepaid,
    required this.debtCurrent,
    required this.collateralDeposited,
    required this.collateralWithdrawn,
    required this.collateralCurrent,
    required this.lastOpenHeight,
    required this.lastRepayHeight,
  });

  factory AssetBorrowerPositionResponse.fromJson(Map<String, dynamic> json) {
    return AssetBorrowerPositionResponse(
      owner: json['owner'],
      asset: json['asset'],
      debtIssued: json['debt_issued'],
      debtRepaid: json['debt_repaid'],
      debtCurrent: json['debt_current'],
      collateralDeposited: json['collateral_deposited'],
      collateralWithdrawn: json['collateral_withdrawn'],
      collateralCurrent: json['collateral_current'],
      lastOpenHeight: json['last_open_height'],
      lastRepayHeight: json['last_repay_height'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'owner': owner,
      'asset': asset,
      'debt_issued': debtIssued,
      'debt_repaid': debtRepaid,
      'debt_current': debtCurrent,
      'collateral_deposited': collateralDeposited,
      'collateral_withdrawn': collateralWithdrawn,
      'collateral_current': collateralCurrent,
      'last_open_height': lastOpenHeight,
      'last_repay_height': lastRepayHeight,
    };
  }
}
