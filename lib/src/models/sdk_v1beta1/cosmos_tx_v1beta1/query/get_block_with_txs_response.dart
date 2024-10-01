import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/messages/tx.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/block.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/block_id.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// GetBlockWithTxsResponse is the response type for the Service.GetBlockWithTxs method.
/// Since: cosmos-sdk 0.45.2
class GetBlockWithTxsResponse extends CosmosMessage {
  /// txs are the transactions in the block.
  final List<Tx> txs;
  final BlockID? blockID;
  final Block? block;

  /// pagination defines a pagination for the response.
  final PageResponse? pagination;
  GetBlockWithTxsResponse(
      {required List<Tx> txs, this.block, this.blockID, this.pagination})
      : txs = txs.immutable;
  factory GetBlockWithTxsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GetBlockWithTxsResponse(
        txs: decode
            .getFields<List<int>>(1)
            .map((e) => Tx.deserialize(e))
            .toList(),
        blockID: decode
            .getResult(2)
            ?.to<BlockID, List<int>>((e) => BlockID.deserialize(e)),
        block: decode
            .getResult(3)
            ?.to<Block, List<int>>((e) => Block.deserialize(e)),
        pagination: decode
            .getResult(4)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "txs": txs.map((e) => e.toJson()).toList(),
      "block_id": blockID?.toJson(),
      "block": block?.toJson(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl => TxV1beta1Types.getBlockWithTxsResponse.typeUrl;

  @override
  List get values => [txs, blockID, block, pagination];
}
