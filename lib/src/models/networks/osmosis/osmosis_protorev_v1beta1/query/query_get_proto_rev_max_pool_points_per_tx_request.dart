import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_get_proto_rev_max_pool_points_per_tx_response.dart';

/// GetProtoRevMaxPoolPointsPerTx queries the maximum number of pool points that can be consumed per transaction.
class OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerTxRequest
    extends CosmosMessage
    with
        QueryMessage<OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerTxResponse>,
        RPCMessage<OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerTxResponse> {
  const OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerTxRequest();
  factory OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerTxRequest.deserialize(
      List<int> bytes) {
    return OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerTxRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  List get values => [];

  @override
  OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerTxResponse onResponse(
      List<int> bytes) {
    return OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerTxResponse
        .deserialize(bytes);
  }

  @override
  OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerTxResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerTxResponse.fromRpc(
        json);
  }

  @override
  String get typeUrl => OsmosisProtorevV1beta1Types
      .queryGetProtoRevMaxPoolPointsPerTxRequest.typeUrl;

  @override
  String get queryPath =>
      OsmosisProtorevV1beta1Types.getProtoRevMaxPoolPointsPerTx.typeUrl;

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get rpcPath =>
      OsmosisProtorevV1beta1Types.getProtoRevMaxPoolPointsPerTx.rpcUrl();
}
