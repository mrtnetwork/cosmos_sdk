import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// EventPruneExpiredGrants is emitted on Msg/PruneExpiredGrants
///
/// Since: x/authz 1.0.0
class AuthzEventPruneExpiredGrants extends CosmosMessage {
  /// Address of the pruner
  final CosmosBaseAddress? pruner;
  const AuthzEventPruneExpiredGrants({this.pruner});
  factory AuthzEventPruneExpiredGrants.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzEventPruneExpiredGrants(
        pruner: decode
            .getResult(2)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)));
  }

  @override
  List<int> get fieldIds => [2];

  @override
  Map<String, dynamic> toJson() {
    return {"pruner": pruner?.address};
  }

  @override
  String get typeUrl => AuthzV1beta1Types.authzEventPruneExpiredGrants.typeUrl;

  @override
  List get values => [pruner];
}
