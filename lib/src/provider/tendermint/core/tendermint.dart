class TendermintMethods {
  final String name;
  final String url;
  const TendermintMethods._(this.name, this.url);

  /// Get node health. Returns empty result (200 OK) on success,
  /// no response - in case of an error.
  static const TendermintMethods health =
      TendermintMethods._("Node heartbeat", "/health");

  /// Get Tendermint status including node info, pubkey,
  /// latest block hash, app hash, block height and time.
  static const TendermintMethods status =
      TendermintMethods._("Node Status", "/status");

  /// Network informations
  static const TendermintMethods netInfo =
      TendermintMethods._("Network informations", "/net_info");

  /// Get block headers for minHeight <= height <= maxHeight.
  static const TendermintMethods blockchain =
      TendermintMethods._("Get block headers", "/blockchain");

  /// Get block at a specified height
  static const TendermintMethods block =
      TendermintMethods._("Get block at a specified height", "/block");

  /// Get block by hash
  static const TendermintMethods blockByHash =
      TendermintMethods._("Get block by hash", "/block_by_hash");

  /// Get block results at a specified height
  static const TendermintMethods blockResult = TendermintMethods._(
      "Get block results at a specified height", "/block_results");

  /// Get commit results at a specified height
  static const TendermintMethods commit = TendermintMethods._(
      "Get commit results at a specified height", "/commit");

  /// Get validator set at a specified height
  static const TendermintMethods validators = TendermintMethods._(
      "Get validator set at a specified height", "/validators");

  /// Get Genesis
  static const TendermintMethods genesis =
      TendermintMethods._("Get Genesis", "/genesis");

  /// Get Genesis in multiple chunks
  static const TendermintMethods genesisChunked =
      TendermintMethods._("Get Genesis in multiple chunks", "/genesis_chunked");

  /// Get consensus state
  static const TendermintMethods dumpConsensusState =
      TendermintMethods._("Get consensus state", "/dump_consensus_state");

  /// Get consensus state
  static const TendermintMethods consensusState =
      TendermintMethods._("Get consensus state", "/consensus_state");

  /// Get consensus parameters
  static const TendermintMethods consensusParams =
      TendermintMethods._("Get consensus parameters", "/consensus_params");

  /// Get the list of unconfirmed transactions
  static const TendermintMethods unconfirmedTxs = TendermintMethods._(
      "Get the list of unconfirmed transactions", "/unconfirmed_txs");

  /// Get data about unconfirmed transactions
  static const TendermintMethods numUnconfirmedTxs = TendermintMethods._(
      "Get data about unconfirmed transactions", "/num_unconfirmed_txs");

  /// Search for transactions
  static const TendermintMethods txSearch =
      TendermintMethods._("Search for transactions", "/tx_search");

  /// Search for blocks by BeginBlock and EndBlock events
  static const TendermintMethods blockSearch = TendermintMethods._(
      "Search for blocks by BeginBlock and EndBlock events", "/block_search");

  /// Get a transaction
  static const TendermintMethods tx =
      TendermintMethods._("Get a transaction", "/tx");

  /// Broadcast evidence of the misbehavior.
  static const TendermintMethods broadcastEvidence = TendermintMethods._(
      "Broadcast evidence of the misbehavior.", "/broadcast_evidence");

  /// Returns with the response from CheckTx. Does not wait for DeliverTx result.
  static const TendermintMethods broadcastTxSync = TendermintMethods._(
      "Returns with the response from CheckTx. Does not wait for DeliverTx result.",
      "/broadcast_tx_sync");

  /// Returns right away, with no response. Does not wait for CheckTx nor DeliverTx results.
  static const TendermintMethods broadcastTxAsync = TendermintMethods._(
      "Returns right away, with no response. Does not wait for CheckTx nor DeliverTx results.",
      "/broadcast_tx_async");

  /// Returns with the responses from CheckTx and DeliverTx.
  static const TendermintMethods broadcastTxCommit = TendermintMethods._(
      "Returns with the responses from CheckTx and DeliverTx.",
      "/broadcast_tx_commit");

  /// Checks the transaction without executing it.
  static const TendermintMethods checkTx = TendermintMethods._(
      "Checks the transaction without executing it.", "/check_tx");

  /// Get info about the application.
  static const TendermintMethods abciInfo =
      TendermintMethods._("Get info about the application.", "/abci_info");

  /// Query the application for some information.
  static const TendermintMethods abciQuery = TendermintMethods._(
      "Query the application for some information.", "/abci_query");

  /// Dial a peer, this route in under unsafe, and has to manually enabled to use
  static const TendermintMethods dialSeeds = TendermintMethods._(
      "Dial a peer, this route in under unsafe, and has to manually enabled to use",
      "/dial_seeds");

  /// Add Peers/Persistent Peers
  static const TendermintMethods dialPeers =
      TendermintMethods._("Add Peers/Persistent Peers", "/dial_peers");

  /// Subscribe for events via WebSocket.
  static const TendermintMethods subscribe =
      TendermintMethods._("Subscribe for events via WebSocket.", "/subscribe");

  /// Unsubscribe from event on Websocket
  static const TendermintMethods unsubscribe = TendermintMethods._(
      "Unsubscribe from event on Websocket", "/unsubscribe");

  /// Unsubscribe from all events via WebSocket
  static const TendermintMethods unsubscribeAll = TendermintMethods._(
      "Unsubscribe from all events via WebSocket", "/unsubscribe_all");
}
