class CloutScoreResponse {
  final String address;
  final String score;
  final String reclaimed;
  final String spent;
  final int lastSpentHeight;
  final int lastReclaimHeight;

  const CloutScoreResponse({
    required this.address,
    required this.score,
    required this.reclaimed,
    required this.spent,
    required this.lastSpentHeight,
    required this.lastReclaimHeight,
  });

  factory CloutScoreResponse.fromJson(Map<String, dynamic> json) {
    return CloutScoreResponse(
      address: json['address'],
      score: json['score'],
      reclaimed: json['reclaimed'],
      spent: json['spent'],
      lastSpentHeight: json['last_spent_height'],
      lastReclaimHeight: json['last_reclaim_height'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'score': score,
      'reclaimed': reclaimed,
      'spent': spent,
      'last_spent_height': lastSpentHeight,
      'last_reclaim_height': lastReclaimHeight,
    };
  }
}
