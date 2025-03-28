import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class AuthzV1beta1Types extends TypeUrl {
  const AuthzV1beta1Types._(super.typeUrl, {super.query, super.rpc});
  static const String root = "/cosmos.authz.v1beta1";

  /// messages
  static const AuthzV1beta1Types authzGrant =
      AuthzV1beta1Types._("/cosmos.authz.v1beta1.Grant");
  static const AuthzV1beta1Types authzGrantAuthorization =
      AuthzV1beta1Types._("/cosmos.authz.v1beta1.GrantAuthorization");
  static const AuthzV1beta1Types authzGrantQueueItem =
      AuthzV1beta1Types._("/cosmos.authz.v1beta1.GrantQueueItem");
  static const AuthzV1beta1Types authzMsgGrant =
      AuthzV1beta1Types._("/cosmos.authz.v1beta1.MsgGrant");
  static const AuthzV1beta1Types authzMsgGrantResponse =
      AuthzV1beta1Types._("/cosmos.authz.v1beta1.MsgGrantResponse");
  static const AuthzV1beta1Types authzMsgExec =
      AuthzV1beta1Types._("/cosmos.authz.v1beta1.MsgExec");
  static const AuthzV1beta1Types authzMsgExecResponse =
      AuthzV1beta1Types._("/cosmos.authz.v1beta1.MsgExecResponse");
  static const AuthzV1beta1Types authzMsgRevoke =
      AuthzV1beta1Types._("/cosmos.authz.v1beta1.MsgRevoke");
  static const AuthzV1beta1Types authzMsgRevokeResponse =
      AuthzV1beta1Types._("/cosmos.authz.v1beta1.MsgRevokeResponse");
  static const AuthzV1beta1Types authzMsgPruneExpiredGrants =
      AuthzV1beta1Types._("/cosmos.authz.v1beta1.MsgPruneExpiredGrants");
  static const AuthzV1beta1Types authzMsgPruneExpiredGrantsResponse =
      AuthzV1beta1Types._(
          "/cosmos.authz.v1beta1.MsgPruneExpiredGrantsResponse");
  static const AuthzV1beta1Types authzQueryGrantsRequest = AuthzV1beta1Types._(
      "/cosmos.authz.v1beta1.QueryGrantsRequest",
      query: "/cosmos.authz.v1beta1.Query/Grants",
      rpc: "/cosmos/authz/v1beta1/grants");
  static const AuthzV1beta1Types authzQueryGrantsResponse =
      AuthzV1beta1Types._("/cosmos.authz.v1beta1.QueryGrantsResponse");
  static const AuthzV1beta1Types authzQueryGranterGrantsRequest =
      AuthzV1beta1Types._("/cosmos.authz.v1beta1.QueryGranterGrantsRequest",
          query: "/cosmos.authz.v1beta1.Query/GranterGrants",
          rpc: "/cosmos/authz/v1beta1/grants/granter/:granter");
  static const AuthzV1beta1Types authzQueryGranterGrantsResponse =
      AuthzV1beta1Types._("/cosmos.authz.v1beta1.QueryGranterGrantsResponse");
  static const AuthzV1beta1Types authzQueryGranteeGrantsRequest =
      AuthzV1beta1Types._("/cosmos.authz.v1beta1.QueryGranteeGrantsRequest",
          query: "/cosmos.authz.v1beta1.Query/GranteeGrants",
          rpc: "/cosmos/authz/v1beta1/grants/grantee/:grantee");
  static const AuthzV1beta1Types authzQueryGranteeGrantsResponse =
      AuthzV1beta1Types._("/cosmos.authz.v1beta1.QueryGranteeGrantsResponse");
  static const AuthzV1beta1Types authzGenericAuthorization =
      AuthzV1beta1Types._("/cosmos.authz.v1beta1.GenericAuthorization");
  static const AuthzV1beta1Types authzEventRevoke =
      AuthzV1beta1Types._("/cosmos.authz.v1beta1.EventRevoke");
  static const AuthzV1beta1Types authzGenesisState =
      AuthzV1beta1Types._("/cosmos.authz.v1beta1.GenesisState");
  static const AuthzV1beta1Types authzEventGrant =
      AuthzV1beta1Types._("/cosmos.authz.v1beta1.EventGrant");
  static const AuthzV1beta1Types authzEventPruneExpiredGrants =
      AuthzV1beta1Types._("/cosmos.authz.v1beta1.EventPruneExpiredGrants");

  static const List<TypeUrl> services = [
    authzMsgExec,
    authzMsgGrant,
    authzMsgPruneExpiredGrants,
    authzMsgRevoke
  ];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
