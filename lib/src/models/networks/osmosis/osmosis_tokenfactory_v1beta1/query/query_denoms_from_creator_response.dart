import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// QueryDenomsFromCreatorRequest defines the response structure for the DenomsFromCreator gRPC query.
class OsmosisTokenFactoryQueryDenomsFromCreatorResponse extends CosmosMessage {
  final List<String>? denoms;
  OsmosisTokenFactoryQueryDenomsFromCreatorResponse({List<String>? denoms})
      : denoms = denoms?.nullOnEmpy;
  factory OsmosisTokenFactoryQueryDenomsFromCreatorResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTokenFactoryQueryDenomsFromCreatorResponse(
        denoms: decode.getFields<String>(1));
  }
  factory OsmosisTokenFactoryQueryDenomsFromCreatorResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisTokenFactoryQueryDenomsFromCreatorResponse(
        denoms: (json["denoms"] as List?)?.cast());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"denoms": denoms};
  }

  @override
  String get typeUrl =>
      OsmosisTokenFactoryV1beta1Types.queryDenomsFromCreatorResponse.typeUrl;

  @override
  List get values => [denoms];
}
