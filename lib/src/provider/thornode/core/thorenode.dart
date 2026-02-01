class ThorNodeMethods {
  final String name;
  final String url;
  const ThorNodeMethods._(this.name, this.url);

  static const ThorNodeMethods ping = ThorNodeMethods._("ping", "/ping");
  static const ThorNodeMethods assetPool = ThorNodeMethods._(
    "Returns the pool information for the provided asset.",
    "/pool/:asset",
  );
  static const ThorNodeMethods pools = ThorNodeMethods._(
    "Returns the pool information for all assets.",
    "/pools",
  );
  static const ThorNodeMethods dpool = ThorNodeMethods._(
    "Returns the pool information for the provided derived asset.",
    "/dpool/:asset",
  );
  static const ThorNodeMethods dpools = ThorNodeMethods._(
    "Returns the pool information for all derived assets.",
    "/dpools",
  );

  static const ThorNodeMethods liquidityProvider = ThorNodeMethods._(
    "Returns the liquidity provider information for an address and asset.",
    "/pool/:asset/liquidity_provider/:address",
  );
  static const ThorNodeMethods liquidityProviders = ThorNodeMethods._(
    "Returns all liquidity provider information for an asset.",
    "/pool/:asset/liquidity_providers",
  );

  static const ThorNodeMethods saverPosition = ThorNodeMethods._(
    "Returns the saver position given then savers pool and address.",
    "/pool/:asset/saver/:address",
  );
  static const ThorNodeMethods savers = ThorNodeMethods._(
    "Returns all savers for the savers pool.",
    "/pool/:asset/savers",
  );

  static const ThorNodeMethods borrower = ThorNodeMethods._(
    "Returns the borrower position given the pool and address.",
    "/pool/:asset/borrower/:address",
  );
  static const ThorNodeMethods borrowers = ThorNodeMethods._(
    "Returns all borrowers for the given pool.",
    "/pool/:asset/borrowers",
  );

  static const ThorNodeMethods getTransaction = ThorNodeMethods._(
    "Returns the observed transaction for a provided inbound or outbound hash.",
    "/tx/:hash",
  );
  static const ThorNodeMethods getTransactionSigner = ThorNodeMethods._(
    "Deprecated - migrate to /tx/details.",
    "/tx/:hash/signers",
  );
  static const ThorNodeMethods getTransactionDetails = ThorNodeMethods._(
    "Returns the signers for a provided inbound or outbound hash.",
    "/tx/details/:hash",
  );
  static const ThorNodeMethods getTransactionStages = ThorNodeMethods._(
    "Returns the processing stages of a provided inbound hash.",
    "/tx/stages/:hash",
  );
  static const ThorNodeMethods getTransactionStatus = ThorNodeMethods._(
    "Returns the status of a provided inbound hash.",
    "/tx/status/:hash",
  );

  static const ThorNodeMethods node = ThorNodeMethods._(
    "Returns node information for the provided node address.",
    "/node/:address",
  );
  static const ThorNodeMethods nodes = ThorNodeMethods._(
    "Returns node information for all registered validators.",
    "/nodes",
  );

  static const ThorNodeMethods asgard = ThorNodeMethods._(
    "Returns current asgard vaults.",
    "/vaults/asgard",
  );
  static const ThorNodeMethods yggdrasil = ThorNodeMethods._(
    "Returns current yggdrasil vaults.",
    "/vaults/yggdrasil",
  );
  static const ThorNodeMethods getPubkeyVault = ThorNodeMethods._(
    "Returns the vault for the provided pubkey.",
    "/vault/:pubkey",
  );
  static const ThorNodeMethods getPubkeysVault = ThorNodeMethods._(
    "Returns all pubkeys for current vaults.",
    "/vaults/pubkeys",
  );

  static const ThorNodeMethods network = ThorNodeMethods._(
    "Returns network overview statistics.",
    "/network",
  );
  static const ThorNodeMethods inboundAddresses = ThorNodeMethods._(
    "Returns the set of asgard addresses that should be used for inbound transactions.",
    "/inbound_addresses",
  );
  static const ThorNodeMethods lastblock = ThorNodeMethods._(
    "Returns the last block information for all chains.",
    "/lastblock",
  );
  static const ThorNodeMethods lastblockChain = ThorNodeMethods._(
    "Returns the last block information for the provided chain",
    "/lastblock/:chain",
  );
  static const ThorNodeMethods version = ThorNodeMethods._(
    "Returns the network's current THORNode version, the network's next THORNode version, and the querier's THORNode version",
    "/version",
  );
  static const ThorNodeMethods constants = ThorNodeMethods._(
    "Returns constant configuration, can be overridden by mimir.",
    "/constants",
  );
  static const ThorNodeMethods ragnarok = ThorNodeMethods._(
    "Returns a boolean indicating whether the chain is in ragnarok.",
    "/ragnarok",
  );
  static const ThorNodeMethods ban = ThorNodeMethods._(
    "Returns the ban status for the provided node address.",
    "/ban/:address",
  );
  static const ThorNodeMethods pool = ThorNodeMethods._(
    "Returns protocol owned liquidity overview statistics.",
    "/pol",
  );
  static const ThorNodeMethods streamingState = ThorNodeMethods._(
    "Returns the state of a streaming swap",
    "/swap/streaming/:hash",
  );
  static const ThorNodeMethods streamingStates = ThorNodeMethods._(
    "Returns the state of all streaming swaps",
    "/swaps/streaming",
  );
  static const ThorNodeMethods cloutScore = ThorNodeMethods._(
    "Returns the clout score of an address",
    "/clout/swap/:address",
  );
  static const ThorNodeMethods tradeUnit = ThorNodeMethods._(
    "Returns the total units and depth of a trade asset",
    "/trade/unit/:asset",
  );

  static const ThorNodeMethods tradeUnits = ThorNodeMethods._(
    "Returns the total units and depth of a trade asset",
    "/trade/units",
  );
  static const ThorNodeMethods tradeAccount = ThorNodeMethods._(
    "Returns the units and depth of a trade account",
    "/trade/account/:address",
  );
  static const ThorNodeMethods tradeAccounts = ThorNodeMethods._(
    "Returns all trade accounts for an asset",
    "/trade/accounts/:asset",
  );
  static const ThorNodeMethods queue = ThorNodeMethods._(
    "Returns queue statistics",
    "/queue",
  );
  static const ThorNodeMethods swap = ThorNodeMethods._(
    "Returns the swap queue",
    "/queue/swap",
  );
  static const ThorNodeMethods scheduled = ThorNodeMethods._(
    "Returns the scheduled queue",
    "/queue/scheduled",
  );
  static const ThorNodeMethods outbound = ThorNodeMethods._(
    "Returns the outbound queue including estimated RUNE values.",
    "/queue/outbound",
  );

  static const ThorNodeMethods keysign = ThorNodeMethods._(
    "Returns keysign information for the provided height - the height being the first block a tx out item appears in the signed-but-unobserved outbound queue.",
    "/keysign/:height",
  );
  static const ThorNodeMethods pubkeyKeysign = ThorNodeMethods._(
    "Returns keysign information for the provided height - the height being the first block a tx out item appears in the signed-but-unobserved outbound queue.",
    "/keysign/:height/:pubkey",
  );
  static const ThorNodeMethods metrics = ThorNodeMethods._(
    "Returns keygen and keysign metrics for current vaults.",
    "/metrics",
  );
  static const ThorNodeMethods pubkeyKeygenMetrics = ThorNodeMethods._(
    "Returns keygen metrics for the provided vault pubkey.",
    "/metric/keygen/:pubkey",
  );

  static const ThorNodeMethods thorname = ThorNodeMethods._(
    "Returns addresses registered to the provided thorname.",
    "/thorname/:name",
  );

  static const ThorNodeMethods mimir = ThorNodeMethods._(
    "Returns current active mimir configuration.",
    "/mimir",
  );
  static const ThorNodeMethods keyMimir = ThorNodeMethods._(
    "Returns current active mimir configuration for the provided key.",
    "/mimir/key/:key",
  );
  static const ThorNodeMethods mirmirAdmin = ThorNodeMethods._(
    "Returns current admin mimir configuration.",
    "/mimir/admin",
  );
  static const ThorNodeMethods mirmirnodesAll = ThorNodeMethods._(
    "Returns current node mimir votes.",
    "/mimir/nodes_all",
  );
  static const ThorNodeMethods mirmirNodeAddress = ThorNodeMethods._(
    "Returns current node mimir configuration for the provided node address.",
    "/mimir/node/:address",
  );
  static const ThorNodeMethods mirmirV2 = ThorNodeMethods._(
    "Returns current mimir V2 configuration",
    "/mimirV2",
  );
  static const ThorNodeMethods mirmirV2Ids = ThorNodeMethods._(
    "Returns mapping of mimir V2 IDs to name.",
    "/mimirV2/ids",
  );

  static const ThorNodeMethods quoteSwap = ThorNodeMethods._(
    "Provide a quote estimate for the provided swap",
    "/quote/swap",
  );
  static const ThorNodeMethods saverDeposit = ThorNodeMethods._(
    "Provide a quote estimate for the provided saver deposit.",
    "/quote/saver/deposit",
  );
  static const ThorNodeMethods saverWithdraw = ThorNodeMethods._(
    "Provide a quote estimate for the provided saver withdraw",
    "/quote/saver/withdraw",
  );
  static const ThorNodeMethods loanOpen = ThorNodeMethods._(
    "Provide a quote estimate for the provided loan open.",
    "/quote/loan/open",
  );
  static const ThorNodeMethods loanClose = ThorNodeMethods._(
    "Provide a quote estimate for the provided loan close.",
    "/quote/loan/close",
  );
  static const ThorNodeMethods invariant = ThorNodeMethods._(
    "Returns result of running the given invariant.",
    "/invariant/:invariant",
  );
  static const ThorNodeMethods invariants = ThorNodeMethods._(
    "Returns a list of available invariants.",
    "/invariants",
  );
  static const ThorNodeMethods block = ThorNodeMethods._(
    "Returns verbose details of the block.",
    "/block",
  );
}
