import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Data contains the set of transactions included in the block
class BlockData extends CosmosMessage {
  /// Txs that will be applied by state @ block.Height+1.
  /// NOTE: not all txs here are valid.  We're just agreeing on the order first.
  /// This means that block.AppHash does not include these txs.
  final List<List<int>> txs;
  BlockData({required List<List<int>> txs})
    : txs = List<List<int>>.unmodifiable(
        txs.map((e) => BytesUtils.toBytes(e).toList()),
      );
  factory BlockData.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return BlockData(txs: decode.getFields<List<int>>(1));
  }
  factory BlockData.fromJson(Map<String, dynamic> json) {
    return BlockData(
      txs:
          (json["txs"] as List)
              .map((e) => StringUtils.encode(e, type: StringEncoding.base64))
              .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"txs": txs.map((e) => BytesUtils.toHexString(e)).toList()};
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.data;

  @override
  List get values => [txs];
}
