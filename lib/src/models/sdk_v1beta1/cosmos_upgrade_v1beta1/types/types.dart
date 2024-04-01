class UpgradeV1beta1Types {
  final String typeUrl;
  const UpgradeV1beta1Types._(this.typeUrl);
  static const UpgradeV1beta1Types plan =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.Plan");
  static const UpgradeV1beta1Types msgSoftwareUpgrade =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.MsgSoftwareUpgrade");
  static const UpgradeV1beta1Types msgSoftwareUpgradeResponse =
      UpgradeV1beta1Types._(
          "/cosmos.upgrade.v1beta1.MsgSoftwareUpgradeResponse");
  static const UpgradeV1beta1Types msgCancelUpgrade =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.MsgCancelUpgrade");
  static const UpgradeV1beta1Types msgCancelUpgradeResponse =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.MsgCancelUpgrade");
  static const UpgradeV1beta1Types queryCurrentPlanRequest =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.QueryCurrentPlanRequest");
  static const UpgradeV1beta1Types queryCurrentPlanResponse =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.QueryCurrentPlanResponse");
  static const UpgradeV1beta1Types queryAppliedPlanRequest =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.QueryAppliedPlanRequest");
  static const UpgradeV1beta1Types queryAppliedPlanResponse =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.QueryAppliedPlanResponse");
  static const UpgradeV1beta1Types queryModuleVersionsRequest =
      UpgradeV1beta1Types._(
          "/cosmos.upgrade.v1beta1.QueryModuleVersionsRequest");
  static const UpgradeV1beta1Types queryModuleVersionsResponse =
      UpgradeV1beta1Types._(
          "/cosmos.upgrade.v1beta1.QueryModuleVersionsResponse");
  static const UpgradeV1beta1Types moduleVersion =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.ModuleVersion");
  static const UpgradeV1beta1Types queryAuthorityRequest =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.QueryAuthorityRequest");
  static const UpgradeV1beta1Types queryAuthorityResponse =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.QueryAuthorityResponse");

  /// queries
  static const UpgradeV1beta1Types currentPlan =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.Query/CurrentPlan");
  static const UpgradeV1beta1Types appliedPlan =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.Query/AppliedPlan");
  static const UpgradeV1beta1Types moduleVersions =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.Query/ModuleVersions");
  static const UpgradeV1beta1Types authority =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.Query/Authority");

  /// services
  static const UpgradeV1beta1Types softwareUpgrade =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.Msg/SoftwareUpgrade");
  static const UpgradeV1beta1Types cancelUpgrade =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.Msg/CancelUpgrade");
}
