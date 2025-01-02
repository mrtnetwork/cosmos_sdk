import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// CosmWasmPool represents the data serialized into state for each CW pool.
/// Note: CW Pool has 2 pool models:
/// CosmWasmPool which is a proto-generated store model used for serialization into state.
/// Pool struct that encapsulates the CosmWasmPool and wasmKeeper for calling the contract.
/// CosmWasmPool implements the poolmanager.PoolI interface but it panics on all methods.
/// The reason is that access to wasmKeeper is required to call the contract.
/// Instead, all interactions and poolmanager.PoolI methods are to be performed on the Pool struct.
/// The reason why we cannot have a Pool struct only is because it cannot be serialized
/// into state due to having a non-serializable wasmKeeper field.
class OsmosisCosmWasmPoolCosmWasmPool extends CosmosMessage {
  final String? contractAddress;
  final BigInt? poolId;
  final BigInt? codeId;
  final List<int>? instantiateMsg;
  OsmosisCosmWasmPoolCosmWasmPool(
      {this.contractAddress,
      this.poolId,
      this.codeId,
      List<int>? instantiateMsg})
      : instantiateMsg =
            BytesUtils.tryToBytes(instantiateMsg, unmodifiable: true);
  factory OsmosisCosmWasmPoolCosmWasmPool.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisCosmWasmPoolCosmWasmPool(
        contractAddress: decode.getField(1),
        poolId: decode.getField(2),
        codeId: decode.getField(3),
        instantiateMsg: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "contract_address": contractAddress,
      "pool_id": poolId?.toString(),
      "code_id": codeId?.toString(),
      "instantiate_msg": BytesUtils.tryToHexString(instantiateMsg)
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisCosmWasmPoolV1beta1Types.cosmWasmPool;

  @override
  List get values => [contractAddress, poolId, codeId, instantiateMsg];
}
