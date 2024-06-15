import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgReserveContributor extends CosmosMessage {
  final ThorchainTx tx;
  final ThorchainReserveContributor contributor;
  final List<int>? signer;
  ThorchainMsgReserveContributor(
      {required this.tx, required this.contributor, List<int>? signer})
      : signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgReserveContributor.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgReserveContributor(
        tx: ThorchainTx.deserialize(decode.getField(1)),
        contributor:
            ThorchainReserveContributor.deserialize(decode.getField(2)),
        signer: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx": tx.toJson(),
      "contributor": contributor.toJson(),
      "signer": BytesUtils.tryToHexString(signer)
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgReserveContributor.typeUrl;

  @override
  List get values => [tx, contributor, signer];
}
