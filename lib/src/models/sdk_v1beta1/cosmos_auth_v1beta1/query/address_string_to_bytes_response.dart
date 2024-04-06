import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';
import 'package:blockchain_utils/binary/utils.dart';

/// AddressStringToBytesResponse is the response type for AddressBytes rpc method.
/// Since: cosmos-sdk 0.46
class AddressStringToBytesResponse extends CosmosMessage {
  final List<int> addressBytes;
  AddressStringToBytesResponse(List<int> addressBytes)
      : addressBytes = BytesUtils.toBytes(addressBytes, unmodifiable: true);
  factory AddressStringToBytesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AddressStringToBytesResponse(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"address_bytes": BytesUtils.toHexString(addressBytes)};
  }

  @override
  List get values => [addressBytes];

  @override
  String get typeUrl => AuthV1beta1Types.addressStringToBytesResponse.typeUrl;
}
