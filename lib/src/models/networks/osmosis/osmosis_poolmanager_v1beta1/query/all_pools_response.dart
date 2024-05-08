import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisPoolManagerAllPoolsResponse extends CosmosMessage {
  final List<Any>? pools;
  OsmosisPoolManagerAllPoolsResponse({List<Any>? pools})
      : pools = pools?.nullOnEmpy;
  factory OsmosisPoolManagerAllPoolsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerAllPoolsResponse(
        pools: decode.getFields(1).map((e) => Any.deserialize(e)).toList());
  }
  factory OsmosisPoolManagerAllPoolsResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerAllPoolsResponse(
        pools: (json["pools"] as List?)?.map((e) => Any.fromRpc(e)).toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pools": pools?.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl => OsmosisPoolManagerV1beta1Types.allPoolsResponse.typeUrl;

  @override
  List get values => [pools];
}
