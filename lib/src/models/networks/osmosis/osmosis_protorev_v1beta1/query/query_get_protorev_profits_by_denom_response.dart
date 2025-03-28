import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryGetProtoRevProfitsByDenomResponse is response type for the Query/GetProtoRevProfitsByDenom RPC method.
class OsmosisProtorevQueryGetProtoRevProfitsByDenomResponse
    extends CosmosMessage {
  /// profit is the profits of the module by the selected denom
  final Coin profit;
  const OsmosisProtorevQueryGetProtoRevProfitsByDenomResponse(this.profit);
  factory OsmosisProtorevQueryGetProtoRevProfitsByDenomResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevQueryGetProtoRevProfitsByDenomResponse(
        Coin.deserialize(decode.getField(1)));
  }
  factory OsmosisProtorevQueryGetProtoRevProfitsByDenomResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevProfitsByDenomResponse(
        Coin.fromJson(json["profit"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"profit": profit.toJson()};
  }

  @override
  List get values => [profit];

  @override
  TypeUrl get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevProfitsByDenomResponse;
}
