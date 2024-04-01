import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/block_id.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/header.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class BlockMeta extends CosmosMessage {
  final BlockID? blockID;
  final BigInt? blockSize;
  final Header? header;
  final BigInt? numTxs;
  const BlockMeta({this.blockID, this.blockSize, this.header, this.numTxs});
  factory BlockMeta.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return BlockMeta(
        blockID: decode
            .getResult(1)
            ?.to<BlockID, List<int>>((e) => BlockID.deserialize(e)),
        blockSize: decode.getField(2),
        header: decode
            .getResult(3)
            ?.to<Header, List<int>>((e) => Header.deserialize(e)),
        numTxs: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "block_id": blockID?.toJson(),
      "block_size": blockSize?.toString(),
      "header": header?.toJson(),
      "num_txs": numTxs?.toString()
    };
  }

  @override
  String get typeUrl => TendermintTypes.blockMeta.typeUrl;

  @override
  List get values => [blockID, blockSize, header, numTxs];
}
