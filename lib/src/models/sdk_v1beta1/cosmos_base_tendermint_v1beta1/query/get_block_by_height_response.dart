import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/messages/block.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/block.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/block_id.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GetBlockByHeightResponse is the response type for the Query/GetBlockByHeight RPC method..
class GetBlockByHeightResponse extends CosmosMessage {
  final BlockID? blockID;

  /// Deprecated: please use `sdk_block` instead
  final Block? block;

  /// Since: cosmos-sdk 0.47
  final CosmosBlock? sdkBlock;

  const GetBlockByHeightResponse({this.blockID, this.block, this.sdkBlock});
  factory GetBlockByHeightResponse.fromRpc(Map<String, dynamic> json) {
    return GetBlockByHeightResponse(
        block: json["block"] == null ? null : Block.fromRpc(json["block"]),
        blockID:
            json["block_id"] == null ? null : BlockID.fromRpc(json["block_id"]),
        sdkBlock: json["sdk_block"] == null
            ? null
            : CosmosBlock.fromRpc(json["sdk_block"]));
  }
  factory GetBlockByHeightResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GetBlockByHeightResponse(
        blockID: decode
            .getResult(1)
            ?.to<BlockID, List<int>>((e) => BlockID.deserialize(e)),
        block: decode
            .getResult(2)
            ?.to<Block, List<int>>((e) => Block.deserialize(e)),
        sdkBlock: decode
            .getResult(3)
            ?.to<CosmosBlock, List<int>>((e) => CosmosBlock.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "block_id": blockID?.toJson(),
      "block": block?.toJson(),
      "sdk_block": sdkBlock?.toJson()
    };
  }

  @override
  @override
  TypeUrl get typeUrl => BaseTendermintV1beta1Types.getBlockByHeightResponse;

  @override
  List get values => [blockID, block, sdkBlock];
}
