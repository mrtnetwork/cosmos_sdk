import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_denoms_from_creator_response.dart';

/// QueryDenomsFromCreatorRequest defines the request structure for the DenomsFromCreator gRPC query.
class OsmosisTokenFactoryQueryDenomsFromCreatorRequest extends CosmosMessage
    with QueryMessage<OsmosisTokenFactoryQueryDenomsFromCreatorResponse> {
  final String creator;
  OsmosisTokenFactoryQueryDenomsFromCreatorRequest({required this.creator});
  factory OsmosisTokenFactoryQueryDenomsFromCreatorRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTokenFactoryQueryDenomsFromCreatorRequest(
        creator: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"creator": creator};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisTokenFactoryV1beta1Types.queryDenomsFromCreatorRequest;

  @override
  List get values => [creator];

  @override
  OsmosisTokenFactoryQueryDenomsFromCreatorResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisTokenFactoryQueryDenomsFromCreatorResponse.fromJson(json);
  }

  @override
  OsmosisTokenFactoryQueryDenomsFromCreatorResponse onResponse(
      List<int> bytes) {
    return OsmosisTokenFactoryQueryDenomsFromCreatorResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  List<String> get pathParameters => [creator];
}
