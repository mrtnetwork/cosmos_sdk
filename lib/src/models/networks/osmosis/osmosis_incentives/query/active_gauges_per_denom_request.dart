import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'active_gauges_per_denom_response.dart';

class OsmosisIncentiveActiveGaugesPerDenomRequest extends CosmosMessage
    with QueryMessage<OsmosisIncentiveActiveGaugesPerDenomResponse> {
  /// Desired denom when querying active gagues
  final String? denom;

  /// Pagination defines pagination for the request
  final PageRequest? pagination;
  const OsmosisIncentiveActiveGaugesPerDenomRequest(
      {this.denom, this.pagination});
  factory OsmosisIncentiveActiveGaugesPerDenomRequest.fromBytes(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIncentiveActiveGaugesPerDenomRequest(
        denom: decode.getField(1),
        pagination: decode
            .getResult(2)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  OsmosisIncentiveActiveGaugesPerDenomResponse onResponse(List<int> bytes) {
    return OsmosisIncentiveActiveGaugesPerDenomResponse.deserialize(bytes);
  }

  @override
  Map<String, dynamic> toJson() {
    return {"pagination": pagination?.toJson(), "denom": denom};
  }

  @override
  TypeUrl get typeUrl => OsmosisIncentivesTypes.activeGaugesPerDenomRequest;

  @override
  List get values => [denom, pagination];

  @override
  OsmosisIncentiveActiveGaugesPerDenomResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisIncentiveActiveGaugesPerDenomResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters =>
      {"denom": denom, ...pagination?.queryParameters ?? {}};
}
