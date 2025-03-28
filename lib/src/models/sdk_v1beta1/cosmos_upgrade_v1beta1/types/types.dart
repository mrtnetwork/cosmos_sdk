import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class UpgradeV1beta1Types extends TypeUrl {
  const UpgradeV1beta1Types._(super.typeUrl, {super.query, super.rpc});
  static const String root = "/cosmos.upgrade.v1beta1";
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
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.QueryCurrentPlanRequest",
          query: "/cosmos.upgrade.v1beta1.Query/CurrentPlan",
          rpc: "/cosmos/upgrade/v1beta1/current_plan");
  static const UpgradeV1beta1Types queryCurrentPlanResponse =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.QueryCurrentPlanResponse");
  static const UpgradeV1beta1Types queryAppliedPlanRequest =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.QueryAppliedPlanRequest",
          query: "/cosmos.upgrade.v1beta1.Query/AppliedPlan",
          rpc: "/cosmos/upgrade/v1beta1/applied_plan/:name");
  static const UpgradeV1beta1Types queryAppliedPlanResponse =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.QueryAppliedPlanResponse");
  static const UpgradeV1beta1Types queryModuleVersionsRequest =
      UpgradeV1beta1Types._(
          "/cosmos.upgrade.v1beta1.QueryModuleVersionsRequest",
          query: "/cosmos.upgrade.v1beta1.Query/ModuleVersions",
          rpc: "/cosmos/upgrade/v1beta1/module_versions");
  static const UpgradeV1beta1Types queryModuleVersionsResponse =
      UpgradeV1beta1Types._(
          "/cosmos.upgrade.v1beta1.QueryModuleVersionsResponse");
  static const UpgradeV1beta1Types moduleVersion =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.ModuleVersion");
  static const UpgradeV1beta1Types queryAuthorityRequest =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.QueryAuthorityRequest",
          query: "/cosmos.upgrade.v1beta1.Query/Authority",
          rpc: "/cosmos/upgrade/v1beta1/authority");
  static const UpgradeV1beta1Types queryAuthorityResponse =
      UpgradeV1beta1Types._("/cosmos.upgrade.v1beta1.QueryAuthorityResponse");

  static const List<TypeUrl> services = [msgCancelUpgrade, msgSoftwareUpgrade];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
