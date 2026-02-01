import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_unknown_response.dart';

class UnknownAminoService extends ServiceMessage with AminoMessage {
  final Map<String, dynamic> value;
  @override
  final String aminoType;
  const UnknownAminoService({required this.value, required this.aminoType});
  @override
  List<int> get fieldIds =>
      throw DartCosmosSdkPluginException(
        "Unsupported Protobuf format. Unable to convert unknown Amino message to Protobuf.",
      );

  @override
  CosmosMessage onResponse(List<int> bytes) {
    return UnknownServiceRequestResponse(bytes);
  }

  @override
  List<String?> get signers =>
      throw DartCosmosSdkPluginException(
        "Unable to find signer address from unknown Amino message.",
      );

  @override
  Map<String, dynamic> toJson() => value;

  @override
  TypeUrl get typeUrl =>
      throw DartCosmosSdkPluginException(
        "Unable to find typeUrl from unknown Amino message.",
      );

  @override
  List get values =>
      throw DartCosmosSdkPluginException(
        "Unsupported Protobuf format. Unable to convert unknown Amino message to Protobuf.",
      );
}
