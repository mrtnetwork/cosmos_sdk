import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisTxfeesV1beta1Types extends TypeUrl {
  const OsmosisTxfeesV1beta1Types._(super.typeUrl, {super.query, super.rpc});
  static const OsmosisTxfeesV1beta1Types updateFeeTokenProposal =
      OsmosisTxfeesV1beta1Types._(
          "/osmosis.txfees.v1beta1.UpdateFeeTokenProposal");
  static const OsmosisTxfeesV1beta1Types txFeesTracker =
      OsmosisTxfeesV1beta1Types._("/osmosis.txfees.v1beta1.TxFeesTracker");
  static const OsmosisTxfeesV1beta1Types feeToken =
      OsmosisTxfeesV1beta1Types._("/osmosis.txfees.v1beta1.FeeToken");
  static const OsmosisTxfeesV1beta1Types genesisState =
      OsmosisTxfeesV1beta1Types._("/osmosis.txfees.v1beta1.GenesisState");

  static const OsmosisTxfeesV1beta1Types queryFeeTokensRequest =
      OsmosisTxfeesV1beta1Types._(
          "/osmosis.txfees.v1beta1.QueryFeeTokensRequest",
          query: "/osmosis.txfees.v1beta1.Query/FeeTokens",
          rpc: "/osmosis/txfees/v1beta1/fee_tokens");
  static const OsmosisTxfeesV1beta1Types queryFeeTokensResponse =
      OsmosisTxfeesV1beta1Types._(
          "/osmosis.txfees.v1beta1.QueryFeeTokensResponse");

  static const OsmosisTxfeesV1beta1Types queryDenomSpotPriceRequest =
      OsmosisTxfeesV1beta1Types._(
          "/osmosis.txfees.v1beta1.QueryDenomSpotPriceRequest",
          query: "/osmosis.txfees.v1beta1.Query/DenomSpotPrice",
          rpc: "/osmosis/txfees/v1beta1/spot_price_by_denom");
  static const OsmosisTxfeesV1beta1Types queryDenomSpotPriceResponse =
      OsmosisTxfeesV1beta1Types._(
          "/osmosis.txfees.v1beta1.QueryDenomSpotPriceResponse");

  static const OsmosisTxfeesV1beta1Types queryDenomPoolIdRequest =
      OsmosisTxfeesV1beta1Types._(
          "/osmosis.txfees.v1beta1.QueryDenomPoolIdRequest",
          query: "/osmosis.txfees.v1beta1.Query/DenomPoolId",
          rpc: "/osmosis/txfees/v1beta1/denom_pool_id/:denom");
  static const OsmosisTxfeesV1beta1Types queryDenomPoolIdResponse =
      OsmosisTxfeesV1beta1Types._(
          "/osmosis.txfees.v1beta1.QueryDenomPoolIdResponse");

  static const OsmosisTxfeesV1beta1Types queryBaseDenomRequest =
      OsmosisTxfeesV1beta1Types._(
          "/osmosis.txfees.v1beta1.QueryBaseDenomRequest",
          query: "/osmosis.txfees.v1beta1.Query/BaseDenom",
          rpc: "/osmosis/txfees/v1beta1/base_denom");
  static const OsmosisTxfeesV1beta1Types queryBaseDenomResponse =
      OsmosisTxfeesV1beta1Types._(
          "/osmosis.txfees.v1beta1.QueryBaseDenomResponse");
}
