class ThorLatestBlockResponse {
  final String chain;
  final int lastObservedIn;
  final int lastSignedOut;
  final int thorchain;

  const ThorLatestBlockResponse({
    required this.chain,
    required this.lastObservedIn,
    required this.lastSignedOut,
    required this.thorchain,
  });

  factory ThorLatestBlockResponse.fromJson(Map<String, dynamic> json) {
    return ThorLatestBlockResponse(
      chain: json['chain'],
      lastObservedIn: json['last_observed_in'],
      lastSignedOut: json['last_signed_out'],
      thorchain: json['thorchain'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chain': chain,
      'last_observed_in': lastObservedIn,
      'last_signed_out': lastSignedOut,
      'thorchain': thorchain,
    };
  }
}
