import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgNoOp extends CosmosMessage {
  final ThorchainObservedTx observedTx;
  final List<int>? signer;
  final String? action;
  ThorchainMsgNoOp({required this.observedTx, List<int>? signer, this.action})
    : signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgNoOp.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgNoOp(
      observedTx: ThorchainObservedTx.deserialize(decode.getField(1)),
      signer: decode.getField(2),
      action: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "observed_tx": observedTx.toJson(),
      "signer": BytesUtils.tryToHexString(signer),
      "action": action,
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.msgNoOp;

  @override
  List get values => [observedTx, signer, action];
}
