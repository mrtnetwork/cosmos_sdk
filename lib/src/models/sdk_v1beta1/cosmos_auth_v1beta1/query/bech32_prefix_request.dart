import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/query/bech32_prefix_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';

/// Bech32PrefixRequest is the request type for Bech32Prefix rpc method.
/// Since: cosmos-sdk 0.46
class Bech32PrefixRequest extends CosmosMessage
    with QueryMessage<Bech32PrefixResponse> {
  ///  This message has no fields.
  const Bech32PrefixRequest();
  factory Bech32PrefixRequest.deserialize(List<int> bytes) {
    return const Bech32PrefixRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  String get queryPath => AuthV1beta1Types.bech32Prefix.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  List get values => [];

  @override
  String get typeUrl => AuthV1beta1Types.bech32PrefixRequest.typeUrl;

  @override
  Bech32PrefixResponse onResponse(List<int> bytes) {
    return Bech32PrefixResponse.deserialize(bytes);
  }
}
