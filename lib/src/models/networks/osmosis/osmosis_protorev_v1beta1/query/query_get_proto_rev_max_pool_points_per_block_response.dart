import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GetProtoRevMaxPoolPointsPerBlock queries the maximum number of pool points that can consumed per block.
class OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerBlockResponse
    extends CosmosMessage {
  /// [maxPoolPointsPerBlock] is the maximum number of pool points that can be
  /// consumed per block
  final BigInt? maxPoolPointsPerBlock;
  const OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerBlockResponse({
    this.maxPoolPointsPerBlock,
  });
  factory OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerBlockResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerBlockResponse(
      maxPoolPointsPerBlock: BigInt.parse(decode.getField(1)),
    );
  }
  factory OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerBlockResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerBlockResponse(
      maxPoolPointsPerBlock: BigintUtils.parse(
        json["max_pool_points_per_block"],
      ),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"max_pool_points_per_block": maxPoolPointsPerBlock.toString()};
  }

  @override
  List get values => [maxPoolPointsPerBlock];

  @override
  TypeUrl get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevMaxPoolPointsPerBlockResponse;
}
