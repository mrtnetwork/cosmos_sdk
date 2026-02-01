import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainNode extends CosmosMessage {
  final String? pubkey;
  final List<int>? blameData;
  final List<int>? blameSignature;
  ThorchainNode({this.pubkey, List<int>? blameData, List<int>? blameSignature})
    : blameData = BytesUtils.tryToBytes(blameData, unmodifiable: true),
      blameSignature = BytesUtils.tryToBytes(
        blameSignature,
        unmodifiable: true,
      );
  factory ThorchainNode.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainNode(
      pubkey: decode.getField(1),
      blameData: decode.getField(2),
      blameSignature: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pubkey": pubkey,
      "blame_data": BytesUtils.tryToHexString(blameData),
      "blame_signature": BytesUtils.tryToHexString(blameSignature),
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.node;

  @override
  List get values => [pubkey, blameData, blameSignature];
}
