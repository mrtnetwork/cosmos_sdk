class ThorCoinResponse {
  final String asset;
  final String amount;
  final int? decimals;

  ThorCoinResponse({
    required this.asset,
    required this.amount,
    required this.decimals,
  });

  factory ThorCoinResponse.fromJson(Map<String, dynamic> json) {
    return ThorCoinResponse(
      asset: json['asset'],
      amount: json['amount'],
      decimals: json['decimals'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'asset': asset,
      'amount': amount,
      'decimals': decimals,
    };
  }
}
