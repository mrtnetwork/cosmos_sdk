class DerivedAssetPoolInformationResponse {
  final String asset;
  final String status;
  final String balanceAsset;
  final String balanceRune;
  final String derivedDepthBps;

  DerivedAssetPoolInformationResponse({
    required this.asset,
    required this.status,
    required this.balanceAsset,
    required this.balanceRune,
    required this.derivedDepthBps,
  });

  factory DerivedAssetPoolInformationResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return DerivedAssetPoolInformationResponse(
      asset: json['asset'],
      status: json['status'],
      balanceAsset: json['balance_asset'],
      balanceRune: json['balance_rune'],
      derivedDepthBps: json['derived_depth_bps'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'asset': asset,
      'status': status,
      'balance_asset': balanceAsset,
      'balance_rune': balanceRune,
      'derived_depth_bps': derivedDepthBps,
    };
  }
}
