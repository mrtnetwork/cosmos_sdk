import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/common/tx.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgSwitch extends CosmosMessage {
  final ThorchainTx tx;
  final String? destination;
  final List<int>? signer;
  ThorchainMsgSwitch({required this.tx, this.destination, List<int>? signer})
      : signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgSwitch.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgSwitch(
        tx: ThorchainTx.deserialize(decode.getField(1)),
        destination: decode.getField(2),
        signer: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx": tx.toJson(),
      "destination": destination,
      "signer": BytesUtils.tryToHexString(signer)
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgSwitch.typeUrl;

  @override
  List get values => [tx, destination, signer];
}
