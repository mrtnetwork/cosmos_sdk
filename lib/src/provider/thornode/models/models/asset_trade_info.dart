class AssetTradeInfoResponse {
  final String asset;
  final String units;
  final String depth;

  AssetTradeInfoResponse({
    required this.asset,
    required this.units,
    required this.depth,
  });

  factory AssetTradeInfoResponse.fromJson(Map<String, dynamic> json) {
    return AssetTradeInfoResponse(
      asset: json['asset'],
      units: json['units'],
      depth: json['depth'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'asset': asset,
      'units': units,
      'depth': depth,
    };
  }
}
