import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgConsolidate extends CosmosMessage {
  final ThorchainObservedTx observedTx;
  final List<int>? signer;
  ThorchainMsgConsolidate({required this.observedTx, List<int>? signer})
      : signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgConsolidate.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgConsolidate(
        observedTx: ThorchainObservedTx.deserialize(decode.getField(1)),
        signer: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "observed_tx": observedTx.toJson(),
      "signer": BytesUtils.tryToHexString(signer)
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgConsolidate.typeUrl;

  @override
  List get values => [observedTx, signer];
}
