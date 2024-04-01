class MintV1beta1Types {
  final String typeUrl;
  const MintV1beta1Types._(this.typeUrl);
  static const MintV1beta1Types mintParams =
      MintV1beta1Types._("/cosmos.mint.v1beta1.Params");
  static const MintV1beta1Types minter =
      MintV1beta1Types._("/cosmos.mint.v1beta1.Minter");
  static const MintV1beta1Types mintGenesisState =
      MintV1beta1Types._("/cosmos.mint.v1beta1.GenesisState");
  static const MintV1beta1Types msgUpdateMintParams =
      MintV1beta1Types._("/cosmos.mint.v1beta1.MsgUpdateParams");
  static const MintV1beta1Types msgUpdateMintParamsResponse =
      MintV1beta1Types._("/cosmos.mint.v1beta1.MsgUpdateParamsResponse");
  static const MintV1beta1Types queryMintParamsRequest =
      MintV1beta1Types._("/cosmos.mint.v1beta1.QueryParamsRequest");
  static const MintV1beta1Types queryMintParamsResponse =
      MintV1beta1Types._("/cosmos.mint.v1beta1.QueryParamsResponse");
  static const MintV1beta1Types queryInflationRequest =
      MintV1beta1Types._("/cosmos.mint.v1beta1.QueryInflationRequest");
  static const MintV1beta1Types queryInflationResponse =
      MintV1beta1Types._("/cosmos.mint.v1beta1.QueryInflationResponse");
  static const MintV1beta1Types queryAnnualProvisionsRequest =
      MintV1beta1Types._("/cosmos.mint.v1beta1.QueryAnnualProvisionsRequest");
  static const MintV1beta1Types queryAnnualProvisionsResponse =
      MintV1beta1Types._("/cosmos.mint.v1beta1.QueryAnnualProvisionsResponse");

  /// queries
  static const MintV1beta1Types queryMintParams =
      MintV1beta1Types._("/cosmos.mint.v1beta1.Query/Params");
  static const MintV1beta1Types inflation =
      MintV1beta1Types._("/cosmos.mint.v1beta1.Query/Inflation");
  static const MintV1beta1Types annualProvisions =
      MintV1beta1Types._("/cosmos.mint.v1beta1.Query/AnnualProvisions");

  /// service
  static const MintV1beta1Types mintUpdateParams =
      MintV1beta1Types._("/cosmos.mint.v1beta1.Msg/UpdateParams");
}
