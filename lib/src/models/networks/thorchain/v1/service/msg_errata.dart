import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgErrataTx extends CosmosMessage {
  final String? txId;
  final String? chain;
  final List<int>? signer;
  ThorchainMsgErrataTx({this.txId, this.chain, List<int>? signer})
      : signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgErrataTx.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgErrataTx(
        txId: decode.getField(1),
        chain: decode.getField(2),
        signer: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx_id": txId,
      "chain": chain,
      "signer": BytesUtils.tryToHexString(signer),
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgErrataTx.typeUrl;

  @override
  List get values => [txId, chain, signer];
}
