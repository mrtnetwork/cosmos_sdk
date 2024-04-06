import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/binary/utils.dart';

import 'address_bytes_to_string_response.dart';

/// AddressBytesToStringRequest is the request type for AddressString rpc method.
/// Since: cosmos-sdk 0.46
class AddressBytesToStringRequest extends CosmosMessage
    with QueryMessage<AddressBytesToStringResponse> {
  final List<int> addressBytes;
  AddressBytesToStringRequest(List<int> addressBytes)
      : addressBytes = BytesUtils.toBytes(addressBytes, unmodifiable: true);
  factory AddressBytesToStringRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AddressBytesToStringRequest(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath => AuthV1beta1Types.addressBytesToString.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"address_bytes": BytesUtils.toHexString(addressBytes)};
  }

  @override
  List get values => [addressBytes];

  @override
  String get typeUrl => AuthV1beta1Types.addressBytesToStringRequest.typeUrl;

  @override
  AddressBytesToStringResponse onResponse(List<int> bytes) {
    return AddressBytesToStringResponse.deserialize(bytes);
  }
}
