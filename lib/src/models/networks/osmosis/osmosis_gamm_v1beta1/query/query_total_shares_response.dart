import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';

class OsmosisGammQueryTotalSharesResponse extends CosmosMessage {
  final Coin totalShares;

  OsmosisGammQueryTotalSharesResponse(this.totalShares);
  factory OsmosisGammQueryTotalSharesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQueryTotalSharesResponse(
        Coin.deserialize(decode.getField(1)));
  }
  factory OsmosisGammQueryTotalSharesResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisGammQueryTotalSharesResponse(
        Coin.fromRpc(json["total_shares"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"total_shares": totalShares.toJson()};
  }

  @override
  String get typeUrl =>
      OsmosisGammV1beta1Types.queryTotalSharesResponse.typeUrl;

  @override
  List get values => [totalShares];
}
