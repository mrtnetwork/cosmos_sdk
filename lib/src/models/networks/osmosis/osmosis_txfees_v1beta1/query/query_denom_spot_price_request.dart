import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_txfees_v1beta1/type/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_denom_spot_price_response.dart';

/// QueryDenomSpotPriceRequest defines grpc request structure for querying spot price for the specified tx fee denom
class OsmosisTxfeesQueryDenomSpotPriceRequest extends CosmosMessage
    with QueryMessage<OsmosisTxfeesQueryDenomSpotPriceResponse> {
  final String? denom;
  const OsmosisTxfeesQueryDenomSpotPriceRequest({this.denom});
  factory OsmosisTxfeesQueryDenomSpotPriceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTxfeesQueryDenomSpotPriceRequest(denom: decode.getField(1));
  }
  factory OsmosisTxfeesQueryDenomSpotPriceRequest.fromJson(
      Map<String, dynamic> json) {
    return OsmosisTxfeesQueryDenomSpotPriceRequest(denom: json["denom"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"denom": denom};
  }

  @override
  TypeUrl get typeUrl => OsmosisTxfeesV1beta1Types.queryDenomSpotPriceRequest;

  @override
  List get values => [denom];

  @override
  OsmosisTxfeesQueryDenomSpotPriceResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisTxfeesQueryDenomSpotPriceResponse.fromJson(json);
  }

  @override
  OsmosisTxfeesQueryDenomSpotPriceResponse onResponse(List<int> bytes) {
    return OsmosisTxfeesQueryDenomSpotPriceResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {"denom": denom};
}
