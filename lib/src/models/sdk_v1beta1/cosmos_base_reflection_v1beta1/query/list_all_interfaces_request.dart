import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_reflection_v1beta1/query/list_all_interfaces_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_reflection_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ListAllInterfaces lists all the interfaces registered in the interface registry..
class ListAllInterfacesRequest extends CosmosMessage
    with QueryMessage<ListAllInterfacesResponse> {
  ///  This message has no fields.
  const ListAllInterfacesRequest();
  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => BaseReflectionV1beta1.listAllInterfacesRequest;

  @override
  List get values => [];

  @override
  ListAllInterfacesResponse onResponse(List<int> bytes) {
    return ListAllInterfacesResponse.deserialize(bytes);
  }

  @override
  ListAllInterfacesResponse onJsonResponse(Map<String, dynamic> json) {
    return ListAllInterfacesResponse.fromJson(json);
  }
}
