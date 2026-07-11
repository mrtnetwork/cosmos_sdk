enum CosmosAddressType {
  account,
  validator,
  consensus,
  accountPubkey,
  validatorPubkey,
  consensusPubkey,
}

class CosmosBech32Config {
  final String accountHrp;
  final String validatorHrp;
  final String consensusHrp;
  final String accountPubHrp;
  final String validatorPubHrp;
  final String consensusPubHrp;

  const CosmosBech32Config({
    required this.accountHrp,
    required this.validatorHrp,
    required this.consensusHrp,
    required this.accountPubHrp,
    required this.validatorPubHrp,
    required this.consensusPubHrp,
  });

  /// Builds the standard SDK suffix pattern from a single base prefix:
  /// base, base+"pub", base+"valoper", base+"valoperpub",
  /// base+"valcons", base+"valconspub".
  factory CosmosBech32Config.fromBasePrefix(String base) {
    return CosmosBech32Config(
      accountHrp: base,
      accountPubHrp: '${base}pub',
      validatorHrp: '${base}valoper',
      validatorPubHrp: '${base}valoperpub',
      consensusHrp: '${base}valcons',
      consensusPubHrp: '${base}valconspub',
    );
  }

  String hrpFor(CosmosAddressType type) => switch (type) {
    CosmosAddressType.account => accountHrp,
    CosmosAddressType.validator => validatorHrp,
    CosmosAddressType.consensus => consensusHrp,
    CosmosAddressType.accountPubkey => accountPubHrp,
    CosmosAddressType.validatorPubkey => validatorPubHrp,
    CosmosAddressType.consensusPubkey => consensusPubHrp,
  };
}

/// Default HRP tables for common Cosmos SDK chains.
/// All follow the standard SDK suffix convention (base, pub, valoper,
/// valoperpub, valcons, valconspub) unless noted otherwise.
class CosmosDefaultBech32Configs {
  static CosmosBech32Config get cosmosHub =>
      CosmosBech32Config.fromBasePrefix('cosmos');
  static CosmosBech32Config get osmosis =>
      CosmosBech32Config.fromBasePrefix('osmo');
  static CosmosBech32Config get injective =>
      CosmosBech32Config.fromBasePrefix('inj');
  static CosmosBech32Config get akash =>
      CosmosBech32Config.fromBasePrefix('akash');
  static CosmosBech32Config get juno =>
      CosmosBech32Config.fromBasePrefix('juno');
  static CosmosBech32Config get stargaze =>
      CosmosBech32Config.fromBasePrefix('stars');
  static CosmosBech32Config get secretNetwork =>
      CosmosBech32Config.fromBasePrefix('secret');
  static CosmosBech32Config get kava =>
      CosmosBech32Config.fromBasePrefix('kava');
  static CosmosBech32Config get persistence =>
      CosmosBech32Config.fromBasePrefix('persistence');
  static CosmosBech32Config get sommelier =>
      CosmosBech32Config.fromBasePrefix('somm');
  static CosmosBech32Config get crescent =>
      CosmosBech32Config.fromBasePrefix('cre');
  static CosmosBech32Config get evmos =>
      CosmosBech32Config.fromBasePrefix('evmos');
  static CosmosBech32Config get celestia =>
      CosmosBech32Config.fromBasePrefix('celestia');
  static CosmosBech32Config get dydx =>
      CosmosBech32Config.fromBasePrefix('dydx');
  static CosmosBech32Config get noble =>
      CosmosBech32Config.fromBasePrefix('noble');
  static CosmosBech32Config get stride =>
      CosmosBech32Config.fromBasePrefix('stride');
  static CosmosBech32Config get terra =>
      CosmosBech32Config.fromBasePrefix('terra');
  static CosmosBech32Config get kujira =>
      CosmosBech32Config.fromBasePrefix('kujira');
  static CosmosBech32Config get gaiaLiquid => CosmosBech32Config.fromBasePrefix(
    'cosmos',
  ); // gaia LSM fork uses cosmos hub's prefix

  /// Lookup by base prefix string, useful if you're deriving the config
  /// dynamically from a chain-id / config file rather than hardcoding it.
  static CosmosBech32Config forBasePrefix(String base) =>
      CosmosBech32Config.fromBasePrefix(base);
}
