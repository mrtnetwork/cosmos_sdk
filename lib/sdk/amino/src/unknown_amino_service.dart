import 'package:blockchain_utils/utils/json/extension/json.dart';
import 'package:cosmos_sdk/sdk/exception/exception.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import 'package:blockchain_utils/proto/proto.dart';
import 'package:cosmos_sdk/sdk/types/bech32_config.dart';

class UnknownAminoService extends CosmosProtoMessage
    with ICosmosProtoAminoMessage {
  final Map<String, dynamic> value;
  @override
  final UnknownAminoProtoTypeUrl declarationId;
  const UnknownAminoService._({
    required this.value,
    required this.declarationId,
  });
  factory UnknownAminoService(Map<String, dynamic> json) {
    if (!json.hasValue("type") || !json.hasValue("value")) {
      throw const AminoJsonParserException(
        "Invalid amino message: 'type' or 'value' field is missing.",
      );
    }
    return UnknownAminoService._(
      value: json.valueEnsureAsMap<String, dynamic>("value"),
      declarationId: UnknownAminoProtoTypeUrl(
        aminoType: json.valueAsString("type"),
      ),
    );
  }

  @override
  Map<String, dynamic> toJson() => value;

  @override
  Map<String, dynamic> toAminoJson({CosmosBech32Config? config}) {
    return {"type": declarationId.getAminoType(), "value": value};
  }

  @override
  ProtoMessageConfig protoConfig() {
    throw DartCosmosSdkPluginException(
      "Unsupported Protobuf format. Unable to convert unknown Amino message to Protobuf.",
    );
  }

  @override
  List<Object?> get protoValues =>
      throw DartCosmosSdkPluginException(
        "Unsupported Protobuf format. Unable to convert unknown Amino message to Protobuf.",
      );
}
