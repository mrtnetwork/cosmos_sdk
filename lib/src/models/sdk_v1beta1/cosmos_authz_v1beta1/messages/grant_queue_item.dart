import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GrantQueueItem contains the list of TypeURL of a sdk.Msg.
class AuthGrantQueueItem extends CosmosMessage {
  /// msg_type_urls contains the list of TypeURL of a sdk.Msg.
  final List<String> msgTypeUrls;
  const AuthGrantQueueItem(this.msgTypeUrls);

  factory AuthGrantQueueItem.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthGrantQueueItem(decode.getFileds(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"msg_type_urls": msgTypeUrls};
  }

  @override
  String get typeUrl => AuthzV1beta1Types.authzGrantQueueItem.typeUrl;

  @override
  List get values => [msgTypeUrls];
}
