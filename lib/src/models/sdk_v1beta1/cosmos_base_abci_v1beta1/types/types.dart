class BaseAbciV1beta1 {
  final String typeUrl;
  const BaseAbciV1beta1._(this.typeUrl);
  static const BaseAbciV1beta1 searchTxsResult =
      BaseAbciV1beta1._("/cosmos.base.abci.v1beta1.SearchTxsResult");
  static const BaseAbciV1beta1 txResponse =
      BaseAbciV1beta1._("/cosmos.base.abci.v1beta1.TxResponse");
  static const BaseAbciV1beta1 msgData =
      BaseAbciV1beta1._("/cosmos.base.abci.v1beta1.MsgData");
  static const BaseAbciV1beta1 txMsgData =
      BaseAbciV1beta1._("/cosmos.base.abci.v1beta1.TxMsgData");
  static const BaseAbciV1beta1 gasInfo =
      BaseAbciV1beta1._("/cosmos.base.abci.v1beta1.GasInfo");
  static const BaseAbciV1beta1 result =
      BaseAbciV1beta1._("/cosmos.base.abci.v1beta1.Result");
  static const BaseAbciV1beta1 attribute =
      BaseAbciV1beta1._("/cosmos.base.abci.v1beta1.Attribute");
  static const BaseAbciV1beta1 stringEvent =
      BaseAbciV1beta1._("/cosmos.base.abci.v1beta1.StringEvent");
  static const BaseAbciV1beta1 aBCIMessageLog =
      BaseAbciV1beta1._("/cosmos.base.abci.v1beta1.ABCIMessageLog");
  static const BaseAbciV1beta1 simulationResponse =
      BaseAbciV1beta1._("/cosmos.base.abci.v1beta1.SimulationResponse");
}
