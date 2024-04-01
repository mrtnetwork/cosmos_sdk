import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/query/query_grantee_grants_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryGranteeGrantsRequest is the request type for the Query/GranteeGrants RPC method.
class AuthzQueryGranteeGrantsRequest extends CosmosMessage
    with QueryMessage<AuthzQueryGranteeGrantsResponse> {
  final BaseAddress? grantee;

  /// pagination defines an pagination for the request.
  final PageRequest? pagination;
  const AuthzQueryGranteeGrantsRequest({this.grantee, this.pagination});
  factory AuthzQueryGranteeGrantsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzQueryGranteeGrantsRequest(
        grantee:
            decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        pagination: decode
            .getResult(2)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get queryPath => AuthzV1beta1Types.authzGranteeGrants.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"grantee": grantee?.address, "pagination": pagination?.toJson()};
  }

  @override
  String get typeUrl =>
      AuthzV1beta1Types.authzQueryGranteeGrantsRequest.typeUrl;

  @override
  List get values => [grantee?.address, pagination];

  @override
  AuthzQueryGranteeGrantsResponse onResponse(List<int> bytes) {
    return AuthzQueryGranteeGrantsResponse.deserialize(bytes);
  }
}
