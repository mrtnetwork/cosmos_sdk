import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';

/// QueryAccountAddressByIDResponse is the response type for AccountAddressByID rpc method
/// Since: cosmos-sdk 0.46.2
class QueryAccountAddressByIDResponse extends CosmosMessage {
  final BaseAddress accountAddress;

  const QueryAccountAddressByIDResponse(this.accountAddress);
  factory QueryAccountAddressByIDResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAccountAddressByIDResponse(BaseAddress(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"account_address": accountAddress.address};
  }

  @override
  List get values => [accountAddress.address];

  @override
  String get typeUrl => AuthV1beta1Types.accountAddressByIDResponse.typeUrl;
}
