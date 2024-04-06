class PolStaticsResponse {
  final String runeDeposited;
  final String runeWithdrawn;
  final String value;
  final String pnl;
  final String currentDeposit;

  const PolStaticsResponse({
    required this.runeDeposited,
    required this.runeWithdrawn,
    required this.value,
    required this.pnl,
    required this.currentDeposit,
  });

  factory PolStaticsResponse.fromJson(Map<String, dynamic> json) {
    return PolStaticsResponse(
      runeDeposited: json['rune_deposited'],
      runeWithdrawn: json['rune_withdrawn'],
      value: json['value'],
      pnl: json['pnl'],
      currentDeposit: json['current_deposit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rune_deposited': runeDeposited,
      'rune_withdrawn': runeWithdrawn,
      'value': value,
      'pnl': pnl,
      'current_deposit': currentDeposit,
    };
  }
}
