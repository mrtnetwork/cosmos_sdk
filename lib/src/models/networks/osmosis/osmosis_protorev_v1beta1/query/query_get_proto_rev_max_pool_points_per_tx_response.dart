import 'package:blockchain_utils/numbers/bigint_utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryGetProtoRevMaxPoolPointsPerTxResponse is response type for the Query/GetProtoRevMaxPoolPointsPerTx RPC method..
class OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerTxResponse
    extends CosmosMessage {
  /// [maxPoolPointsPerTx] is the maximum number of pool points that can be
  /// consumed per transaction
  final BigInt? maxPoolPointsPerTx;
  const OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerTxResponse(
      {this.maxPoolPointsPerTx});
  factory OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerTxResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerTxResponse(
        maxPoolPointsPerTx: BigInt.parse(decode.getField(1)));
  }
  factory OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerTxResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerTxResponse(
        maxPoolPointsPerTx: BigintUtils.parse(json["max_pool_points_per_tx"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"max_pool_points_per_tx": maxPoolPointsPerTx.toString()};
  }

  @override
  List get values => [maxPoolPointsPerTx];

  @override
  String get typeUrl => OsmosisProtorevV1beta1Types
      .queryGetProtoRevMaxPoolPointsPerTxResponse.typeUrl;
}
