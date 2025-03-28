import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/messages/auth_params.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';

/// QueryParamsResponse is the response type for the Query/Params RPC method.
class AuthQueryParamsResponse extends CosmosMessage {
  /// params defines the parameters of the module.
  final AuthParams params;

  const AuthQueryParamsResponse(this.params);
  factory AuthQueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthQueryParamsResponse(AuthParams.deserialize(decode.getField(1)));
  }

  factory AuthQueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return AuthQueryParamsResponse(AuthParams.fromJson(json["params"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params.toJson()};
  }

  @override
  List get values => [params];

  @override
  TypeUrl get typeUrl => AuthV1beta1Types.authParamsResponse;
}
