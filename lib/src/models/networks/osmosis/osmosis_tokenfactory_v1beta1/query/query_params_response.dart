import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/messages/params.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Params defines a gRPC query method that returns the tokenfactory module's parameters.
class OsmosisTokenFactoryQueryParamsResponse extends CosmosMessage {
  /// params defines the parameters of the module
  final OsmosisTokenFactoryParams params;
  OsmosisTokenFactoryQueryParamsResponse(this.params);
  factory OsmosisTokenFactoryQueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTokenFactoryQueryParamsResponse(
        OsmosisTokenFactoryParams.deserialize(decode.getField(1)));
  }
  factory OsmosisTokenFactoryQueryParamsResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisTokenFactoryQueryParamsResponse(
        OsmosisTokenFactoryParams.fromRpc(json["params"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisTokenFactoryV1beta1Types.queryParamsResponse;

  @override
  List get values => [params];
}
