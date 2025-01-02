import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';

/// Bech32PrefixResponse is the response type for Bech32Prefix rpc method.
/// Since: cosmos-sdk 0.46
class Bech32PrefixResponse extends CosmosMessage {
  final String bech32Prefix;
  Bech32PrefixResponse(this.bech32Prefix);
  factory Bech32PrefixResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Bech32PrefixResponse(decode.getField(1));
  }
  factory Bech32PrefixResponse.fromRpc(Map<String, dynamic> json) {
    return Bech32PrefixResponse(json["bech32_prefix"]);
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"bech32_prefix": bech32Prefix};
  }

  @override
  List get values => [bech32Prefix];

  @override
  TypeUrl get typeUrl => AuthV1beta1Types.bech32PrefixResponse;
}
