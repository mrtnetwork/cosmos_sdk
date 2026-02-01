import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisPoolManagerTotalLiquidityResponse extends CosmosMessage {
  final List<Coin> liquidity;
  OsmosisPoolManagerTotalLiquidityResponse(List<Coin> liquidity)
    : liquidity = liquidity.immutable;
  factory OsmosisPoolManagerTotalLiquidityResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerTotalLiquidityResponse(
      decode.getFields<List<int>>(1).map((e) => Coin.deserialize(e)).toList(),
    );
  }
  factory OsmosisPoolManagerTotalLiquidityResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisPoolManagerTotalLiquidityResponse(
      (json["liquidity"] as List?)?.map((e) => Coin.fromJson(e)).toList() ??
          <Coin>[],
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"liquidity": liquidity.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types.totalLiquidityResponse;

  @override
  List get values => [liquidity];
}
