import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgRagnarok extends CosmosMessage {
  final ThorchainObservedTx tx;
  final BigInt? blockHeight;
  final List<int>? signer;
  ThorchainMsgRagnarok({required this.tx, this.blockHeight, List<int>? signer})
    : signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgRagnarok.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgRagnarok(
      tx: ThorchainObservedTx.deserialize(decode.getField(1)),
      blockHeight: decode.getField(2),
      signer: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx": tx.toJson(),
      "block_height": blockHeight?.toString(),
      "signer": BytesUtils.tryToHexString(signer),
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.msgRagnarok;

  @override
  List get values => [tx, blockHeight, signer];
}
