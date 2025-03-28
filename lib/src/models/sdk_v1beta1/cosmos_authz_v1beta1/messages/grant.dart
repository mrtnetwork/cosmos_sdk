import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// Grant gives permissions to execute the provide method with expiration time.
class AuthzGrant extends CosmosMessage {
  final AnyMessage? authorization;

  /// time when the grant will expire and will be pruned. If null, then the grant
  /// doesn't have a time expiration (other conditions  in `authorization`
  /// may apply to invalidate the grant)
  final ProtobufTimestamp? expiration;
  const AuthzGrant({this.authorization, required this.expiration});
  factory AuthzGrant.fromJson(Map<String, dynamic> json) {
    return AuthzGrant(
      authorization: json.maybeAs<AnyMessage, Map<String, dynamic>>(
          key: "authorization", onValue: (e) => AnyMessage.fromJson(e)),
      expiration: json.maybeAs<ProtobufTimestamp, String>(
          key: "expiration", onValue: (e) => ProtobufTimestamp.fromString(e)),
    );
  }
  factory AuthzGrant.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzGrant(
      authorization: decode
          .getResult(1)
          ?.to<AnyMessage, List<int>>((e) => AnyMessage.deserialize(e)),
      expiration: decode.getResult(2)?.to<ProtobufTimestamp, List<int>>(
          (e) => ProtobufTimestamp.deserialize(e)),
    );
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "authorization": authorization?.toJson(),
      "expiration": expiration?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => AuthzV1beta1Types.authzGrant;

  @override
  List get values => [authorization, expiration];
}
