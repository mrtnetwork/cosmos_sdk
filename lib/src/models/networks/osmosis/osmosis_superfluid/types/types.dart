import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class OsmosisSuperfluidTypes extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc;
  const OsmosisSuperfluidTypes._(this.typeUrl, {this.rpc});
  static const OsmosisSuperfluidTypes genesisState =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.GenesisState");
  static const OsmosisSuperfluidTypes lockIdIntermediaryAccountConnection =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.LockIdIntermediaryAccountConnection");
  static const OsmosisSuperfluidTypes superfluidIntermediaryAccountInfo =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.SuperfluidIntermediaryAccountInfo");
  static const OsmosisSuperfluidTypes unpoolWhitelistedPools =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.UnpoolWhitelistedPools");
  static const OsmosisSuperfluidTypes superfluidIntermediaryAccount =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.SuperfluidIntermediaryAccount");
  static const OsmosisSuperfluidTypes superfluidDelegationRecord =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.SuperfluidDelegationRecord");
  static const OsmosisSuperfluidTypes superfluidAsset =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.SuperfluidAsset");
  static const OsmosisSuperfluidTypes params =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.Params");
  static const OsmosisSuperfluidTypes osmoEquivalentMultiplierRecord =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.OsmoEquivalentMultiplierRecord");

  static const OsmosisSuperfluidTypes msgSuperfluidDelegate =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.MsgSuperfluidDelegate");
  static const OsmosisSuperfluidTypes msgSuperfluidDelegateResponse =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.MsgSuperfluidDelegateResponse");

  static const OsmosisSuperfluidTypes msgSuperfluidUndelegate =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.MsgSuperfluidUndelegate");
  static const OsmosisSuperfluidTypes msgSuperfluidUndelegateResponse =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.MsgSuperfluidUndelegateResponse");

  static const OsmosisSuperfluidTypes msgSuperfluidUnbondLock =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.MsgSuperfluidUnbondLock");
  static const OsmosisSuperfluidTypes msgSuperfluidUnbondLockResponse =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.MsgSuperfluidUndelegateResponse");

  static const OsmosisSuperfluidTypes msgLockAndSuperfluidDelegate =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.MsgLockAndSuperfluidDelegate");
  static const OsmosisSuperfluidTypes msgLockAndSuperfluidDelegateResponse =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.MsgLockAndSuperfluidDelegateResponse");

  static const OsmosisSuperfluidTypes msgUnPoolWhitelistedPool =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.MsgUnPoolWhitelistedPool");
  static const OsmosisSuperfluidTypes msgUnPoolWhitelistedPoolResponse =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.MsgUnPoolWhitelistedPoolResponse");

  static const OsmosisSuperfluidTypes queryParamsRequest =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.QueryParamsRequest");
  static const OsmosisSuperfluidTypes queryParamsResponse =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.QueryParamsResponse");

  static const OsmosisSuperfluidTypes assetTypeRequest =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.AssetTypeRequest");
  static const OsmosisSuperfluidTypes assetTypeResponse =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.AssetTypeResponse");

  static const OsmosisSuperfluidTypes allAssetsRequest =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.AllAssetsRequest");
  static const OsmosisSuperfluidTypes allAssetsResponse =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.AllAssetsResponse");

  static const OsmosisSuperfluidTypes assetMultiplierRequest =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.AssetMultiplierRequest");
  static const OsmosisSuperfluidTypes assetMultiplierResponse =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.AssetMultiplierResponse");

  static const OsmosisSuperfluidTypes allIntermediaryAccountsRequest =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.AllIntermediaryAccountsRequest");
  static const OsmosisSuperfluidTypes allIntermediaryAccountsResponse =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.AllIntermediaryAccountsResponse");

  static const OsmosisSuperfluidTypes connectedIntermediaryAccountRequest =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.ConnectedIntermediaryAccountRequest");
  static const OsmosisSuperfluidTypes connectedIntermediaryAccountResponse =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.ConnectedIntermediaryAccountResponse");

  static const OsmosisSuperfluidTypes totalSuperfluidDelegationsRequest =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.TotalSuperfluidDelegationsRequest");
  static const OsmosisSuperfluidTypes totalSuperfluidDelegationsResponse =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.TotalSuperfluidDelegationsResponse");

  static const OsmosisSuperfluidTypes superfluidDelegationAmountRequest =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.SuperfluidDelegationAmountRequest");
  static const OsmosisSuperfluidTypes superfluidDelegationAmountResponse =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.SuperfluidDelegationAmountResponse");

  static const OsmosisSuperfluidTypes superfluidDelegationsByDelegatorRequest =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.SuperfluidDelegationsByDelegatorRequest");
  static const OsmosisSuperfluidTypes superfluidDelegationsByDelegatorResponse =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.SuperfluidDelegationsByDelegatorResponse");

  static const OsmosisSuperfluidTypes
      superfluidUndelegationsByDelegatorRequest = OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.SuperfluidUndelegationsByDelegatorRequest");
  static const OsmosisSuperfluidTypes
      superfluidUndelegationsByDelegatorResponse = OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.SuperfluidUndelegationsByDelegatorResponse");

  static const OsmosisSuperfluidTypes
      superfluidDelegationsByValidatorDenomRequest = OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.SuperfluidDelegationsByValidatorDenomRequest");
  static const OsmosisSuperfluidTypes
      superfluidDelegationsByValidatorDenomResponse = OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.SuperfluidDelegationsByValidatorDenomResponse");

  static const OsmosisSuperfluidTypes
      estimateSuperfluidDelegatedAmountByValidatorDenomRequest =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.EstimateSuperfluidDelegatedAmountByValidatorDenomRequest");
  static const OsmosisSuperfluidTypes
      estimateSuperfluidDelegatedAmountByValidatorDenomResponse =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.EstimateSuperfluidDelegatedAmountByValidatorDenomResponse");

  static const OsmosisSuperfluidTypes queryTotalDelegationByDelegatorRequest =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.QueryTotalDelegationByDelegatorRequest");
  static const OsmosisSuperfluidTypes queryTotalDelegationByDelegatorResponse =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.QueryTotalDelegationByDelegatorResponse");

  /// query

  static const OsmosisSuperfluidTypes totalDelegationByDelegator =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.Query/TotalDelegationByDelegator",
          rpc:
              "/osmosis/superfluid/v1beta1/total_delegation_by_delegator/:delegator_address");
  static const OsmosisSuperfluidTypes
      estimateSuperfluidDelegatedAmountByValidatorDenom =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.Query/EstimateSuperfluidDelegatedAmountByValidatorDenom",
          rpc:
              "/osmosis/superfluid/v1beta1/estimate_superfluid_delegation_amount_by_validator_denom");
  static const OsmosisSuperfluidTypes superfluidDelegationsByValidatorDenom =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.Query/SuperfluidDelegationsByValidatorDenom",
          rpc:
              "/osmosis/superfluid/v1beta1/superfluid_delegations_by_validator_denom");
  static const OsmosisSuperfluidTypes superfluidUndelegationsByDelegator =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.Query/SuperfluidUndelegationsByDelegator",
          rpc:
              "/osmosis/superfluid/v1beta1/superfluid_undelegations_by_delegator/:delegator_address");
  static const OsmosisSuperfluidTypes superfluidDelegationsByDelegator =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.Query/SuperfluidDelegationsByDelegator",
          rpc:
              "/osmosis/superfluid/v1beta1/superfluid_delegations/:delegator_address");

  static const OsmosisSuperfluidTypes superfluidDelegationAmount =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.Query/SuperfluidDelegationAmount",
          rpc: "/osmosis/superfluid/v1beta1/superfluid_delegation_amount");

  static const OsmosisSuperfluidTypes totalSuperfluidDelegations =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.Query/TotalSuperfluidDelegations",
          rpc: "/osmosis/superfluid/v1beta1/all_superfluid_delegations/");

  static const OsmosisSuperfluidTypes connectedIntermediaryAccount =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.Query/ConnectedIntermediaryAccount",
          rpc:
              "/osmosis/superfluid/v1beta1/connected_intermediary_account/:lock_id");

  static const OsmosisSuperfluidTypes allIntermediaryAccounts =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.Query/AllIntermediaryAccounts",
          rpc: "/osmosis/superfluid/v1beta1/all_intermediary_accounts");
  static const OsmosisSuperfluidTypes assetMultiplier =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.Query/AssetMultiplier",
          rpc: "/osmosis/superfluid/v1beta1/asset_multiplier");
  static const OsmosisSuperfluidTypes allAssets = OsmosisSuperfluidTypes._(
      "/osmosis.superfluid.Query/AllAssets",
      rpc: "/osmosis/superfluid/v1beta1/all_assets");
  static const OsmosisSuperfluidTypes assetType = OsmosisSuperfluidTypes._(
      "/osmosis.superfluid.Query/AssetType",
      rpc: "/osmosis/superfluid/v1beta1/asset_type");
  static const OsmosisSuperfluidTypes queryParams = OsmosisSuperfluidTypes._(
      "/osmosis.superfluid.Query/Params",
      rpc: "/osmosis/superfluid/v1beta1/params");

  /// services
  static const OsmosisSuperfluidTypes unPoolWhitelistedPool =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.Msg/UnPoolWhitelistedPool");
  static const OsmosisSuperfluidTypes lockAndSuperfluidDelegate =
      OsmosisSuperfluidTypes._(
          "/osmosis.superfluid.Msg/LockAndSuperfluidDelegate");
  static const OsmosisSuperfluidTypes superfluidUnbondLock =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.Msg/SuperfluidUnbondLock");
  static const OsmosisSuperfluidTypes superfluidUndelegate =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.Msg/SuperfluidUndelegate");
  static const OsmosisSuperfluidTypes superfluidDelegate =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.Msg/SuperfluidDelegate");
}
