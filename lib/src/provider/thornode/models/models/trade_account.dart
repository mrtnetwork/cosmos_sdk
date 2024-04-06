class ThorTradeAccountResponse {
  final String asset;
  final String units;
  final String owner;
  final int lastAddHeight;
  final int lastWithdrawHeight;

  ThorTradeAccountResponse({
    required this.asset,
    required this.units,
    required this.owner,
    required this.lastAddHeight,
    required this.lastWithdrawHeight,
  });

  factory ThorTradeAccountResponse.fromJson(Map<String, dynamic> json) {
    return ThorTradeAccountResponse(
      asset: json['asset'],
      units: json['units'],
      owner: json['owner'],
      lastAddHeight: json['last_add_height'],
      lastWithdrawHeight: json['last_withdraw_height'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'asset': asset,
      'units': units,
      'owner': owner,
      'last_add_height': lastAddHeight,
      'last_withdraw_height': lastWithdrawHeight,
    };
  }
}
