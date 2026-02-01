import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class DistributionV1beta1Types extends TypeUrl {
  const DistributionV1beta1Types._(
    super.typeUrl, {
    super.query,
    super.rpc,
    super.aminoType,
  });
  static const String root = "/cosmos.distribution.v1beta1";
  static const DistributionV1beta1Types distributionMsgSetWithdrawAddress =
      DistributionV1beta1Types._(
        "/cosmos.distribution.v1beta1.MsgSetWithdrawAddress",
        aminoType: "cosmos-sdk/MsgModifyWithdrawAddress",
      );
  static const DistributionV1beta1Types
  distributionMsgSetWithdrawAddressResponse = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.MsgSetWithdrawAddressResponse",
  );
  static const DistributionV1beta1Types distributionMsgWithdrawDelegatorReward =
      DistributionV1beta1Types._(
        "/cosmos.distribution.v1beta1.MsgWithdrawDelegatorReward",
        aminoType: "cosmos-sdk/MsgWithdrawDelegationReward",
      );
  static const DistributionV1beta1Types
  distributionMsgWithdrawDelegatorRewardResponse = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.MsgWithdrawDelegatorRewardResponse",
  );

  static const DistributionV1beta1Types
  distributionMsgWithdrawValidatorCommission = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.MsgWithdrawValidatorCommission",
    aminoType: "cosmos-sdk/MsgWithdrawValidatorCommission",
  );
  static const DistributionV1beta1Types
  distributionMsgWithdrawValidatorCommissionResponse =
      DistributionV1beta1Types._(
        "/cosmos.distribution.v1beta1.MsgWithdrawValidatorCommissionResponse",
      );
  static const DistributionV1beta1Types distributionMsgFundCommunityPool =
      DistributionV1beta1Types._(
        "/cosmos.distribution.v1beta1.MsgFundCommunityPool",
        aminoType: "cosmos-sdk/MsgFundCommunityPool",
      );
  static const DistributionV1beta1Types
  distributionMsgFundCommunityPoolResponse = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.MsgFundCommunityPoolResponse",
  );
  static const DistributionV1beta1Types distributionParams =
      DistributionV1beta1Types._("/cosmos.distribution.v1beta1.Params");
  static const DistributionV1beta1Types distributionMsgUpdateParams =
      DistributionV1beta1Types._(
        "/cosmos.distribution.v1beta1.MsgUpdateParams",
      );
  static const DistributionV1beta1Types distributionMsgUpdateParamsResponse =
      DistributionV1beta1Types._(
        "/cosmos.distribution.v1beta1.MsgUpdateParamsResponse",
      );
  static const DistributionV1beta1Types
  distributionMsgDepositValidatorRewardsPool = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.MsgDepositValidatorRewardsPool",
  );
  static const DistributionV1beta1Types
  distributionMsgDepositValidatorRewardsPoolResponse =
      DistributionV1beta1Types._(
        "/cosmos.distribution.v1beta1.MsgDepositValidatorRewardsPoolResponse",
      );
  static const DistributionV1beta1Types distributionQueryParamsRequest =
      DistributionV1beta1Types._(
        "/cosmos.distribution.v1beta1.QueryParamsRequest",
        query: "/cosmos.distribution.v1beta1.Query/Params",
        rpc: "/cosmos/distribution/v1beta1/params",
      );
  static const DistributionV1beta1Types distributionQueryParamsResponse =
      DistributionV1beta1Types._(
        "/cosmos.distribution.v1beta1.QueryParamsResponse",
      );
  static const DistributionV1beta1Types
  distributionQueryValidatorDistributionInfoRequest =
      DistributionV1beta1Types._(
        "/cosmos.distribution.v1beta1.QueryValidatorDistributionInfoRequest",
        query: "/cosmos.distribution.v1beta1.Query/ValidatorDistributionInfo",
        rpc: "/cosmos/distribution/v1beta1/validators/:validator_address",
      );
  static const DistributionV1beta1Types
  distributionQueryValidatorDistributionInfoResponse =
      DistributionV1beta1Types._(
        "/cosmos.distribution.v1beta1.QueryValidatorDistributionInfoResponse",
      );
  static const DistributionV1beta1Types
  distributionValidatorOutstandingRewards = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.ValidatorOutstandingRewards",
  );
  static const DistributionV1beta1Types
  distributionValidatorOutstandingRewardsRecord = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.ValidatorOutstandingRewardsRecord",
  );
  static const DistributionV1beta1Types distributionValidatorSlashEvent =
      DistributionV1beta1Types._(
        "/cosmos.distribution.v1beta1.ValidatorSlashEvent",
      );
  static const DistributionV1beta1Types distributionValidatorSlashEventRecord =
      DistributionV1beta1Types._(
        "/cosmos.distribution.v1beta1.ValidatorSlashEventRecord",
      );
  static const DistributionV1beta1Types distributionValidatorSlashEvents =
      DistributionV1beta1Types._(
        "/cosmos.distribution.v1beta1.ValidatorSlashEvents",
      );
  static const DistributionV1beta1Types
  distributionQueryValidatorOutstandingRewardsRequest = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.QueryValidatorOutstandingRewardsRequest",
    query: "/cosmos.distribution.v1beta1.Query/ValidatorOutstandingRewards",
    rpc:
        "/cosmos/distribution/v1beta1/validators/:validator_address/outstanding_rewards",
  );
  static const DistributionV1beta1Types
  distributionQueryValidatorOutstandingRewardsResponse =
      DistributionV1beta1Types._(
        "/cosmos.distribution.v1beta1.QueryValidatorOutstandingRewardsResponse",
      );
  static const DistributionV1beta1Types
  distributionValidatorAccumulatedCommission = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.ValidatorAccumulatedCommission",
  );
  static const DistributionV1beta1Types
  distributionValidatorAccumulatedCommissionRecord = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.ValidatorAccumulatedCommissionRecord",
  );
  static const DistributionV1beta1Types distributionValidatorCurrentRewards =
      DistributionV1beta1Types._(
        "/cosmos.distribution.v1beta1.ValidatorCurrentRewards",
      );
  static const DistributionV1beta1Types
  distributionValidatorCurrentRewardsRecord = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.ValidatorCurrentRewardsRecord",
  );
  static const DistributionV1beta1Types distributionValidatorHistoricalRewards =
      DistributionV1beta1Types._(
        "/cosmos.distribution.v1beta1.ValidatorHistoricalRewards",
      );
  static const DistributionV1beta1Types
  distributionValidatorHistoricalRewardsRecord = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.ValidatorHistoricalRewardsRecord",
  );
  static const DistributionV1beta1Types
  distributionQueryValidatorCommissionRequest = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.QueryValidatorCommissionRequest",
    query: "/cosmos.distribution.v1beta1.Query/ValidatorCommission",
    rpc:
        "/cosmos/distribution/v1beta1/validators/:validator_address/commission",
  );
  static const DistributionV1beta1Types
  distributionQueryValidatorCommissionResponse = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.QueryValidatorCommissionResponse",
  );
  static const DistributionV1beta1Types
  distributionQueryValidatorSlashesRequest = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.QueryValidatorSlashesRequest",
    query: "/cosmos.distribution.v1beta1.Query/ValidatorSlashes",
    rpc: "/cosmos/distribution/v1beta1/validators/:validator_address/slashes",
  );
  static const DistributionV1beta1Types
  distributionQueryValidatorSlashesResponse = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.QueryValidatorSlashesResponse",
  );
  static const DistributionV1beta1Types
  distributionQueryDelegationRewardsRequest = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.QueryDelegationRewardsRequest",
    query: "/cosmos.distribution.v1beta1.Query/DelegationRewards",
    rpc:
        "/cosmos/distribution/v1beta1/delegators/:delegator_address/rewards/:validator_address",
  );
  static const DistributionV1beta1Types
  distributionQueryDelegationRewardsResponse = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.QueryDelegationRewardsResponse",
  );
  static const DistributionV1beta1Types distributionDelegationDelegatorReward =
      DistributionV1beta1Types._(
        "/cosmos.distribution.v1beta1.DelegationDelegatorReward",
      );
  static const DistributionV1beta1Types distributionDelegatorStartingInfo =
      DistributionV1beta1Types._(
        "/cosmos.distribution.v1beta1.DelegatorStartingInfo",
      );
  static const DistributionV1beta1Types
  distributionQueryDelegationTotalRewardsRequest = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.QueryDelegationTotalRewardsRequest",
    query: "/cosmos.distribution.v1beta1.Query/DelegationTotalRewards",
    rpc: "/cosmos/distribution/v1beta1/delegators/:delegator_address/rewards",
  );
  static const DistributionV1beta1Types
  distributionQueryDelegationTotalRewardsResponse = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.QueryDelegationTotalRewardsResponse",
  );
  static const DistributionV1beta1Types
  distributionQueryDelegatorValidatorsRequest = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.QueryDelegatorValidatorsRequest",
    query: "/cosmos.distribution.v1beta1.Query/DelegatorValidators",
    rpc:
        "/cosmos/distribution/v1beta1/delegators/:delegator_address/validators",
  );
  static const DistributionV1beta1Types
  distributionQueryDelegatorValidatorsResponse = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.QueryDelegatorValidatorsResponse",
  );
  static const DistributionV1beta1Types
  distributionQueryDelegatorWithdrawAddressRequest = DistributionV1beta1Types._(
    "/cosmos.distribution.v1beta1.QueryDelegatorWithdrawAddressRequest",
    query: "/cosmos.distribution.v1beta1.Query/DelegatorWithdrawAddress",
    rpc:
        "/cosmos/distribution/v1beta1/delegators/:delegator_address/withdraw_address",
  );
  static const DistributionV1beta1Types
  distributionQueryDelegatorWithdrawAddressResponse =
      DistributionV1beta1Types._(
        "/cosmos.distribution.v1beta1.QueryDelegatorWithdrawAddressResponse",
      );

  static const List<TypeUrl> services = [
    distributionMsgDepositValidatorRewardsPool,
    distributionMsgSetWithdrawAddress,
    distributionMsgUpdateParams,
    distributionMsgWithdrawDelegatorReward,
    distributionMsgWithdrawValidatorCommission,
  ];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
