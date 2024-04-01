class ParamsV1beta1 {
  final String typeUrl;
  const ParamsV1beta1._(this.typeUrl);

  static const ParamsV1beta1 paramsSubspace =
      ParamsV1beta1._("/cosmos.params.v1beta1.Subspace");
  static const ParamsV1beta1 paramChange =
      ParamsV1beta1._("/cosmos.params.v1beta1.ParamChange");
  static const ParamsV1beta1 parameterChangeProposal =
      ParamsV1beta1._("/cosmos.params.v1beta1.ParameterChangeProposal");
  static const ParamsV1beta1 paramsQueryParamsRequest =
      ParamsV1beta1._("/cosmos.params.v1beta1.QueryParamsRequest");
  static const ParamsV1beta1 paramsQueryParamsResponse =
      ParamsV1beta1._("/cosmos.params.v1beta1.QueryParamsResponse");
  static const ParamsV1beta1 paramsQuerySubspacesRequest =
      ParamsV1beta1._("/cosmos.params.v1beta1.QuerySubspacesRequest");
  static const ParamsV1beta1 paramsQuerySubspacesResponse =
      ParamsV1beta1._("/cosmos.params.v1beta1.QuerySubspacesResponse");

  /// queries
  static const ParamsV1beta1 paramsParams =
      ParamsV1beta1._("/cosmos.params.v1beta1.Query/Params");
  static const ParamsV1beta1 paramsSubspaces =
      ParamsV1beta1._("/cosmos.params.v1beta1.Query/Subspaces");
}
