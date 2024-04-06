import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_reflection_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// ListImplementationsResponse is the response type of the ListImplementations RPC.
class ListImplementationsResponse extends CosmosMessage {
  final List<String> implementationMessageNames;
  ListImplementationsResponse(
      {required List<String> implementationMessageNames})
      : implementationMessageNames = implementationMessageNames.mutable;
  factory ListImplementationsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ListImplementationsResponse(
        implementationMessageNames: decode.getFields<String>(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"implementation_message_names": implementationMessageNames};
  }

  @override
  String get typeUrl =>
      BaseReflectionV1beta1.listImplementationsResponse.typeUrl;

  @override
  List get values => [implementationMessageNames];
}
