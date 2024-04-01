import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// EventRevoke is emitted on Msg/Revoke
class AuthzEventRevoke extends CosmosMessage {
  /// Msg type URL for which an authorization is revoked
  final String? msgTypeUrl;

  /// Granter account address
  final BaseAddress? granter;

  /// Grantee account address
  final BaseAddress? grantee;
  const AuthzEventRevoke({
    this.msgTypeUrl,
    this.granter,
    this.grantee,
  });
  factory AuthzEventRevoke.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzEventRevoke(
      msgTypeUrl: decode.getField(2),
      granter:
          decode.getResult(3)?.to<BaseAddress, String>((e) => BaseAddress(e)),
      grantee:
          decode.getResult(4)?.to<BaseAddress, String>((e) => BaseAddress(e)),
    );
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
  String get typeUrl => AuthzV1beta1Types.authzEventRevoke.typeUrl;

  @override
  List get values => [msgTypeUrl, granter, grantee];
}
