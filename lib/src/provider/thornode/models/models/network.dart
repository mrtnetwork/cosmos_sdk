class ThorNetworkStaticsResponse {
  final String bondRewardRune;
  final String burnedBEP2Rune;
  final String burnedERC20Rune;
  final String totalBondUnits;
  final String effectiveSecurityBond;
  final String totalReserve;
  final bool vaultsMigrating;
  final String gasSpentRune;
  final String gasWithheldRune;
  final String outboundFeeMultiplier;
  final String nativeOutboundFeeRune;
  final String nativeTxFeeRune;
  final String tnsRegisterFeeRune;
  final String tnsFeePerBlockRune;
  final String runePriceInTor;
  final String torPriceInRune;

  const ThorNetworkStaticsResponse({
    required this.bondRewardRune,
    required this.burnedBEP2Rune,
    required this.burnedERC20Rune,
    required this.totalBondUnits,
    required this.effectiveSecurityBond,
    required this.totalReserve,
    required this.vaultsMigrating,
    required this.gasSpentRune,
    required this.gasWithheldRune,
    required this.outboundFeeMultiplier,
    required this.nativeOutboundFeeRune,
    required this.nativeTxFeeRune,
    required this.tnsRegisterFeeRune,
    required this.tnsFeePerBlockRune,
    required this.runePriceInTor,
    required this.torPriceInRune,
  });

  factory ThorNetworkStaticsResponse.fromJson(Map<String, dynamic> json) {
    return ThorNetworkStaticsResponse(
      bondRewardRune: json['bond_reward_rune'],
      burnedBEP2Rune: json['burned_bep_2_rune'],
      burnedERC20Rune: json['burned_erc_20_rune'],
      totalBondUnits: json['total_bond_units'],
      effectiveSecurityBond: json['effective_security_bond'],
      totalReserve: json['total_reserve'],
      vaultsMigrating: json['vaults_migrating'],
      gasSpentRune: json['gas_spent_rune'],
      gasWithheldRune: json['gas_withheld_rune'],
      outboundFeeMultiplier: json['outbound_fee_multiplier'],
      nativeOutboundFeeRune: json['native_outbound_fee_rune'],
      nativeTxFeeRune: json['native_tx_fee_rune'],
      tnsRegisterFeeRune: json['tns_register_fee_rune'],
      tnsFeePerBlockRune: json['tns_fee_per_block_rune'],
      runePriceInTor: json['rune_price_in_tor'],
      torPriceInRune: json['tor_price_in_rune'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bond_reward_rune': bondRewardRune,
      'burned_bep_2_rune': burnedBEP2Rune,
      'burned_erc_20_rune': burnedERC20Rune,
      'total_bond_units': totalBondUnits,
      'effective_security_bond': effectiveSecurityBond,
      'total_reserve': totalReserve,
      'vaults_migrating': vaultsMigrating,
      'gas_spent_rune': gasSpentRune,
      'gas_withheld_rune': gasWithheldRune,
      'outbound_fee_multiplier': outboundFeeMultiplier,
      'native_outbound_fee_rune': nativeOutboundFeeRune,
      'native_tx_fee_rune': nativeTxFeeRune,
      'tns_register_fee_rune': tnsRegisterFeeRune,
      'tns_fee_per_block_rune': tnsFeePerBlockRune,
      'rune_price_in_tor': runePriceInTor,
      'tor_price_in_rune': torPriceInRune,
    };
  }
}
