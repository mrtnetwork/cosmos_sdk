import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'pool_response.dart';

class OsmosisPoolManagerPoolRequest extends CosmosMessage
    with QueryMessage<OsmosisPoolManagerPoolResponse> {
  final BigInt poolId;
  const OsmosisPoolManagerPoolRequest({required this.poolId});
  factory OsmosisPoolManagerPoolRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerPoolRequest(poolId: decode.getField(1));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  OsmosisPoolManagerPoolResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisPoolManagerPoolResponse.fromJson(json);
  }

  @override
  OsmosisPoolManagerPoolResponse onResponse(List<int> bytes) {
    return OsmosisPoolManagerPoolResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types.poolRequest;

  @override
  List get values => [poolId];

  @override
  List<String> get pathParameters => [poolId.toString()];
}
