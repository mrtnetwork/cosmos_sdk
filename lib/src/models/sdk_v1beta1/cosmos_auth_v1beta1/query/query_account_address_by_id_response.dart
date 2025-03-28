import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';

/// QueryAccountAddressByIDResponse is the response type for AccountAddressByID rpc method
/// Since: cosmos-sdk 0.46.2
class QueryAccountAddressByIDResponse extends CosmosMessage {
  final CosmosBaseAddress accountAddress;

  const QueryAccountAddressByIDResponse(this.accountAddress);
  factory QueryAccountAddressByIDResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAccountAddressByIDResponse(
        CosmosBaseAddress(decode.getField(1)));
  }
  factory QueryAccountAddressByIDResponse.fromJson(Map<String, dynamic> json) {
    return QueryAccountAddressByIDResponse(
        CosmosBaseAddress.fromBytes(json["account_address"]));
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
  TypeUrl get typeUrl => AuthV1beta1Types.accountAddressByIDResponse;
}
