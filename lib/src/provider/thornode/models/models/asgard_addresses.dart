class ThorAsgardInboundAddressesResponse {
  final String chain;
  final String pubKey;
  final String address;
  final String? router;
  final bool halted;
  final bool globalTradingPaused;
  final bool chainTradingPaused;
  final bool chainLpActionsPaused;
  final String gasRate;
  final String gasRateUnits;
  final String outboundTxSize;
  final String outboundFee;
  final String dustThreshold;

  const ThorAsgardInboundAddressesResponse({
    required this.chain,
    required this.pubKey,
    required this.address,
    required this.router,
    required this.halted,
    required this.globalTradingPaused,
    required this.chainTradingPaused,
    required this.chainLpActionsPaused,
    required this.gasRate,
    required this.gasRateUnits,
    required this.outboundTxSize,
    required this.outboundFee,
    required this.dustThreshold,
  });

  factory ThorAsgardInboundAddressesResponse.fromJson(
      Map<String, dynamic> json) {
    return ThorAsgardInboundAddressesResponse(
      chain: json['chain'],
      pubKey: json['pub_key'],
      address: json['address'],
      router: json['router'],
      halted: json['halted'],
      globalTradingPaused: json['global_trading_paused'],
      chainTradingPaused: json['chain_trading_paused'],
      chainLpActionsPaused: json['chain_lp_actions_paused'],
      gasRate: json['gas_rate'],
      gasRateUnits: json['gas_rate_units'],
      outboundTxSize: json['outbound_tx_size'],
      outboundFee: json['outbound_fee'],
      dustThreshold: json['dust_threshold'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chain': chain,
      'pub_key': pubKey,
      'address': address,
      'router': router,
      'halted': halted,
      'global_trading_paused': globalTradingPaused,
      'chain_trading_paused': chainTradingPaused,
      'chain_lp_actions_paused': chainLpActionsPaused,
      'gas_rate': gasRate,
      'gas_rate_units': gasRateUnits,
      'outbound_tx_size': outboundTxSize,
      'outbound_fee': outboundFee,
      'dust_threshold': dustThreshold,
    };
  }
}
