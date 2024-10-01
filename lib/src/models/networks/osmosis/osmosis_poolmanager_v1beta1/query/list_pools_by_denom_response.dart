import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisPoolManagerListPoolsByDenomResponse extends CosmosMessage {
  final List<Any>? pools;
  OsmosisPoolManagerListPoolsByDenomResponse({List<Any>? pools})
      : pools = pools?.emptyAsNull?.immutable;
  factory OsmosisPoolManagerListPoolsByDenomResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerListPoolsByDenomResponse(
        pools: decode.getFields(1).map((e) => Any.deserialize(e)).toList());
  }
  factory OsmosisPoolManagerListPoolsByDenomResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerListPoolsByDenomResponse(
        pools: (json["pools"] as List?)?.map((e) => Any.fromRpc(e)).toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pools": pools?.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl =>
      OsmosisPoolManagerV1beta1Types.listPoolsByDenomResponse.typeUrl;

  @override
  List get values => [pools];
}
