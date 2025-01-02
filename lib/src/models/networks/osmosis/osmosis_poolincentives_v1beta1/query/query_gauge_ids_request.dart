import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/messages/gauge_id_with_duration.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolincentivesQueryGaugeIdsRequest extends CosmosMessage
    with QueryMessage<OsmosisPoolincentivesGaugeIdWithDuration> {
  final BigInt poolId;

  OsmosisPoolincentivesQueryGaugeIdsRequest({required this.poolId});
  factory OsmosisPoolincentivesQueryGaugeIdsRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolincentivesQueryGaugeIdsRequest(
        poolId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId.toString()};
  }

  @override
  OsmosisPoolincentivesGaugeIdWithDuration onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisPoolincentivesGaugeIdWithDuration.fromRpc(json);
  }

  @override
  OsmosisPoolincentivesGaugeIdWithDuration onResponse(List<int> bytes) {
    return OsmosisPoolincentivesGaugeIdWithDuration.deserialize(bytes);
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolincentivesV1beta1Types.queryGaugeIdsRequest;
  @override
  List get values => [poolId];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  List<String> get pathParameters => [poolId.toString()];
}
