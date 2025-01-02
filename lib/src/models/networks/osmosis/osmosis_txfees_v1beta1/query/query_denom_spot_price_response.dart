import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_txfees_v1beta1/type/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDenomSpotPriceRequest defines grpc response structure for querying spot price for the specified tx fee denom
class OsmosisTxfeesQueryDenomSpotPriceResponse extends CosmosMessage {
  final BigInt? poolID;
  final String spotPrice;
  const OsmosisTxfeesQueryDenomSpotPriceResponse(
      {this.poolID, required this.spotPrice});
  factory OsmosisTxfeesQueryDenomSpotPriceResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTxfeesQueryDenomSpotPriceResponse(
        poolID: decode.getField(1), spotPrice: decode.getField(2));
  }
  factory OsmosisTxfeesQueryDenomSpotPriceResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisTxfeesQueryDenomSpotPriceResponse(
        poolID: BigintUtils.tryParse(json["poolID"]),
        spotPrice: json["spot_price"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"poolID": poolID?.toString(), "spot_price": spotPrice};
  }

  @override
  TypeUrl get typeUrl => OsmosisTxfeesV1beta1Types.queryDenomSpotPriceResponse;

  @override
  List get values => [poolID, spotPrice];
}
