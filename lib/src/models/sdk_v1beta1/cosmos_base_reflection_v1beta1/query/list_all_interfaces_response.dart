import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_reflection_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// ListAllInterfacesResponse is the response type of the ListAllInterfaces RPC.
class ListAllInterfacesResponse extends CosmosMessage {
  /// interface_names is an array of all the registered interfaces.
  final List<String> interfaceNames;
  ListAllInterfacesResponse({required List<String> interfaceNames})
    : interfaceNames = interfaceNames.immutable;

  factory ListAllInterfacesResponse.fromJson(Map<String, dynamic> json) {
    return ListAllInterfacesResponse(
      interfaceNames: (json["interface_names"] as List?)?.cast() ?? [],
    );
  }
  factory ListAllInterfacesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ListAllInterfacesResponse(
      interfaceNames: decode.getFields<String>(1),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"interface_names": interfaceNames};
  }

  @override
  TypeUrl get typeUrl => BaseReflectionV1beta1.listAllInterfacesResponse;

  @override
  List get values => [interfaceNames];
}
