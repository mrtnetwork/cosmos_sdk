import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryGetProtoRevPoolResponse is response type for the Query/GetProtoRevPool RPC method.
class OsmosisProtorevQueryGetProtoRevPoolResponse extends CosmosMessage {
  /// [poolId] is the pool_id stored for the denom pair
  final BigInt? poolId;
  const OsmosisProtorevQueryGetProtoRevPoolResponse({this.poolId});
  factory OsmosisProtorevQueryGetProtoRevPoolResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevQueryGetProtoRevPoolResponse(
        poolId: decode.getField(1));
  }
  factory OsmosisProtorevQueryGetProtoRevPoolResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevPoolResponse(
        poolId: BigintUtils.tryParse(json["pool_id"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId?.toString()};
  }

  @override
  List get values => [poolId];

  @override
  TypeUrl get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevPoolResponse;
}
