import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisCosmWasmPoolMsgCreateCosmWasmPoolResponse extends CosmosMessage {
  final BigInt? poolId;
  OsmosisCosmWasmPoolMsgCreateCosmWasmPoolResponse({this.poolId});
  factory OsmosisCosmWasmPoolMsgCreateCosmWasmPoolResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisCosmWasmPoolMsgCreateCosmWasmPoolResponse(
        poolId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId?.toString()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisCosmWasmPoolV1beta1Types.msgCreateCosmWasmPoolResponse;

  @override
  List get values => [poolId?.toString()];
}
