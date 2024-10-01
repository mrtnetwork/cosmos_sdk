import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/messages/params.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// GenesisState defines the cosmwasmpool module's genesis state.
class OsmosisCosmWasmPoolGenesisState extends CosmosMessage {
  /// params is the container of cosmwasmpool parameters.
  final OsmosisCosmWasmPoolParams params;
  final List<Any>? pools;

  OsmosisCosmWasmPoolGenesisState({required this.params, List<Any>? pools})
      : pools = pools?.emptyAsNull?.immutable;
  factory OsmosisCosmWasmPoolGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisCosmWasmPoolGenesisState(
        params: OsmosisCosmWasmPoolParams.deserialize(decode.getField(1)),
        pools: decode.getFields(2).map((e) => Any.deserialize(e)).toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "params": params.toJson(),
      "pools": pools?.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => OsmosisCosmWasmPoolV1beta1Types.gnesisState.typeUrl;

  @override
  List get values => [params, pools];
}
