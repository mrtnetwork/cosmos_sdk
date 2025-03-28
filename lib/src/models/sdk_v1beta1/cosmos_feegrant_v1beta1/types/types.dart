import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class FeegrantV1beta1Types extends TypeUrl {
  const FeegrantV1beta1Types._(super.typeUrl, {super.query, super.rpc});
  static const String root = "/cosmos.feegrant.v1beta1";
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
      FeegrantV1beta1Types._("/cosmos.feegrant.v1beta1.QueryAllowanceRequest",
          query: "/cosmos.feegrant.v1beta1.Query/Allowance",
          rpc: "/cosmos/feegrant/v1beta1/allowance/:granter/:grantee");
  static const FeegrantV1beta1Types queryAllowanceResponse =
      FeegrantV1beta1Types._("/cosmos.feegrant.v1beta1.QueryAllowanceResponse");
  static const FeegrantV1beta1Types queryAllowancesRequest =
      FeegrantV1beta1Types._("/cosmos.feegrant.v1beta1.QueryAllowancesRequest",
          query: "/cosmos.feegrant.v1beta1.Query/Allowances",
          rpc: "/cosmos/feegrant/v1beta1/allowances/:grantee");
  static const FeegrantV1beta1Types queryAllowancesResponse =
      FeegrantV1beta1Types._(
          "/cosmos.feegrant.v1beta1.QueryAllowancesResponse");
  static const FeegrantV1beta1Types queryAllowancesByGranterRequest =
      FeegrantV1beta1Types._(
          "/cosmos.feegrant.v1beta1.QueryAllowancesByGranterRequest",
          query: "/cosmos.feegrant.v1beta1.Query/AllowancesByGranter",
          rpc: "/cosmos/feegrant/v1beta1/issued/:granter");
  static const FeegrantV1beta1Types queryAllowancesByGranterResponse =
      FeegrantV1beta1Types._(
          "/cosmos.feegrant.v1beta1.QueryAllowancesByGranterResponse");

  static const List<TypeUrl> services = [
    msgGrantAllowance,
    msgPruneAllowances,
    msgRevokeAllowance
  ];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
