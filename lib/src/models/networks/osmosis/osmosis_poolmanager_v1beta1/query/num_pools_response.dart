import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolManagerNumPoolsResponse extends CosmosMessage {
  final BigInt? numPools;
  const OsmosisPoolManagerNumPoolsResponse({this.numPools});
  factory OsmosisPoolManagerNumPoolsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerNumPoolsResponse(numPools: decode.getField(1));
  }
  factory OsmosisPoolManagerNumPoolsResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerNumPoolsResponse(
        numPools: BigintUtils.tryParse(json["num_pools"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"num_pools": numPools.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types.numPoolsResponse;

  @override
  List get values => [numPools];
}
