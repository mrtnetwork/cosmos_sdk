import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisPoolManagerListPoolsByDenomResponse extends CosmosMessage {
  final List<AnyMessage>? pools;
  OsmosisPoolManagerListPoolsByDenomResponse({List<AnyMessage>? pools})
    : pools = pools?.emptyAsNull?.immutable;
  factory OsmosisPoolManagerListPoolsByDenomResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerListPoolsByDenomResponse(
      pools:
          decode
              .getFields<List<int>>(1)
              .map((e) => AnyMessage.deserialize(e))
              .toList(),
    );
  }
  factory OsmosisPoolManagerListPoolsByDenomResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisPoolManagerListPoolsByDenomResponse(
      pools:
          (json["pools"] as List?)?.map((e) => AnyMessage.fromJson(e)).toList(),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pools": pools?.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisPoolManagerV1beta1Types.listPoolsByDenomResponse;

  @override
  List get values => [pools];
}
