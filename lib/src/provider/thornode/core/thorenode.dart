class ThorNodeMethods {
  final String name;
  final String url;
  const ThorNodeMethods._(this.name, this.url);

  static const ThorNodeMethods ping =
      ThorNodeMethods._("ping", "/thorchain/ping");
  static const ThorNodeMethods assetPool = ThorNodeMethods._(
      "Returns the pool information for the provided asset.",
      "/thorchain/pool/:asset");
  static const ThorNodeMethods pools = ThorNodeMethods._(
      "Returns the pool information for all assets.", "/thorchain/pools");
  static const ThorNodeMethods dpool = ThorNodeMethods._(
      "Returns the pool information for the provided derived asset.",
      "/thorchain/dpool/:asset");
  static const ThorNodeMethods dpools = ThorNodeMethods._(
      "Returns the pool information for all derived assets.",
      "/thorchain/dpools");

  static const ThorNodeMethods liquidityProvider = ThorNodeMethods._(
      "Returns the liquidity provider information for an address and asset.",
      "/thorchain/pool/:asset/liquidity_provider/:address");
  static const ThorNodeMethods liquidityProviders = ThorNodeMethods._(
      "Returns all liquidity provider information for an asset.",
      "/thorchain/pool/:asset/liquidity_providers");

  static const ThorNodeMethods saverPosition = ThorNodeMethods._(
      "Returns the saver position given then savers pool and address.",
      "/thorchain/pool/:asset/saver/:address");
  static const ThorNodeMethods savers = ThorNodeMethods._(
      "Returns all savers for the savers pool.",
      "/thorchain/pool/:asset/savers");

  static const ThorNodeMethods borrower = ThorNodeMethods._(
      "Returns the borrower position given the pool and address.",
      "/thorchain/pool/:asset/borrower/:address");
  static const ThorNodeMethods borrowers = ThorNodeMethods._(
      "Returns all borrowers for the given pool.",
      "/thorchain/pool/:asset/borrowers");

  static const ThorNodeMethods getTransaction = ThorNodeMethods._(
      "Returns the observed transaction for a provided inbound or outbound hash.",
      "/thorchain/tx/:hash");
  static const ThorNodeMethods getTransactionSigner = ThorNodeMethods._(
      "Deprecated - migrate to /thorchain/tx/details.",
      "/thorchain/tx/:hash/signers");
  static const ThorNodeMethods getTransactionDetails = ThorNodeMethods._(
      "Returns the signers for a provided inbound or outbound hash.",
      "/thorchain/tx/details/:hash");
  static const ThorNodeMethods getTransactionStages = ThorNodeMethods._(
      "Returns the processing stages of a provided inbound hash.",
      "/thorchain/tx/stages/:hash");
  static const ThorNodeMethods getTransactionStatus = ThorNodeMethods._(
      "Returns the status of a provided inbound hash.",
      "/thorchain/tx/status/:hash");

  static const ThorNodeMethods node = ThorNodeMethods._(
      "Returns node information for the provided node address.",
      "/thorchain/node/:address");
  static const ThorNodeMethods nodes = ThorNodeMethods._(
      "Returns node information for all registered validators.",
      "/thorchain/nodes");

  static const ThorNodeMethods asgard = ThorNodeMethods._(
      "Returns current asgard vaults.", "/thorchain/vaults/asgard");
  static const ThorNodeMethods yggdrasil = ThorNodeMethods._(
      "Returns current yggdrasil vaults.", "/thorchain/vaults/yggdrasil");
  static const ThorNodeMethods getPubkeyVault = ThorNodeMethods._(
      "Returns the vault for the provided pubkey.", "/thorchain/vault/:pubkey");
  static const ThorNodeMethods getPubkeysVault = ThorNodeMethods._(
      "Returns all pubkeys for current vaults.", "/thorchain/vaults/pubkeys");

  static const ThorNodeMethods network = ThorNodeMethods._(
      "Returns network overview statistics.", "/thorchain/network");
  static const ThorNodeMethods inboundAddresses = ThorNodeMethods._(
      "Returns the set of asgard addresses that should be used for inbound transactions.",
      "/thorchain/inbound_addresses");
  static const ThorNodeMethods lastblock = ThorNodeMethods._(
      "Returns the last block information for all chains.",
      "/thorchain/lastblock");
  static const ThorNodeMethods lastblockChain = ThorNodeMethods._(
      "Returns the last block information for the provided chain",
      "/thorchain/lastblock/:chain");
  static const ThorNodeMethods version = ThorNodeMethods._(
      "Returns the network's current THORNode version, the network's next THORNode version, and the querier's THORNode version",
      "/thorchain/version");
  static const ThorNodeMethods constants = ThorNodeMethods._(
      "Returns constant configuration, can be overridden by mimir.",
      "/thorchain/constants");
  static const ThorNodeMethods ragnarok = ThorNodeMethods._(
      "Returns a boolean indicating whether the chain is in ragnarok.",
      "/thorchain/ragnarok");
  static const ThorNodeMethods ban = ThorNodeMethods._(
      "Returns the ban status for the provided node address.",
      "/thorchain/ban/:address");
  static const ThorNodeMethods pool = ThorNodeMethods._(
      "Returns protocol owned liquidity overview statistics.",
      "/thorchain/pol");
  static const ThorNodeMethods streamingState = ThorNodeMethods._(
      "Returns the state of a streaming swap",
      "/thorchain/swap/streaming/:hash");
  static const ThorNodeMethods streamingStates = ThorNodeMethods._(
      "Returns the state of all streaming swaps", "/thorchain/swaps/streaming");
  static const ThorNodeMethods cloutScore = ThorNodeMethods._(
      "Returns the clout score of an address",
      "/thorchain/clout/swap/:address");
  static const ThorNodeMethods tradeUnit = ThorNodeMethods._(
      "Returns the total units and depth of a trade asset",
      "/thorchain/trade/unit/:asset");

  static const ThorNodeMethods tradeUnits = ThorNodeMethods._(
      "Returns the total units and depth of a trade asset",
      "/thorchain/trade/units");
  static const ThorNodeMethods tradeAccount = ThorNodeMethods._(
      "Returns the units and depth of a trade account",
      "/thorchain/trade/account/:address");
  static const ThorNodeMethods tradeAccounts = ThorNodeMethods._(
      "Returns all trade accounts for an asset",
      "/thorchain/trade/accounts/:asset");
  static const ThorNodeMethods queue =
      ThorNodeMethods._("Returns queue statistics", "/thorchain/queue");
  static const ThorNodeMethods swap =
      ThorNodeMethods._("Returns the swap queue", "/thorchain/queue/swap");
  static const ThorNodeMethods scheduled = ThorNodeMethods._(
      "Returns the scheduled queue", "/thorchain/queue/scheduled");
  static const ThorNodeMethods outbound = ThorNodeMethods._(
      "Returns the outbound queue including estimated RUNE values.",
      "/thorchain/queue/outbound");

  static const ThorNodeMethods keysign = ThorNodeMethods._(
      "Returns keysign information for the provided height - the height being the first block a tx out item appears in the signed-but-unobserved outbound queue.",
      "/thorchain/keysign/:height");
  static const ThorNodeMethods pubkeyKeysign = ThorNodeMethods._(
      "Returns keysign information for the provided height - the height being the first block a tx out item appears in the signed-but-unobserved outbound queue.",
      "/thorchain/keysign/:height/:pubkey");
  static const ThorNodeMethods metrics = ThorNodeMethods._(
      "Returns keygen and keysign metrics for current vaults.",
      "/thorchain/metrics");
  static const ThorNodeMethods pubkeyKeygenMetrics = ThorNodeMethods._(
      "Returns keygen metrics for the provided vault pubkey.",
      "/thorchain/metric/keygen/:pubkey");

  static const ThorNodeMethods thorname = ThorNodeMethods._(
      "Returns addresses registered to the provided thorname.",
      "/thorchain/thorname/:name");

  static const ThorNodeMethods mimir = ThorNodeMethods._(
      "Returns current active mimir configuration.", "/thorchain/mimir");
  static const ThorNodeMethods keyMimir = ThorNodeMethods._(
      "Returns current active mimir configuration for the provided key.",
      "/thorchain/mimir/key/:key");
  static const ThorNodeMethods mirmirAdmin = ThorNodeMethods._(
      "Returns current admin mimir configuration.", "/thorchain/mimir/admin");
  static const ThorNodeMethods mirmirnodesAll = ThorNodeMethods._(
      "Returns current node mimir votes.", "/thorchain/mimir/nodes_all");
  static const ThorNodeMethods mirmirNodeAddress = ThorNodeMethods._(
      "Returns current node mimir configuration for the provided node address.",
      "/thorchain/mimir/node/:address");
  static const ThorNodeMethods mirmirV2 = ThorNodeMethods._(
      "Returns current mimir V2 configuration", "/thorchain/mimirV2");
  static const ThorNodeMethods mirmirV2Ids = ThorNodeMethods._(
      "Returns mapping of mimir V2 IDs to name.", "/thorchain/mimirV2/ids");

  static const ThorNodeMethods quoteSwap = ThorNodeMethods._(
      "Provide a quote estimate for the provided swap",
      "/mayachain/quote/swap");
  static const ThorNodeMethods saverDeposit = ThorNodeMethods._(
      "Provide a quote estimate for the provided saver deposit.",
      "/thorchain/quote/saver/deposit");
  static const ThorNodeMethods saverWithdraw = ThorNodeMethods._(
      "Provide a quote estimate for the provided saver withdraw",
      "/thorchain/quote/saver/withdraw");
  static const ThorNodeMethods loanOpen = ThorNodeMethods._(
      "Provide a quote estimate for the provided loan open.",
      "/thorchain/quote/loan/open");
  static const ThorNodeMethods loanClose = ThorNodeMethods._(
      "Provide a quote estimate for the provided loan close.",
      "/thorchain/quote/loan/close");
  static const ThorNodeMethods invariant = ThorNodeMethods._(
      "Returns result of running the given invariant.",
      "/thorchain/invariant/:invariant");
  static const ThorNodeMethods invariants = ThorNodeMethods._(
      "Returns a list of available invariants.", "/thorchain/invariants");
  static const ThorNodeMethods block = ThorNodeMethods._(
      "Returns verbose details of the block.", "/thorchain/block");
}
