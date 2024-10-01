import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainTxOut extends CosmosMessage {
  final BigInt? height;
  final List<ThorchainTxOutItem> txArray;
  ThorchainTxOut({this.height, required List<ThorchainTxOutItem> txArray})
      : txArray = txArray.immutable;
  factory ThorchainTxOut.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainTxOut(
        height: decode.getField(1),
        txArray: decode
            .getFields(2)
            .map((e) => ThorchainTxOutItem.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "height": height?.toString(),
      "tx_array": txArray.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.txOut.typeUrl;

  @override
  List get values => [height, txArray];
}
