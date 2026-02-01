import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/messages/user_position_kv.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'params.dart';
import 'sale.dart';

/// GenesisState defines the streamswap module's genesis state
class OsmosisStreamSwapGenesisState extends CosmosMessage {
  final List<OsmosisStreamSwapSale> sales;
  final List<OsmosisStreamSwapUserPositionKV> userPositions;
  final BigInt? nextSaleId;
  final OsmosisStreamSwapParams params;
  OsmosisStreamSwapGenesisState({
    required List<OsmosisStreamSwapSale> sales,
    required List<OsmosisStreamSwapUserPositionKV> userPositions,
    this.nextSaleId,
    required this.params,
  }) : sales = sales.immutable,
       userPositions = userPositions.immutable;
  factory OsmosisStreamSwapGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapGenesisState(
      nextSaleId: decode.getField(3),
      sales:
          decode
              .getFields<List<int>>(1)
              .map((e) => OsmosisStreamSwapSale.deserialize(e))
              .toList(),
      userPositions:
          decode
              .getFields<List<int>>(2)
              .map((e) => OsmosisStreamSwapUserPositionKV.deserialize(e))
              .toList(),
      params: OsmosisStreamSwapParams.deserialize(decode.getField(4)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sales": sales.map((e) => e.toJson()).toList(),
      "user_positions": userPositions.map((e) => e.toJson()).toList(),
      "next_sale_id": nextSaleId?.toString(),
      "params": params.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisStreamSwapV1Types.genesisState;

  @override
  List get values => [sales, userPositions, nextSaleId, params];
}
