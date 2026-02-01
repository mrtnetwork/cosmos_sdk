import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolManagerPoolResponse extends CosmosMessage {
  final AnyMessage pool;
  const OsmosisPoolManagerPoolResponse(this.pool);
  factory OsmosisPoolManagerPoolResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerPoolResponse(
      AnyMessage.deserialize(decode.getField(1)),
    );
  }
  factory OsmosisPoolManagerPoolResponse.fromJson(Map<String, dynamic> json) {
    return OsmosisPoolManagerPoolResponse(AnyMessage.fromJson(json["pool"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pool": pool.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types.poolResponse;

  @override
  List get values => [pool];
}
