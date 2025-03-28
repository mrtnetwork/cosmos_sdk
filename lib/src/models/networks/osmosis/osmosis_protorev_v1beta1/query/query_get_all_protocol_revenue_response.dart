import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/messages/all_protocol_revenue.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisProtorevQueryGetAllProtocolRevenueResponse extends CosmosMessage {
  final OsmosisProtorevAllProtocolRevenue allProtocolRevenue;
  const OsmosisProtorevQueryGetAllProtocolRevenueResponse(
      this.allProtocolRevenue);
  factory OsmosisProtorevQueryGetAllProtocolRevenueResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevQueryGetAllProtocolRevenueResponse(
        OsmosisProtorevAllProtocolRevenue.deserialize(decode.getField(1)));
  }
  factory OsmosisProtorevQueryGetAllProtocolRevenueResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetAllProtocolRevenueResponse(
        OsmosisProtorevAllProtocolRevenue.fromJson(
            json["all_protocol_revenue"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"all_protocol_revenue": allProtocolRevenue.toJson()};
  }

  @override
  List get values => [allProtocolRevenue];

  @override
  TypeUrl get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetAllProtocolRevenueResponse;
}
