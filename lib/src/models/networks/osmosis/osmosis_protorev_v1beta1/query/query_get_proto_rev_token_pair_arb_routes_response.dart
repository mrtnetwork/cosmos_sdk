import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/messages/token_pair_arb_routes.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// QueryGetProtoRevTokenPairArbRoutesResponse is response type for the Query/GetProtoRevTokenPairArbRoutes RPC method.
class OsmosisProtorevQueryGetProtoRevTokenPairArbRoutesResponse
    extends CosmosMessage {
  /// routes is a list of all of the hot routes that the module is currently
  /// arbitraging
  final List<OsmosisProtorevTokenPairArbRoutes> routes;
  OsmosisProtorevQueryGetProtoRevTokenPairArbRoutesResponse(
      List<OsmosisProtorevTokenPairArbRoutes> routes)
      : routes = routes.mutable;
  factory OsmosisProtorevQueryGetProtoRevTokenPairArbRoutesResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevQueryGetProtoRevTokenPairArbRoutesResponse(decode
        .getFields(1)
        .map((e) => OsmosisProtorevTokenPairArbRoutes.deserialize(e))
        .toList());
  }
  factory OsmosisProtorevQueryGetProtoRevTokenPairArbRoutesResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevTokenPairArbRoutesResponse(
        (json["routes"] as List?)
                ?.map((e) => OsmosisProtorevTokenPairArbRoutes.fromRpc(e))
                .toList() ??
            <OsmosisProtorevTokenPairArbRoutes>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"routes": routes.map((e) => e.toJson())};
  }

  @override
  List get values => [routes];

  @override
  String get typeUrl => OsmosisProtorevV1beta1Types
      .queryGetProtoRevTokenPairArbRoutesResponse.typeUrl;
}
