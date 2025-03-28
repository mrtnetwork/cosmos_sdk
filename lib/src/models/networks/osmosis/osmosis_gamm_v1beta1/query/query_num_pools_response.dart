import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';

class OsmosisGammQueryNumPoolsResponse extends CosmosMessage {
  final BigInt? numPools;

  OsmosisGammQueryNumPoolsResponse({this.numPools});
  factory OsmosisGammQueryNumPoolsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQueryNumPoolsResponse(numPools: decode.getField(1));
  }
  factory OsmosisGammQueryNumPoolsResponse.fromJson(Map<String, dynamic> json) {
    return OsmosisGammQueryNumPoolsResponse(
        numPools: BigintUtils.tryParse(json["num_pools"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"num_pools": numPools?.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.queryNumPoolsResponse;

  @override
  List get values => [numPools];
}
