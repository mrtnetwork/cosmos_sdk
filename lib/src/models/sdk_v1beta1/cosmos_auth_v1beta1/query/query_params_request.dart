import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/query/query_params_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';

/// QueryParamsRequest is the request type for the Query/Params RPC method.
class AuthQueryParamsRequest extends CosmosMessage
    with QueryMessage<AuthQueryParamsResponse> {
  /// This message has no fields.
  const AuthQueryParamsRequest();
  factory AuthQueryParamsRequest.deserialize(List<int> bytes) {
    return const AuthQueryParamsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  List get values => [];

  @override
  TypeUrl get typeUrl => AuthV1beta1Types.authParamsRequest;

  @override
  AuthQueryParamsResponse onResponse(List<int> bytes) {
    return AuthQueryParamsResponse.deserialize(bytes);
  }

  @override
  AuthQueryParamsResponse onJsonResponse(Map<String, dynamic> json) {
    return AuthQueryParamsResponse.fromRpc(json);
  }
}
