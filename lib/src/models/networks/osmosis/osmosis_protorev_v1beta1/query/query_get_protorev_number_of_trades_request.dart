import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_get_proto_rev_number_of_trades_response.dart';

/// QueryGetProtoRevNumberOfTradesRequest is request type for the Query/GetProtoRevNumberOfTrades RPC method.
class OsmosisProtorevQueryGetProtoRevNumberOfTradesRequest extends CosmosMessage
    with
        QueryMessage<OsmosisProtorevQueryGetProtoRevNumberOfTradesResponse>,
        RPCMessage<OsmosisProtorevQueryGetProtoRevNumberOfTradesResponse> {
  const OsmosisProtorevQueryGetProtoRevNumberOfTradesRequest();
  factory OsmosisProtorevQueryGetProtoRevNumberOfTradesRequest.deserialize(
      List<int> bytes) {
    return OsmosisProtorevQueryGetProtoRevNumberOfTradesRequest();
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
  OsmosisProtorevQueryGetProtoRevNumberOfTradesResponse onResponse(
      List<int> bytes) {
    return OsmosisProtorevQueryGetProtoRevNumberOfTradesResponse.deserialize(
        bytes);
  }

  @override
  OsmosisProtorevQueryGetProtoRevNumberOfTradesResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevNumberOfTradesResponse.fromRpc(json);
  }

  @override
  String get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevNumberOfTradesRequest.typeUrl;

  @override
  String get queryPath =>
      OsmosisProtorevV1beta1Types.getProtoRevNumberOfTrades.typeUrl;

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get rpcPath =>
      OsmosisProtorevV1beta1Types.getProtoRevNumberOfTrades.rpcUrl();
}
