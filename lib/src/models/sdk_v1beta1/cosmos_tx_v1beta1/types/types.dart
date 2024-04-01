class TxV1beta1Types {
  final String typeUrl;
  const TxV1beta1Types._(this.typeUrl);
  static const TxV1beta1Types simulateRequest =
      TxV1beta1Types._("/cosmos.tx.v1beta1.SimulateRequest");
  static const TxV1beta1Types simulateResponse =
      TxV1beta1Types._("/cosmos.tx.v1beta1.SimulateResponse");
  static const TxV1beta1Types getTxRequest =
      TxV1beta1Types._("/cosmos.tx.v1beta1.GetTxRequest");
  static const TxV1beta1Types getTxResponse =
      TxV1beta1Types._("/cosmos.tx.v1beta1.GetTxResponse");
  static const TxV1beta1Types broadcastTxRequest =
      TxV1beta1Types._("/cosmos.tx.v1beta1.BroadcastTxRequest");
  static const TxV1beta1Types broadcastTxResponse =
      TxV1beta1Types._("/cosmos.tx.v1beta1.BroadcastTxResponse");
  static const TxV1beta1Types getTxsEventRequest =
      TxV1beta1Types._("/cosmos.tx.v1beta1.GetTxsEventRequest");
  static const TxV1beta1Types getTxsEventResponse =
      TxV1beta1Types._("/cosmos.tx.v1beta1.GetTxsEventResponse");
  static const TxV1beta1Types getBlockWithTxsRequest =
      TxV1beta1Types._("/cosmos.tx.v1beta1.GetBlockWithTxsRequest");
  static const TxV1beta1Types getBlockWithTxsResponse =
      TxV1beta1Types._("/cosmos.tx.v1beta1.GetBlockWithTxsResponse");
  static const TxV1beta1Types txDecodeRequest =
      TxV1beta1Types._("/cosmos.tx.v1beta1.TxDecodeRequest");
  static const TxV1beta1Types txDecodeResponse =
      TxV1beta1Types._("/cosmos.tx.v1beta1.TxDecodeResponse");
  static const TxV1beta1Types txEncodeRequest =
      TxV1beta1Types._("/cosmos.tx.v1beta1.TxEncodeRequest");
  static const TxV1beta1Types txEncodeResponse =
      TxV1beta1Types._("/cosmos.tx.v1beta1.TxEncodeResponse");
  static const TxV1beta1Types txEncodeAminoRequest =
      TxV1beta1Types._("/cosmos.tx.v1beta1.TxEncodeAminoRequest");
  static const TxV1beta1Types txEncodeAminoResponse =
      TxV1beta1Types._("/cosmos.tx.v1beta1.TxEncodeAminoResponse");
  static const TxV1beta1Types txDecodeAminoRequest =
      TxV1beta1Types._("/cosmos.tx.v1beta1.TxDecodeAminoRequest");
  static const TxV1beta1Types txDecodeAminoResponse =
      TxV1beta1Types._("/cosmos.tx.v1beta1.TxDecodeAminoResponse");
  static const TxV1beta1Types signDocDirectAux =
      TxV1beta1Types._("/cosmos.tx.v1beta1.SignDocDirectAux");
  static const TxV1beta1Types auxSignerData =
      TxV1beta1Types._("/cosmos.tx.v1beta1.AuxSignerData");
  static const TxV1beta1Types tx = TxV1beta1Types._("/cosmos.tx.v1beta1.Tx");
  static const TxV1beta1Types txBody =
      TxV1beta1Types._("/cosmos.tx.v1beta1.TxBody");
  static const TxV1beta1Types txRaw =
      TxV1beta1Types._("/cosmos.tx.v1beta1.TxRaw");
  static const TxV1beta1Types tip = TxV1beta1Types._("/cosmos.tx.v1beta1.Tip");
  static const TxV1beta1Types signerInfo =
      TxV1beta1Types._("/cosmos.tx.v1beta1.SignerInfo");
  static const TxV1beta1Types signDoc =
      TxV1beta1Types._("/cosmos.tx.v1beta1.SignDoc");
  static const TxV1beta1Types modeInfoSingle =
      TxV1beta1Types._("/cosmos.tx.v1beta1.ModeInfo.Single");
  static const TxV1beta1Types modeInfoMulti =
      TxV1beta1Types._("/cosmos.tx.v1beta1.ModeInfo.Multi");
  static const TxV1beta1Types modeInfo =
      TxV1beta1Types._("/cosmos.tx.v1beta1.ModeInfo");
  static const TxV1beta1Types fee = TxV1beta1Types._("/cosmos.tx.v1beta1.Fee");
  static const TxV1beta1Types authInfo =
      TxV1beta1Types._("/cosmos.tx.v1beta1.AuthInfo");

  /// queries
  static const TxV1beta1Types simulate =
      TxV1beta1Types._("/cosmos.tx.v1beta1.Service/Simulate");
  static const TxV1beta1Types getTx =
      TxV1beta1Types._("/cosmos.tx.v1beta1.Service/GetTx");
  static const TxV1beta1Types broadcastTx =
      TxV1beta1Types._("/cosmos.tx.v1beta1.Service/BroadcastTx");
  static const TxV1beta1Types getTxsEvent =
      TxV1beta1Types._("/cosmos.tx.v1beta1.Service/GetTxsEvent");
  static const TxV1beta1Types getBlockWithTxs =
      TxV1beta1Types._("/cosmos.tx.v1beta1.Service/GetBlockWithTxs");
  static const TxV1beta1Types txDecode =
      TxV1beta1Types._("/cosmos.tx.v1beta1.Service/TxDecode");
  static const TxV1beta1Types txEncode =
      TxV1beta1Types._("/cosmos.tx.v1beta1.Service/TxEncode");
  static const TxV1beta1Types txEncodeAmino =
      TxV1beta1Types._("/cosmos.tx.v1beta1.Service/TxEncodeAmino");
  static const TxV1beta1Types txDecodeAmino =
      TxV1beta1Types._("/cosmos.tx.v1beta1.Service/TxDecodeAmino");
}
