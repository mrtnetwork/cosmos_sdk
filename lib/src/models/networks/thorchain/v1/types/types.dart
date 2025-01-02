import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class ThorchainV1Types extends TypeUrl {
  const ThorchainV1Types._(super.typeUrl);
  static const ThorchainV1Types asset = ThorchainV1Types._("/common.Asset");
  static const ThorchainV1Types coin = ThorchainV1Types._("/common.Coin");
  static const ThorchainV1Types pubKeySet =
      ThorchainV1Types._("/common.PubKeySet");
  static const ThorchainV1Types tx = ThorchainV1Types._("/common.Tx");
  static const ThorchainV1Types fee = ThorchainV1Types._("/common.Fee");
  static const ThorchainV1Types protoUint =
      ThorchainV1Types._("/common.ProtoUint");

  ///types
  static const ThorchainV1Types msgAddLiquidity =
      ThorchainV1Types._("/types.MsgAddLiquidity");
  static const ThorchainV1Types msgBan = ThorchainV1Types._("/types.MsgBan");
  static const ThorchainV1Types msgBond = ThorchainV1Types._("/types.MsgBond");
  static const ThorchainV1Types observedTx =
      ThorchainV1Types._("/types.ObservedTx");
  static const ThorchainV1Types txOutItem =
      ThorchainV1Types._("/types.TxOutItem");
  static const ThorchainV1Types txOut = ThorchainV1Types._("/types.TxOut");
  static const ThorchainV1Types observedTxVoter =
      ThorchainV1Types._("/types.ObservedTxVoter");
  static const ThorchainV1Types msgConsolidate =
      ThorchainV1Types._("/types.MsgConsolidate");
  static const ThorchainV1Types msgDeposit =
      ThorchainV1Types._("/types.MsgDeposit");
  static const ThorchainV1Types msgDonate =
      ThorchainV1Types._("/types.MsgDonate");
  static const ThorchainV1Types msgErrataTx =
      ThorchainV1Types._("/types.MsgErrataTx");
  static const ThorchainV1Types msgLeave =
      ThorchainV1Types._("/types.MsgLeave");
  static const ThorchainV1Types msgLoanOpen =
      ThorchainV1Types._("/types.MsgLoanOpen");
  static const ThorchainV1Types msgLoanRepayment =
      ThorchainV1Types._("/types.MsgLoanRepayment");
  static const ThorchainV1Types msgManageTHORName =
      ThorchainV1Types._("/types.MsgManageTHORName");
  static const ThorchainV1Types msgMigrate =
      ThorchainV1Types._("/types.MsgMigrate");
  static const ThorchainV1Types msgMimir =
      ThorchainV1Types._("/types.MsgMimir");
  static const ThorchainV1Types msgNetworkFee =
      ThorchainV1Types._("/types.MsgNetworkFee");
  static const ThorchainV1Types msgNodePauseChain =
      ThorchainV1Types._("/types.MsgNodePauseChain");
  static const ThorchainV1Types msgNoOp = ThorchainV1Types._("/types.MsgNoOp");
  static const ThorchainV1Types msgObservedTxIn =
      ThorchainV1Types._("/types.MsgObservedTxIn");
  static const ThorchainV1Types msgObservedTxOut =
      ThorchainV1Types._("/types.MsgObservedTxOut");
  static const ThorchainV1Types msgRagnarok =
      ThorchainV1Types._("/types.MsgRagnarok");
  static const ThorchainV1Types msgRefundTx =
      ThorchainV1Types._("/types.MsgRefundTx");
  static const ThorchainV1Types reserveContributor =
      ThorchainV1Types._("/types.ReserveContributor");
  static const ThorchainV1Types msgReserveContributor =
      ThorchainV1Types._("/types.MsgReserveContributor");
  static const ThorchainV1Types msgSend = ThorchainV1Types._("/types.MsgSend");
  static const ThorchainV1Types msgSetIPAddress =
      ThorchainV1Types._("/types.MsgSetIPAddress");
  static const ThorchainV1Types msgSetNodeKeys =
      ThorchainV1Types._("/types.MsgSetNodeKeys");
  static const ThorchainV1Types msgSolvency =
      ThorchainV1Types._("/types.MsgSolvency");
  static const ThorchainV1Types msgSwap = ThorchainV1Types._("/types.MsgSwap");
  static const ThorchainV1Types msgSwitch =
      ThorchainV1Types._("/types.MsgSwitch");
  static const ThorchainV1Types msgTradeAccountDeposit =
      ThorchainV1Types._("/types.MsgTradeAccountDeposit");
  static const ThorchainV1Types msgTradeAccountWithdrawal =
      ThorchainV1Types._("/types.MsgTradeAccountWithdrawal");
  static const ThorchainV1Types node = ThorchainV1Types._("/types.Node");
  static const ThorchainV1Types blame = ThorchainV1Types._("/types.Blame");
  static const ThorchainV1Types msgTssKeysignFail =
      ThorchainV1Types._("/types.MsgTssKeysignFail");
  static const ThorchainV1Types keygen = ThorchainV1Types._("/types.Keygen");
  static const ThorchainV1Types keygenBlock =
      ThorchainV1Types._("/types.KeygenBlock");
  static const ThorchainV1Types msgTssPool =
      ThorchainV1Types._("/types.MsgTssPool");

  static const ThorchainV1Types msgOutboundTx =
      ThorchainV1Types._("/types.MsgOutboundTx");
  static const ThorchainV1Types msgUnBond =
      ThorchainV1Types._("/types.MsgUnBond");
  static const ThorchainV1Types msgSetVersion =
      ThorchainV1Types._("/types.MsgSetVersion");
  static const ThorchainV1Types mxgWithdrawLiquidity =
      ThorchainV1Types._("/types.MsgWithdrawLiquidity");
  static const ThorchainV1Types msgYggdrasil =
      ThorchainV1Types._("/types.MsgYggdrasil");
  static const ThorchainV1Types afiliateFeeCollector =
      ThorchainV1Types._("/types.AffiliateFeeCollector");
  static const ThorchainV1Types banVoter =
      ThorchainV1Types._("/types.BanVoter");

  static const ThorchainV1Types chainContract =
      ThorchainV1Types._("/types.ChainContract");
  static const ThorchainV1Types swapperClout =
      ThorchainV1Types._("/types.SwapperClout");
  static const ThorchainV1Types errataTxVoter =
      ThorchainV1Types._("/types.ErrataTxVoter");
  static const ThorchainV1Types poolMod = ThorchainV1Types._("/types.PoolMod");
  static const ThorchainV1Types eventLimitOrder =
      ThorchainV1Types._("/types.EventLimitOrder");
  static const ThorchainV1Types eventStreamingSwap =
      ThorchainV1Types._("/types.EventStreamingSwap");
  static const ThorchainV1Types eventSwap =
      ThorchainV1Types._("/types.EventSwap");
  static const ThorchainV1Types eventAddLiquidity =
      ThorchainV1Types._("/types.EventAddLiquidity");
  static const ThorchainV1Types eventWithdraw =
      ThorchainV1Types._("/types.EventWithdraw");
  static const ThorchainV1Types eventPendingLiquidity =
      ThorchainV1Types._("/types.EventPendingLiquidity");
  static const ThorchainV1Types eventDonate =
      ThorchainV1Types._("/types.EventDonate");
  static const ThorchainV1Types pool = ThorchainV1Types._("/types.Pool");
  static const ThorchainV1Types eventPool =
      ThorchainV1Types._("/types.EventPool");
  static const ThorchainV1Types poolAmt = ThorchainV1Types._("/types.PoolAmt");
  static const ThorchainV1Types eventRewards =
      ThorchainV1Types._("/types.EventRewards");
  static const ThorchainV1Types eventRefund =
      ThorchainV1Types._("/types.EventRefund");
  static const ThorchainV1Types eventBond =
      ThorchainV1Types._("/types.EventBond");
  static const ThorchainV1Types gasPool = ThorchainV1Types._("/types.GasPool");
  static const ThorchainV1Types eventGas =
      ThorchainV1Types._("/types.EventGas");
  static const ThorchainV1Types eventReserve =
      ThorchainV1Types._("/types.EventReserve");
  static const ThorchainV1Types eventScheduledOutbound =
      ThorchainV1Types._("/types.EventScheduledOutbound");
  static const ThorchainV1Types eventSecurity =
      ThorchainV1Types._("/types.EventSecurity");
  static const ThorchainV1Types eventSlash =
      ThorchainV1Types._("/types.EventSlash");
  static const ThorchainV1Types eventErrata =
      ThorchainV1Types._("/types.EventErrata");
  static const ThorchainV1Types eventFee =
      ThorchainV1Types._("/types.EventFee");
  static const ThorchainV1Types eventOutbound =
      ThorchainV1Types._("/types.EventOutbound");
  static const ThorchainV1Types eventTssKeygenSuccess =
      ThorchainV1Types._("/types.EventTssKeygenSuccess");
  static const ThorchainV1Types eventTssKeygenFailure =
      ThorchainV1Types._("/types.EventTssKeygenFailure");
  static const ThorchainV1Types eventTssKeygenMetric =
      ThorchainV1Types._("/types.EventTssKeygenMetric");
  static const ThorchainV1Types eventTssKeysignMetric =
      ThorchainV1Types._("/types.EventTssKeysignMetric");
  static const ThorchainV1Types eventSlashPoint =
      ThorchainV1Types._("/types.EventSlashPoint");
  static const ThorchainV1Types eventPoolBalanceChanged =
      ThorchainV1Types._("/types.EventPoolBalanceChanged");
  static const ThorchainV1Types eventSwitch =
      ThorchainV1Types._("/types.EventSwitch");
  static const ThorchainV1Types eventSwitchV87 =
      ThorchainV1Types._("/types.EventSwitchV87");
  static const ThorchainV1Types eventMintBurn =
      ThorchainV1Types._("/types.EventMintBurn");
  static const ThorchainV1Types eventTradeAccountDeposit =
      ThorchainV1Types._("/types.EventTradeAccountDeposit");
  static const ThorchainV1Types eventTradeAccountWithdraw =
      ThorchainV1Types._("/types.EventTradeAccountWithdraw");
  static const ThorchainV1Types eventLoanOpen =
      ThorchainV1Types._("/types.EventLoanOpen");
  static const ThorchainV1Types eventTHORName =
      ThorchainV1Types._("/types.EventTHORName");
  static const ThorchainV1Types eventSetMimir =
      ThorchainV1Types._("/types.EventSetMimir");
  static const ThorchainV1Types eventSetNodeMimir =
      ThorchainV1Types._("/types.EventSetNodeMimir");
  static const ThorchainV1Types eventVersion =
      ThorchainV1Types._("/types.EventVersion");
  static const ThorchainV1Types jail = ThorchainV1Types._("/types.Jail");
  static const ThorchainV1Types liquidityProvider =
      ThorchainV1Types._("/types.LiquidityProvider");
  static const ThorchainV1Types loan = ThorchainV1Types._("/types.Loan");
  static const ThorchainV1Types nodeMimir =
      ThorchainV1Types._("/types.NodeMimir");
  static const ThorchainV1Types nodeMimirs =
      ThorchainV1Types._("/types.NodeMimirs");
  static const ThorchainV1Types network = ThorchainV1Types._("/types.Network");
  static const ThorchainV1Types nodeAccount =
      ThorchainV1Types._("/types.NodeAccount");
  static const ThorchainV1Types bondProvider =
      ThorchainV1Types._("/types.BondProvider");
  static const ThorchainV1Types bondProviders =
      ThorchainV1Types._("/types.BondProviders");
  static const ThorchainV1Types minJoinLast =
      ThorchainV1Types._("/types.MinJoinLast");
  static const ThorchainV1Types nodePauseChain =
      ThorchainV1Types._("/types.NodePauseChain");
  static const ThorchainV1Types observedNetworkFeeVoter =
      ThorchainV1Types._("/types.ObservedNetworkFeeVoter");
  static const ThorchainV1Types protocolOwnedLiquidity =
      ThorchainV1Types._("/types.ProtocolOwnedLiquidity");
  static const ThorchainV1Types ragnarokWithdrawPosition =
      ThorchainV1Types._("/types.RagnarokWithdrawPosition");
  static const ThorchainV1Types solvencyVoter =
      ThorchainV1Types._("/types.SolvencyVoter");
  static const ThorchainV1Types streamingSwap =
      ThorchainV1Types._("/types.StreamingSwap");
  static const ThorchainV1Types thorchainTHORNameAlias =
      ThorchainV1Types._("/types.ThorchainTHORNameAlias");
  static const ThorchainV1Types thorNameAlias =
      ThorchainV1Types._("/types.THORNameAlias");
  static const ThorchainV1Types tradeAccount =
      ThorchainV1Types._("/types.TradeAccount");
  static const ThorchainV1Types tradeUnit =
      ThorchainV1Types._("/types.TradeUnit");
  static const ThorchainV1Types tssKeysignFailVoter =
      ThorchainV1Types._("/types.TssKeysignFailVoter");
  static const ThorchainV1Types nodeTssTime =
      ThorchainV1Types._("/types.NodeTssTime");
  static const ThorchainV1Types tssKeygenMetric =
      ThorchainV1Types._("/types.TssKeygenMetric");
  static const ThorchainV1Types tssKeysignMetric =
      ThorchainV1Types._("/types.TssKeysignMetric");
  static const ThorchainV1Types tssVoter =
      ThorchainV1Types._("/types.TssVoter");
  static const ThorchainV1Types vault = ThorchainV1Types._("/types.Vault");
}
