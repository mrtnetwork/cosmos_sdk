import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_reflection_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// ListAllInterfacesResponse is the response type of the ListAllInterfaces RPC.
class ListAllInterfacesResponse extends CosmosMessage {
  /// interface_names is an array of all the registered interfaces.
  final List<String> interfaceNames;
  ListAllInterfacesResponse({required List<String> interfaceNames})
      : interfaceNames = interfaceNames.mutable;
  factory ListAllInterfacesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ListAllInterfacesResponse(interfaceNames: decode.getFields(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"interface_names": interfaceNames};
  }

  @override
  String get typeUrl => BaseReflectionV1beta1.listAllInterfacesResponse.typeUrl;

  @override
  List get values => [interfaceNames];
}
