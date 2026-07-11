class ThorVersionResponse {
  final String current;
  final String next;
  final int nextSinceHeight;
  final String querier;

  ThorVersionResponse({
    required this.current,
    required this.next,
    required this.nextSinceHeight,
    required this.querier,
  });

  factory ThorVersionResponse.fromJson(Map<String, dynamic> json) {
    return ThorVersionResponse(
      current: json['current'],
      next: json['next'],
      nextSinceHeight: json['next_since_height'],
      querier: json['querier'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current': current,
      'next': next,
      'next_since_height': nextSinceHeight,
      'querier': querier,
    };
  }
}
