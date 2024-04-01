class FeegrantV1beta1Types {
  final String typeUrl;
  const FeegrantV1beta1Types._(this.typeUrl);

  static const FeegrantV1beta1Types feeGrant =
      FeegrantV1beta1Types._("/cosmos.feegrant.v1beta1.Grant");
  static const FeegrantV1beta1Types msgGrantAllowance =
      FeegrantV1beta1Types._("/cosmos.feegrant.v1beta1.MsgGrantAllowance");
  static const FeegrantV1beta1Types msgGrantAllowanceResponse =
      FeegrantV1beta1Types._(
          "/cosmos.feegrant.v1beta1.MsgGrantAllowanceResponse");
  static const FeegrantV1beta1Types msgPruneAllowances =
      FeegrantV1beta1Types._("/cosmos.feegrant.v1beta1.MsgPruneAllowances");
  static const FeegrantV1beta1Types msgPruneAllowancesResponse =
      FeegrantV1beta1Types._(
          "/cosmos.feegrant.v1beta1.MsgPruneAllowancesResponse");
  static const FeegrantV1beta1Types msgRevokeAllowance =
      FeegrantV1beta1Types._("/cosmos.feegrant.v1beta1.MsgRevokeAllowance");
  static const FeegrantV1beta1Types msgRevokeAllowanceResponse =
      FeegrantV1beta1Types._(
          "/cosmos.feegrant.v1beta1.MsgRevokeAllowanceResponse");
  static const FeegrantV1beta1Types basicAllowance =
      FeegrantV1beta1Types._("/cosmos.feegrant.v1beta1.BasicAllowance");
  static const FeegrantV1beta1Types feeGrantGenesisState =
      FeegrantV1beta1Types._("/cosmos.feegrant.v1beta1.GenesisState");
  static const FeegrantV1beta1Types periodicAllowance =
      FeegrantV1beta1Types._("/cosmos.feegrant.v1beta1.PeriodicAllowance");
  static const FeegrantV1beta1Types queryAllowanceRequest =
      FeegrantV1beta1Types._("/cosmos.feegrant.v1beta1.QueryAllowanceRequest");
  static const FeegrantV1beta1Types queryAllowanceResponse =
      FeegrantV1beta1Types._("/cosmos.feegrant.v1beta1.QueryAllowanceResponse");
  static const FeegrantV1beta1Types queryAllowancesRequest =
      FeegrantV1beta1Types._("/cosmos.feegrant.v1beta1.QueryAllowancesRequest");
  static const FeegrantV1beta1Types queryAllowancesResponse =
      FeegrantV1beta1Types._(
          "/cosmos.feegrant.v1beta1.QueryAllowancesResponse");
  static const FeegrantV1beta1Types queryAllowancesByGranterRequest =
      FeegrantV1beta1Types._(
          "/cosmos.feegrant.v1beta1.QueryAllowancesByGranterRequest");
  static const FeegrantV1beta1Types queryAllowancesByGranterResponse =
      FeegrantV1beta1Types._(
          "/cosmos.feegrant.v1beta1.QueryAllowancesByGranterResponse");

  /// queries
  static const FeegrantV1beta1Types allowance =
      FeegrantV1beta1Types._("/cosmos.feegrant.v1beta1.Query/Allowance");
  static const FeegrantV1beta1Types allowances =
      FeegrantV1beta1Types._("/cosmos.feegrant.v1beta1.Query/Allowances");
  static const FeegrantV1beta1Types allowancesByGranter =
      FeegrantV1beta1Types._(
          "/cosmos.feegrant.v1beta1.Query/AllowancesByGranter");

  /// service
  static const FeegrantV1beta1Types grantAllowance =
      FeegrantV1beta1Types._("/cosmos.authz.v1beta1.Msg/GrantAllowance");
  static const FeegrantV1beta1Types pruneAllowances =
      FeegrantV1beta1Types._("/cosmos.authz.v1beta1.Msg/PruneAllowances");
  static const FeegrantV1beta1Types revokeAllowance =
      FeegrantV1beta1Types._("/cosmos.authz.v1beta1.Msg/RevokeAllowance");
}
