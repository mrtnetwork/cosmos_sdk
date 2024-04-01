import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/auth_v1beta1_types.dart';

/// AddressBytesToStringResponse is the response type for AddressString rpc method.
/// Since: cosmos-sdk 0.46
class AddressBytesToStringResponse extends CosmosMessage {
  final String addressString;
  AddressBytesToStringResponse(this.addressString);
  factory AddressBytesToStringResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AddressBytesToStringResponse(decode.getField(1));
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
  String get typeUrl => AuthV1beta1Types.addressBytesToStringResponse.typeUrl;
}
