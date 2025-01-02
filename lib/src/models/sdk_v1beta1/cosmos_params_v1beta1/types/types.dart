import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class ParamsV1beta1 extends TypeUrl {
  const ParamsV1beta1._(super.typeUrl, {super.query, super.rpc});

  static const ParamsV1beta1 paramsSubspace =
      ParamsV1beta1._("/cosmos.params.v1beta1.Subspace");
  static const ParamsV1beta1 paramChange =
      ParamsV1beta1._("/cosmos.params.v1beta1.ParamChange");
  static const ParamsV1beta1 parameterChangeProposal =
      ParamsV1beta1._("/cosmos.params.v1beta1.ParameterChangeProposal");
  static const ParamsV1beta1 paramsQueryParamsRequest = ParamsV1beta1._(
      "/cosmos.params.v1beta1.QueryParamsRequest",
      query: "/cosmos.params.v1beta1.Query/Params",
      rpc: "/cosmos/params/v1beta1/params");
  static const ParamsV1beta1 paramsQueryParamsResponse =
      ParamsV1beta1._("/cosmos.params.v1beta1.QueryParamsResponse");
  static const ParamsV1beta1 paramsQuerySubspacesRequest = ParamsV1beta1._(
      "/cosmos.params.v1beta1.QuerySubspacesRequest",
      query: "/cosmos.params.v1beta1.Query/Subspaces",
      rpc: "/cosmos/params/v1beta1/subspaces");
  static const ParamsV1beta1 paramsQuerySubspacesResponse =
      ParamsV1beta1._("/cosmos.params.v1beta1.QuerySubspacesResponse");
}
