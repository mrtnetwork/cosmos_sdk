import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_get_all_protocol_revenue_response.dart';

/// GetAllProtocolRevenue queries all of the protocol revenue that has been accumulated by any module.
class OsmosisProtorevQueryGetAllProtocolRevenueRequest extends CosmosMessage
    with QueryMessage<OsmosisProtorevQueryGetAllProtocolRevenueResponse> {
  const OsmosisProtorevQueryGetAllProtocolRevenueRequest();
  factory OsmosisProtorevQueryGetAllProtocolRevenueRequest.deserialize(
    List<int> bytes,
  ) {
    return const OsmosisProtorevQueryGetAllProtocolRevenueRequest();
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
  OsmosisProtorevQueryGetAllProtocolRevenueResponse onResponse(
    List<int> bytes,
  ) {
    return OsmosisProtorevQueryGetAllProtocolRevenueResponse.deserialize(bytes);
  }

  @override
  OsmosisProtorevQueryGetAllProtocolRevenueResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return OsmosisProtorevQueryGetAllProtocolRevenueResponse.fromJson(json);
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetAllProtocolRevenueRequest;

  @override
  Map<String, String?> get queryParameters => {};
}
