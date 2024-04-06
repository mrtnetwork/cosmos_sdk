class AssetPoolInformationResponse {
  final String asset;
  final String? shortCode;
  final String status;
  final String pendingInboundAsset;
  final String pendingInboundRune;
  final String balanceAsset;
  final String balanceRune;
  final String poolUnits;
  final String lpUnits;
  final String synthUnits;
  final String synthSupply;
  final String saversDepth;
  final String saversUnits;
  final bool synthMintPaused;
  final String synthSupplyRemaining;
  final String loanCollateral;
  final String loanCollateralRemaining;
  final String loanCr;
  final String derivedDepthBps;

  AssetPoolInformationResponse({
    required this.asset,
    required this.shortCode,
    required this.status,
    required this.pendingInboundAsset,
    required this.pendingInboundRune,
    required this.balanceAsset,
    required this.balanceRune,
    required this.poolUnits,
    required this.lpUnits,
    required this.synthUnits,
    required this.synthSupply,
    required this.saversDepth,
    required this.saversUnits,
    required this.synthMintPaused,
    required this.synthSupplyRemaining,
    required this.loanCollateral,
    required this.loanCollateralRemaining,
    required this.loanCr,
    required this.derivedDepthBps,
  });

  factory AssetPoolInformationResponse.fromJson(Map<String, dynamic> json) {
    return AssetPoolInformationResponse(
      asset: json['asset'],
      shortCode: json['short_code'],
      status: json['status'],
      pendingInboundAsset: json['pending_inbound_asset'],
      pendingInboundRune: json['pending_inbound_rune'],
      balanceAsset: json['balance_asset'],
      balanceRune: json['balance_rune'],
      poolUnits: json['pool_units'],
      lpUnits: json['LP_units'],
      synthUnits: json['synth_units'],
      synthSupply: json['synth_supply'],
      saversDepth: json['savers_depth'],
      saversUnits: json['savers_units'],
      synthMintPaused: json['synth_mint_paused'],
      synthSupplyRemaining: json['synth_supply_remaining'],
      loanCollateral: json['loan_collateral'],
      loanCollateralRemaining: json['loan_collateral_remaining'],
      loanCr: json['loan_cr'],
      derivedDepthBps: json['derived_depth_bps'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'asset': asset,
      'short_code': shortCode,
      'status': status,
      'pending_inbound_asset': pendingInboundAsset,
      'pending_inbound_rune': pendingInboundRune,
      'balance_asset': balanceAsset,
      'balance_rune': balanceRune,
      'pool_units': poolUnits,
      'LP_units': lpUnits,
      'synth_units': synthUnits,
      'synth_supply': synthSupply,
      'savers_depth': saversDepth,
      'savers_units': saversUnits,
      'synth_mint_paused': synthMintPaused,
      'synth_supply_remaining': synthSupplyRemaining,
      'loan_collateral': loanCollateral,
      'loan_collateral_remaining': loanCollateralRemaining,
      'loan_cr': loanCr,
      'derived_depth_bps': derivedDepthBps,
    };
  }
}
