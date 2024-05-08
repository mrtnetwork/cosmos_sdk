import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisPoolManagerTotalLiquidityResponse extends CosmosMessage {
  final List<Coin> liquidity;
  OsmosisPoolManagerTotalLiquidityResponse(List<Coin> liquidity)
      : liquidity = liquidity.mutable;
  factory OsmosisPoolManagerTotalLiquidityResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerTotalLiquidityResponse(
        decode.getFields(1).map((e) => Coin.deserialize(e)).toList());
  }
  factory OsmosisPoolManagerTotalLiquidityResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerTotalLiquidityResponse(
        (json["liquidity"] as List?)?.map((e) => Coin.fromRpc(e)).toList() ??
            <Coin>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"liquidity": liquidity.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl =>
      OsmosisPoolManagerV1beta1Types.totalLiquidityResponse.typeUrl;

  @override
  List get values => [liquidity];
}
