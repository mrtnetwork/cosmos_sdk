import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/messages/base_account.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';

/// QueryAccountInfoResponse is the Query/AccountInfo response type.
/// Since: cosmos-sdk 0.47
class QueryAccountInfoResponse extends CosmosMessage {
  /// address is the account address.
  final BaseAccount info;
  const QueryAccountInfoResponse(this.info);
  factory QueryAccountInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAccountInfoResponse(
      BaseAccount.deserialize(decode.getField(1)),
    );
  }
  factory QueryAccountInfoResponse.fromJson(Map<String, dynamic> json) {
    return QueryAccountInfoResponse(BaseAccount.fromJson(json["info"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"info": info.toJson()};
  }

  @override
  List get values => [info];

  @override
  TypeUrl get typeUrl => AuthV1beta1Types.accountInfoResponse;
}
