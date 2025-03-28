import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'address_string_to_bytes_response.dart';

/// AddressStringToBytesRequest is the request type for AccountBytes rpc method..
/// Since: cosmos-sdk 0.46
class AddressStringToBytesRequest extends CosmosMessage
    with QueryMessage<AddressStringToBytesResponse> {
  final String addressString;
  AddressStringToBytesRequest(this.addressString);
  factory AddressStringToBytesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AddressStringToBytesRequest(decode.getField(1));
  }

  factory AddressStringToBytesRequest.fromJson(Map<String, dynamic> json) {
    return AddressStringToBytesRequest(json["address_string"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"address_string": addressString};
  }

  @override
  List get values => [addressString];

  @override
  TypeUrl get typeUrl => AuthV1beta1Types.addressStringToBytesRequest;

  @override
  AddressStringToBytesResponse onResponse(List<int> bytes) {
    return AddressStringToBytesResponse.deserialize(bytes);
  }

  @override
  AddressStringToBytesResponse onJsonResponse(Map<String, dynamic> json) {
    return AddressStringToBytesResponse.fromJson(json);
  }
}
