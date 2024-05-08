import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolManagerPoolResponse extends CosmosMessage {
  final Any pool;
  const OsmosisPoolManagerPoolResponse(this.pool);
  factory OsmosisPoolManagerPoolResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerPoolResponse(Any.deserialize(decode.getField(1)));
  }
  factory OsmosisPoolManagerPoolResponse.fromRpc(Map<String, dynamic> json) {
    return OsmosisPoolManagerPoolResponse(Any.fromRpc(json["pool"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pool": pool.toJson()};
  }

  @override
  String get typeUrl => OsmosisPoolManagerV1beta1Types.poolResponse.typeUrl;

  @override
  List get values => [pool];
}
