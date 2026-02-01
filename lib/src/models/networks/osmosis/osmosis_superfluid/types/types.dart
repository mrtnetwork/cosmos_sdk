import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisSuperfluidTypes extends TypeUrl {
  const OsmosisSuperfluidTypes._(super.typeUrl, {super.query, super.rpc});
  static const String root = "/osmosis.superfluid";

  static const OsmosisSuperfluidTypes genesisState = OsmosisSuperfluidTypes._(
    "/osmosis.superfluid.GenesisState",
  );
  static const OsmosisSuperfluidTypes lockIdIntermediaryAccountConnection =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.LockIdIntermediaryAccountConnection",
      );
  static const OsmosisSuperfluidTypes superfluidIntermediaryAccountInfo =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.SuperfluidIntermediaryAccountInfo",
      );
  static const OsmosisSuperfluidTypes unpoolWhitelistedPools =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.UnpoolWhitelistedPools");
  static const OsmosisSuperfluidTypes superfluidIntermediaryAccount =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.SuperfluidIntermediaryAccount",
      );
  static const OsmosisSuperfluidTypes superfluidDelegationRecord =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.SuperfluidDelegationRecord",
      );
  static const OsmosisSuperfluidTypes superfluidAsset =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.SuperfluidAsset");
  static const OsmosisSuperfluidTypes params = OsmosisSuperfluidTypes._(
    "/osmosis.superfluid.Params",
  );
  static const OsmosisSuperfluidTypes osmoEquivalentMultiplierRecord =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.OsmoEquivalentMultiplierRecord",
      );

  static const OsmosisSuperfluidTypes msgSuperfluidDelegate =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.MsgSuperfluidDelegate");
  static const OsmosisSuperfluidTypes msgSuperfluidDelegateResponse =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.MsgSuperfluidDelegateResponse",
      );

  static const OsmosisSuperfluidTypes msgSuperfluidUndelegate =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.MsgSuperfluidUndelegate");
  static const OsmosisSuperfluidTypes msgSuperfluidUndelegateResponse =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.MsgSuperfluidUndelegateResponse",
      );

  static const OsmosisSuperfluidTypes msgSuperfluidUnbondLock =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.MsgSuperfluidUnbondLock");
  static const OsmosisSuperfluidTypes msgSuperfluidUnbondLockResponse =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.MsgSuperfluidUndelegateResponse",
      );

  static const OsmosisSuperfluidTypes msgLockAndSuperfluidDelegate =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.MsgLockAndSuperfluidDelegate",
      );
  static const OsmosisSuperfluidTypes msgLockAndSuperfluidDelegateResponse =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.MsgLockAndSuperfluidDelegateResponse",
      );

  static const OsmosisSuperfluidTypes msgUnPoolWhitelistedPool =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.MsgUnPoolWhitelistedPool");
  static const OsmosisSuperfluidTypes msgUnPoolWhitelistedPoolResponse =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.MsgUnPoolWhitelistedPoolResponse",
      );

  static const OsmosisSuperfluidTypes queryParamsRequest =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.QueryParamsRequest",
        query: "/osmosis.superfluid.Query/Params",
        rpc: "/osmosis/superfluid/v1beta1/params",
      );
  static const OsmosisSuperfluidTypes queryParamsResponse =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.QueryParamsResponse");

  static const OsmosisSuperfluidTypes assetTypeRequest =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.AssetTypeRequest",
        query: "/osmosis.superfluid.Query/AssetType",
        rpc: "/osmosis/superfluid/v1beta1/asset_type",
      );
  static const OsmosisSuperfluidTypes assetTypeResponse =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.AssetTypeResponse");

  static const OsmosisSuperfluidTypes allAssetsRequest =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.AllAssetsRequest",
        query: "/osmosis.superfluid.Query/AllAssets",
        rpc: "/osmosis/superfluid/v1beta1/all_assets",
      );
  static const OsmosisSuperfluidTypes allAssetsResponse =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.AllAssetsResponse");

  static const OsmosisSuperfluidTypes assetMultiplierRequest =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.AssetMultiplierRequest",
        query: "/osmosis.superfluid.Query/AssetMultiplier",
        rpc: "/osmosis/superfluid/v1beta1/asset_multiplier",
      );
  static const OsmosisSuperfluidTypes assetMultiplierResponse =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.AssetMultiplierResponse");

  static const OsmosisSuperfluidTypes allIntermediaryAccountsRequest =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.AllIntermediaryAccountsRequest",
        query: "/osmosis.superfluid.Query/AllIntermediaryAccounts",
        rpc: "/osmosis/superfluid/v1beta1/all_intermediary_accounts",
      );
  static const OsmosisSuperfluidTypes allIntermediaryAccountsResponse =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.AllIntermediaryAccountsResponse",
      );

  static const OsmosisSuperfluidTypes
  connectedIntermediaryAccountRequest = OsmosisSuperfluidTypes._(
    "/osmosis.superfluid.ConnectedIntermediaryAccountRequest",
    query: "/osmosis.superfluid.Query/ConnectedIntermediaryAccount",
    rpc: "/osmosis/superfluid/v1beta1/connected_intermediary_account/:lock_id",
  );
  static const OsmosisSuperfluidTypes connectedIntermediaryAccountResponse =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.ConnectedIntermediaryAccountResponse",
      );

  static const OsmosisSuperfluidTypes totalSuperfluidDelegationsRequest =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.TotalSuperfluidDelegationsRequest",
        query: "/osmosis.superfluid.Query/TotalSuperfluidDelegations",
        rpc: "/osmosis/superfluid/v1beta1/all_superfluid_delegations/",
      );
  static const OsmosisSuperfluidTypes totalSuperfluidDelegationsResponse =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.TotalSuperfluidDelegationsResponse",
      );

  static const OsmosisSuperfluidTypes superfluidDelegationAmountRequest =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.SuperfluidDelegationAmountRequest",
        query: "/osmosis.superfluid.Query/SuperfluidDelegationAmount",
        rpc: "/osmosis/superfluid/v1beta1/superfluid_delegation_amount",
      );
  static const OsmosisSuperfluidTypes superfluidDelegationAmountResponse =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.SuperfluidDelegationAmountResponse",
      );

  static const OsmosisSuperfluidTypes
  superfluidDelegationsByDelegatorRequest = OsmosisSuperfluidTypes._(
    "/osmosis.superfluid.SuperfluidDelegationsByDelegatorRequest",
    query: "/osmosis.superfluid.Query/SuperfluidDelegationsByDelegator",
    rpc:
        "/osmosis/superfluid/v1beta1/superfluid_delegations/:delegator_address",
  );
  static const OsmosisSuperfluidTypes superfluidDelegationsByDelegatorResponse =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.SuperfluidDelegationsByDelegatorResponse",
      );

  static const OsmosisSuperfluidTypes
  superfluidUndelegationsByDelegatorRequest = OsmosisSuperfluidTypes._(
    "/osmosis.superfluid.SuperfluidUndelegationsByDelegatorRequest",
    query: "/osmosis.superfluid.Query/SuperfluidUndelegationsByDelegator",
    rpc:
        "/osmosis/superfluid/v1beta1/superfluid_undelegations_by_delegator/:delegator_address",
  );
  static const OsmosisSuperfluidTypes
  superfluidUndelegationsByDelegatorResponse = OsmosisSuperfluidTypes._(
    "/osmosis.superfluid.SuperfluidUndelegationsByDelegatorResponse",
  );

  static const OsmosisSuperfluidTypes
  superfluidDelegationsByValidatorDenomRequest = OsmosisSuperfluidTypes._(
    "/osmosis.superfluid.SuperfluidDelegationsByValidatorDenomRequest",
    query: "/osmosis.superfluid.Query/SuperfluidDelegationsByValidatorDenom",
    rpc:
        "/osmosis/superfluid/v1beta1/superfluid_delegations_by_validator_denom",
  );
  static const OsmosisSuperfluidTypes
  superfluidDelegationsByValidatorDenomResponse = OsmosisSuperfluidTypes._(
    "/osmosis.superfluid.SuperfluidDelegationsByValidatorDenomResponse",
  );

  static const OsmosisSuperfluidTypes
  estimateSuperfluidDelegatedAmountByValidatorDenomRequest = OsmosisSuperfluidTypes._(
    "/osmosis.superfluid.EstimateSuperfluidDelegatedAmountByValidatorDenomRequest",
    query:
        "/osmosis.superfluid.Query/EstimateSuperfluidDelegatedAmountByValidatorDenom",
    rpc:
        "/osmosis/superfluid/v1beta1/estimate_superfluid_delegation_amount_by_validator_denom",
  );
  static const OsmosisSuperfluidTypes
  estimateSuperfluidDelegatedAmountByValidatorDenomResponse =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.EstimateSuperfluidDelegatedAmountByValidatorDenomResponse",
      );

  static const OsmosisSuperfluidTypes
  queryTotalDelegationByDelegatorRequest = OsmosisSuperfluidTypes._(
    "/osmosis.superfluid.QueryTotalDelegationByDelegatorRequest",
    query: "/osmosis.superfluid.Query/TotalDelegationByDelegator",
    rpc:
        "/osmosis/superfluid/v1beta1/total_delegation_by_delegator/:delegator_address",
  );
  static const OsmosisSuperfluidTypes queryTotalDelegationByDelegatorResponse =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.QueryTotalDelegationByDelegatorResponse",
      );

  static const OsmosisSuperfluidTypes msgSuperfluidUndelegateAndUnbondLock =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.MsgSuperfluidUndelegateAndUnbondLock",
      );
  static const OsmosisSuperfluidTypes
  msgSuperfluidUndelegateAndUnbondLockResponse = OsmosisSuperfluidTypes._(
    "/osmosis.superfluid.MsgSuperfluidUndelegateAndUnbondLockResponse",
  );

  static const OsmosisSuperfluidTypes
  msgCreateFullRangePositionAndSuperfluidDelegate = OsmosisSuperfluidTypes._(
    "/osmosis.superfluid.MsgCreateFullRangePositionAndSuperfluidDelegate",
  );
  static const OsmosisSuperfluidTypes
  msgCreateFullRangePositionAndSuperfluidDelegateResponse =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.MsgCreateFullRangePositionAndSuperfluidDelegateResponse",
      );

  static const OsmosisSuperfluidTypes
  msgUnlockAndMigrateSharesToFullRangeConcentratedPosition =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.MsgUnlockAndMigrateSharesToFullRangeConcentratedPosition",
      );
  static const OsmosisSuperfluidTypes
  msgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.MsgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse",
      );

  static const OsmosisSuperfluidTypes
  msgAddToConcentratedLiquiditySuperfluidPosition = OsmosisSuperfluidTypes._(
    "/osmosis.superfluid.MsgAddToConcentratedLiquiditySuperfluidPosition",
  );
  static const OsmosisSuperfluidTypes
  msgAddToConcentratedLiquiditySuperfluidPositionResponse =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.MsgAddToConcentratedLiquiditySuperfluidPositionResponse",
      );

  static const OsmosisSuperfluidTypes msgUnbondConvertAndStake =
      OsmosisSuperfluidTypes._("/osmosis.superfluid.MsgUnbondConvertAndStake");
  static const OsmosisSuperfluidTypes msgUnbondConvertAndStakeResponse =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.MsgUnbondConvertAndStakeResponse",
      );

  static const OsmosisSuperfluidTypes queryUnpoolWhitelistRequest =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.QueryUnpoolWhitelistRequest",
        query: "/osmosis.superfluid.Query/UnpoolWhitelist",
        rpc: "/osmosis/superfluid/v1beta1/unpool_whitelist",
      );
  static const OsmosisSuperfluidTypes queryUnpoolWhitelistResponse =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.QueryUnpoolWhitelistResponse",
      );

  static const OsmosisSuperfluidTypes concentratedPoolUserPositionRecord =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.ConcentratedPoolUserPositionRecord",
      );

  static const OsmosisSuperfluidTypes
  userConcentratedSuperfluidPositionsDelegatedRequest = OsmosisSuperfluidTypes._(
    "/osmosis.superfluid.UserConcentratedSuperfluidPositionsDelegatedRequest",
    query:
        "/osmosis.superfluid.Query/UserConcentratedSuperfluidPositionsDelegated",
    rpc:
        "/osmosis/superfluid/v1beta1/account_delegated_cl_positions/:delegator_address",
  );
  static const OsmosisSuperfluidTypes
  userConcentratedSuperfluidPositionsDelegatedResponse = OsmosisSuperfluidTypes._(
    "/osmosis.superfluid.UserConcentratedSuperfluidPositionsDelegatedResponse",
  );

  static const OsmosisSuperfluidTypes
  userConcentratedSuperfluidPositionsUndelegatingRequest = OsmosisSuperfluidTypes._(
    "/osmosis.superfluid.UserConcentratedSuperfluidPositionsUndelegatingRequest",
    query:
        "/osmosis.superfluid.Query/UserConcentratedSuperfluidPositionsUndelegating",
    rpc:
        "/osmosis/superfluid/v1beta1/account_undelegating_cl_positions/:delegator_address",
  );
  static const OsmosisSuperfluidTypes
  userConcentratedSuperfluidPositionsUndelegatingResponse =
      OsmosisSuperfluidTypes._(
        "/osmosis.superfluid.UserConcentratedSuperfluidPositionsUndelegatingResponse",
      );

  static const List<TypeUrl> services = [
    msgAddToConcentratedLiquiditySuperfluidPosition,
    msgCreateFullRangePositionAndSuperfluidDelegate,
    msgLockAndSuperfluidDelegate,
    msgSuperfluidDelegate,
    msgSuperfluidUnbondLock,
    msgSuperfluidUndelegateAndUnbondLock,
    msgSuperfluidUndelegate,
    msgUnPoolWhitelistedPool,
    msgUnbondConvertAndStake,
    msgUnlockAndMigrateSharesToFullRangeConcentratedPosition,
  ];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
