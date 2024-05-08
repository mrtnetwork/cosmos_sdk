import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'total_volume_for_pool_response.dart';

class OsmosisPoolManagerTotalVolumeForPoolRequest extends CosmosMessage
    with
        QueryMessage<OsmosisPoolManagerTotalVolumeForPoolResponse>,
        RPCMessage<OsmosisPoolManagerTotalVolumeForPoolResponse> {
  final BigInt? poolId;
  const OsmosisPoolManagerTotalVolumeForPoolRequest({this.poolId});
  factory OsmosisPoolManagerTotalVolumeForPoolRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerTotalVolumeForPoolRequest(
        poolId: decode.getField(1));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  OsmosisPoolManagerTotalVolumeForPoolResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerTotalVolumeForPoolResponse.fromRpc(json);
  }

  @override
  OsmosisPoolManagerTotalVolumeForPoolResponse onResponse(List<int> bytes) {
    return OsmosisPoolManagerTotalVolumeForPoolResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath =>
      OsmosisPoolManagerV1beta1Types.totalVolumeForPool.typeUrl;

  @override
  String get rpcPath => OsmosisPoolManagerV1beta1Types.totalVolumeForPool
      .rpcUrl(pathParameters: [poolId?.toString()]);

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId?.toString()};
  }

  @override
  String get typeUrl =>
      OsmosisPoolManagerV1beta1Types.totalVolumeForPoolRequest.typeUrl;

  @override
  List get values => [poolId];
}
