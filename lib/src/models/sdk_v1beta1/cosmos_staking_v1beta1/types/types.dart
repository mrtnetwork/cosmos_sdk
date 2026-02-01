import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class StakingV1beta1Types extends TypeUrl {
  const StakingV1beta1Types._(
    super.typeUrl, {
    super.query,
    super.rpc,
    super.aminoType,
  });
  static const String root = "/cosmos.staking.v1beta1";
  static const StakingV1beta1Types validator = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.Validator",
  );
  static const StakingV1beta1Types unbondingDelegation = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.UnbondingDelegation",
  );
  static const StakingV1beta1Types commissionRates = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.CommissionRates",
  );
  static const StakingV1beta1Types delegation = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.Delegation",
  );
  static const StakingV1beta1Types delegationResponse = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.DelegationResponse",
  );
  static const StakingV1beta1Types description = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.Description",
  );
  static const StakingV1beta1Types dVPair = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.DVPair",
  );
  static const StakingV1beta1Types dVPairs = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.DVPairs",
  );
  static const StakingV1beta1Types dVVTriplet = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.DVVTriplet",
  );
  static const StakingV1beta1Types dVVTriplets = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.DVVTriplets",
  );
  static const StakingV1beta1Types lastValidatorPower = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.LastValidatorPower",
  );
  static const StakingV1beta1Types msgBeginRedelegate = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.MsgBeginRedelegate",
    aminoType: "cosmos-sdk/MsgBeginRedelegate",
  );
  static const StakingV1beta1Types msgBeginRedelegateResponse =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.MsgBeginRedelegateResponse",
      );
  static const StakingV1beta1Types msgEnableTokenizeSharesResponse =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.MsgEnableTokenizeSharesResponse",
      );
  static const StakingV1beta1Types msgTokenizeSharesResponse =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.MsgTokenizeSharesResponse",
      );

  static const StakingV1beta1Types msgRedeemTokensForSharesResponse =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.MsgRedeemTokensForSharesResponse",
      );
  static const StakingV1beta1Types msgTokenizeShares = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.MsgTokenizeShares",
  );
  static const StakingV1beta1Types msgDisableTokenizeShares =
      StakingV1beta1Types._("/cosmos.staking.v1beta1.MsgDisableTokenizeShares");
  static const StakingV1beta1Types msgEnableTokenizeShares =
      StakingV1beta1Types._("/cosmos.staking.v1beta1.MsgEnableTokenizeShares");
  static const StakingV1beta1Types msgDisableTokenizeSharesResponse =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.MsgDisableTokenizeSharesResponse",
      );
  static const StakingV1beta1Types msgRedeemTokensForShares =
      StakingV1beta1Types._("/cosmos.staking.v1beta1.MsgRedeemTokensForShares");
  static const StakingV1beta1Types msgTransferTokenizeShareRecord =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.MsgTransferTokenizeShareRecord",
      );
  static const StakingV1beta1Types msgTransferTokenizeShareRecordResponse =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.MsgTransferTokenizeShareRecordResponse",
      );
  static const StakingV1beta1Types msgCancelUnbondingDelegation =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.MsgCancelUnbondingDelegation",
      );
  static const StakingV1beta1Types msgCancelUnbondingDelegationResponse =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.MsgCancelUnbondingDelegationResponse",
      );
  static const StakingV1beta1Types msgCreateValidator = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.MsgCreateValidator",
    aminoType: "cosmos-sdk/MsgCreateValidator",
  );
  static const StakingV1beta1Types msgCreateValidatorResponse =
      StakingV1beta1Types._("/cosmos.staking.v1beta1.MsgCreateValidator");
  static const StakingV1beta1Types msgDelegate = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.MsgDelegate",
    aminoType: "cosmos-sdk/MsgDelegate",
  );
  static const StakingV1beta1Types msgDelegateResponse = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.MsgDelegateResponse",
  );
  static const StakingV1beta1Types msgEditValidator = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.MsgEditValidator",
    aminoType: "cosmos-sdk/MsgEditValidator",
  );
  static const StakingV1beta1Types msgEditValidatorResponse =
      StakingV1beta1Types._("/cosmos.staking.v1beta1.MsgEditValidatorResponse");
  static const StakingV1beta1Types msgUndelegate = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.MsgUndelegate",
    aminoType: "cosmos-sdk/MsgUndelegate",
  );
  static const StakingV1beta1Types msgUndelegateResponse =
      StakingV1beta1Types._("/cosmos.staking.v1beta1.MsgUndelegateResponse");
  static const StakingV1beta1Types pool = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.Pool",
  );
  static const StakingV1beta1Types redelegationEntry = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.RedelegationEntry",
  );
  static const StakingV1beta1Types redelegation = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.Redelegation",
  );
  static const StakingV1beta1Types stakingParams = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.Params",
  );
  static const StakingV1beta1Types commission = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.Commission",
  );
  static const StakingV1beta1Types consPubKeyRotationHistory =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.ConsPubKeyRotationHistory",
      );

  static const StakingV1beta1Types unbondingDelegationEntry =
      StakingV1beta1Types._("/cosmos.staking.v1beta1.UnbondingDelegationEntry");
  static const StakingV1beta1Types stakingMsgUpdateParams =
      StakingV1beta1Types._("/cosmos.staking.v1beta1.MsgUpdateParams");
  static const StakingV1beta1Types stakingMsgUpdateParamsResponse =
      StakingV1beta1Types._("/cosmos.staking.v1beta1.MsgUpdateParamsResponse");
  static const StakingV1beta1Types msgRotateConsPubKey = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.MsgRotateConsPubKey",
  );
  static const StakingV1beta1Types msgRotateConsPubKeyResponse =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.MsgRotateConsPubKeyResponse",
      );
  static const StakingV1beta1Types queryValidatorsRequest =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.QueryValidatorsRequest",
        query: "/cosmos.staking.v1beta1.Query/Validators",
        rpc: "/cosmos/staking/v1beta1/validators",
      );
  static const StakingV1beta1Types queryValidatorsResponse =
      StakingV1beta1Types._("/cosmos.staking.v1beta1.QueryValidatorsResponse");
  static const StakingV1beta1Types queryValidatorRequest =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.QueryValidatorRequest",
        query: "/cosmos.staking.v1beta1.Query/Validator",
        rpc: "/cosmos/staking/v1beta1/validators/:validator_addr",
      );
  static const StakingV1beta1Types queryValidatorResponse =
      StakingV1beta1Types._("/cosmos.staking.v1beta1.QueryValidatorResponse");
  static const StakingV1beta1Types queryValidatorDelegationsRequest =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.QueryValidatorDelegationsRequest",
        query: "/cosmos.staking.v1beta1.Query/ValidatorDelegations",
        rpc: "/cosmos/staking/v1beta1/validators/:validator_addr/delegations",
      );
  static const StakingV1beta1Types queryValidatorDelegationsResponse =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.QueryValidatorDelegationsResponse",
      );
  static const StakingV1beta1Types
  queryValidatorUnbondingDelegationsRequest = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.QueryValidatorUnbondingDelegationsRequest",
    query: "/cosmos.staking.v1beta1.Query/ValidatorUnbondingDelegations",
    rpc:
        "/cosmos/staking/v1beta1/validators/:validator_addr/unbonding_delegations",
  );
  static const StakingV1beta1Types queryValidatorUnbondingDelegationsResponse =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.QueryValidatorUnbondingDelegationsResponse",
      );
  static const StakingV1beta1Types
  queryDelegationRequest = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.QueryDelegationRequest",
    query: "/cosmos.staking.v1beta1.Query/Delegation",
    rpc:
        "/cosmos/staking/v1beta1/validators/:validator_addr/delegations/:delegator_addr",
  );
  static const StakingV1beta1Types queryDelegationResponse =
      StakingV1beta1Types._("/cosmos.staking.v1beta1.QueryDelegationResponse");
  static const StakingV1beta1Types
  queryUnbondingDelegationRequest = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.QueryUnbondingDelegationRequest",
    query: "/cosmos.staking.v1beta1.Query/UnbondingDelegation",
    rpc:
        "/cosmos/staking/v1beta1/validators/:validator_addr/delegations/:delegator_addr/unbonding_delegation",
  );
  static const StakingV1beta1Types queryUnbondingDelegationResponse =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.QueryUnbondingDelegationResponse",
      );
  static const StakingV1beta1Types queryDelegatorDelegationsRequest =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.QueryDelegatorDelegationsRequest",
        query: "/cosmos.staking.v1beta1.Query/DelegatorDelegations",
        rpc: "/cosmos/staking/v1beta1/delegations/:delegator_addr",
      );
  static const StakingV1beta1Types queryDelegatorDelegationsResponse =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.QueryDelegatorDelegationsResponse",
      );
  static const StakingV1beta1Types
  queryDelegatorUnbondingDelegationsRequest = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.QueryDelegatorUnbondingDelegationsRequest",
    query: "/cosmos.staking.v1beta1.Query/DelegatorUnbondingDelegations",
    rpc:
        "/cosmos/staking/v1beta1/delegators/:delegator_addr/unbonding_delegations",
  );
  static const StakingV1beta1Types queryDelegatorUnbondingDelegationsResponse =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.QueryDelegatorUnbondingDelegationsResponse",
      );
  static const StakingV1beta1Types redelegationEntryResponse =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.RedelegationEntryResponse",
      );
  static const StakingV1beta1Types redelegationResponse = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.RedelegationResponse",
  );
  static const StakingV1beta1Types queryRedelegationsRequest =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.QueryRedelegationsRequest",
        query: "/cosmos.staking.v1beta1.Query/Redelegations",
        rpc: "/cosmos/staking/v1beta1/delegators/:delegator_addr/redelegations",
      );
  static const StakingV1beta1Types queryRedelegationsResponse =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.QueryRedelegationsResponse",
      );
  static const StakingV1beta1Types queryDelegatorValidatorsRequest =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.QueryDelegatorValidatorsRequest",
        query: "/cosmos.staking.v1beta1.Query/DelegatorValidators",
        rpc: "/cosmos/staking/v1beta1/delegators/:delegator_addr/validators",
      );
  static const StakingV1beta1Types queryDelegatorValidatorsResponse =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.QueryDelegatorValidatorsResponse",
      );
  static const StakingV1beta1Types
  queryDelegatorValidatorRequest = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.QueryDelegatorValidatorRequest",
    query: "/cosmos.staking.v1beta1.Query/DelegatorValidator",
    rpc:
        "/cosmos/staking/v1beta1/delegators/:delegator_addr/validators/:validator_addr",
  );
  static const StakingV1beta1Types queryDelegatorValidatorResponse =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.QueryDelegatorValidatorResponse",
      );

  static const StakingV1beta1Types stakingGenesisState = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.GenesisState",
  );
  static const StakingV1beta1Types historicalRecord = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.HistoricalRecord",
  );

  /// queries

  static const StakingV1beta1Types queryValidator = StakingV1beta1Types._(
    "/cosmos.staking.v1beta1.Query/Validator",
  );

  static const StakingV1beta1Types queryUnbondingDelegation =
      StakingV1beta1Types._(
        "/cosmos.staking.v1beta1.Query/UnbondingDelegation",
      );

  static const List<TypeUrl> services = [
    msgBeginRedelegate,
    msgCancelUnbondingDelegation,
    msgCreateValidator,
    msgDelegate,
    msgEditValidator,
    msgRotateConsPubKey,
    msgUndelegate,
    stakingMsgUpdateParams,
    msgDisableTokenizeShares,
    msgEnableTokenizeShares,
    msgRedeemTokensForShares,
    msgTokenizeShares,
    msgTransferTokenizeShareRecord,
  ];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
