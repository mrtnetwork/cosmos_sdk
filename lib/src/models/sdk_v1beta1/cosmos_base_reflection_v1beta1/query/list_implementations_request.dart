import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_reflection_v1beta1/query/list_implementations_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_reflection_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ListImplementationsRequest is the request type of the ListImplementations RPC.
class ListImplementationsRequest extends CosmosMessage
    with QueryMessage<ListImplementationsResponse> {
  /// interface_name defines the interface to query the implementations for.
  final String? interfaceName;

  const ListImplementationsRequest({this.interfaceName});
  factory ListImplementationsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ListImplementationsRequest(interfaceName: decode.getField(1));
  }
  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {"interface_name": interfaceName};
  }

  @override
  String get typeUrl =>
      BaseReflectionV1beta1.listImplementationsRequest.typeUrl;

  @override
  List get values => [];

  @override
  String get queryPath =>
      BaseReflectionV1beta1.reflectionListImplementations.typeUrl;

  @override
  ListImplementationsResponse onResponse(List<int> bytes) {
    return ListImplementationsResponse.deserialize(bytes);
  }
}
