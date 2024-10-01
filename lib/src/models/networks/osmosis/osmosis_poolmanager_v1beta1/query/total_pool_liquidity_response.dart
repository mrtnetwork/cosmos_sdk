import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisPoolManagerTotalPoolLiquidityResponse extends CosmosMessage {
  final List<Coin> liquidity;
  OsmosisPoolManagerTotalPoolLiquidityResponse(List<Coin> liquidity)
      : liquidity = liquidity.immutable;
  factory OsmosisPoolManagerTotalPoolLiquidityResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerTotalPoolLiquidityResponse(
        decode.getFields(1).map((e) => Coin.deserialize(e)).toList());
  }
  factory OsmosisPoolManagerTotalPoolLiquidityResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerTotalPoolLiquidityResponse(
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
      OsmosisPoolManagerV1beta1Types.totalPoolLiquidityResponse.typeUrl;

  @override
  List get values => [liquidity];
}
