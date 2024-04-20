import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// EventGrant is emitted on Msg/Grant
///
// Since: cosmos-sdk 0.43
class AuthzEventGrant extends CosmosMessage {
  /// Msg type URL for which an authorization is granted
  final String? msgTypeUrl;

  /// Granter account address
  final CosmosBaseAddress? granter;

  /// Grantee account address
  final CosmosBaseAddress? grantee;
  const AuthzEventGrant({this.msgTypeUrl, this.granter, this.grantee});
  factory AuthzEventGrant.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzEventGrant(
        msgTypeUrl: decode.getField(2),
        granter: decode
            .getResult(3)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        grantee: decode
            .getResult(4)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)));
  }

  @override
  List<int> get fieldIds => [2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "msg_type_url": msgTypeUrl,
      "granter": granter?.address,
      "grantee": grantee?.address
    };
  }

  @override
  String get typeUrl => AuthzV1beta1Types.authzEventGrant.typeUrl;

  @override
  List get values => [msgTypeUrl, granter?.address, grantee?.address];
}
