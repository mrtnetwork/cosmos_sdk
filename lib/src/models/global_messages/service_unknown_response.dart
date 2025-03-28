import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

class UnknownServiceRequestResponse extends CosmosMessage {
  final List<int> bytes;
  const UnknownServiceRequestResponse(this.bytes);

  @override
  List<int> get fieldIds =>
      throw DartCosmosSdkPluginException("Unsupported Protobuf format.");

  @override
  Map<String, dynamic> toJson() {
    return {"bytes": CosmosUtils.toBase64(bytes)};
  }

  @override
  TypeUrl get typeUrl =>
      throw DartCosmosSdkPluginException("Unsupported Protobuf format.");

  @override
  List get values =>
      throw DartCosmosSdkPluginException("Unsupported Protobuf format.");
}
