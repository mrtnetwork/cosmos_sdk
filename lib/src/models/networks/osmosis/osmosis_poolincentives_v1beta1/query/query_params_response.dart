import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/messages/params.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolincentivesQueryParamsResponse extends CosmosMessage {
  final OsmosisPoolincentivesParams params;
  OsmosisPoolincentivesQueryParamsResponse(this.params);
  factory OsmosisPoolincentivesQueryParamsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolincentivesQueryParamsResponse(
        OsmosisPoolincentivesParams.deserialize(decode.getField(1)));
  }
  factory OsmosisPoolincentivesQueryParamsResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisPoolincentivesQueryParamsResponse(
        OsmosisPoolincentivesParams.fromRpc(json["params"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params.toJson()};
  }

  @override
  String get typeUrl =>
      OsmosisPoolincentivesV1beta1Types.queryParamsResponse.typeUrl;
  @override
  List get values => [params];
}
