import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/messages/metadata.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class OsmosisTokenFactoryMsgSetDenomMetadata
    extends OsmosisTokenFactoryV1Beta1<EmptyServiceRequestResponse> {
  final String? sender;
  final Metadata metadata;
  OsmosisTokenFactoryMsgSetDenomMetadata({this.sender, required this.metadata});
  factory OsmosisTokenFactoryMsgSetDenomMetadata.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTokenFactoryMsgSetDenomMetadata(
        sender: decode.getField(1),
        metadata: Metadata.deserialize(decode.getField(2)));
  }
  factory OsmosisTokenFactoryMsgSetDenomMetadata.fromJson(
      Map<String, dynamic> json) {
    return OsmosisTokenFactoryMsgSetDenomMetadata(
        sender: json.as("sender"),
        metadata: Metadata.fromJson(json.asMap("metadata")));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"sender": sender, "metadata": metadata.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisTokenFactoryV1beta1Types.msgSetDenomMetadata;

  @override
  List get values => [sender, metadata];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        OsmosisTokenFactoryV1beta1Types.msgSetDenomMetadataResponse);
  }

  @override
  List<String?> get signers => [sender];
}
