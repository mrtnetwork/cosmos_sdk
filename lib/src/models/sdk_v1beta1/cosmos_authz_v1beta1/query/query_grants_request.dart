import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/query/query_grants_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryGrantsRequest is the request type for the Query/Grants RPC method.
class AuthzQueryGrantsRequest extends CosmosMessage
    with QueryMessage<AuthzQueryGrantsResponse> {
  final BaseAddress? granter;
  final BaseAddress? grantee;

  /// Optional, msg_type_url, when set, will query only grants matching given msg type.
  final String? msgTypeUrl;

  /// pagination defines an pagination for the request.
  final PageRequest? pagination;
  const AuthzQueryGrantsRequest(
      {this.granter, this.grantee, this.msgTypeUrl, this.pagination});
  factory AuthzQueryGrantsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzQueryGrantsRequest(
        granter:
            decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        grantee:
            decode.getResult(2)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        msgTypeUrl: decode.getField(3),
        pagination: decode
            .getResult(4)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  String get queryPath => AuthzV1beta1Types.authzGrants.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "granter": granter?.address,
      "grantee": grantee?.address,
      "msg_type_url": msgTypeUrl,
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl => AuthzV1beta1Types.authzQueryGrantsRequest.typeUrl;

  @override
  List get values =>
      [granter?.address, grantee?.address, msgTypeUrl, pagination];

  @override
  AuthzQueryGrantsResponse onResponse(List<int> bytes) {
    return AuthzQueryGrantsResponse.deserialize(bytes);
  }
}
