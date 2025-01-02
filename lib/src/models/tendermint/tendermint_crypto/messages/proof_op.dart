import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ProofOp defines an operation used for calculating Merkle root The data could be arbitrary format,
/// providing nessecary data for example neighbouring node hash
class TendermintCryptoProofOp extends CosmosMessage {
  final String? type;
  final List<int>? key;
  final List<int>? data;
  TendermintCryptoProofOp({this.type, List<int>? key, List<int>? data})
      : key = BytesUtils.tryToBytes(key, unmodifiable: true),
        data = BytesUtils.tryToBytes(data, unmodifiable: true);

  factory TendermintCryptoProofOp.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return TendermintCryptoProofOp(
        type: decode.getField(1),
        key: decode.getField(2),
        data: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "key": BytesUtils.tryToHexString(key),
      "data": BytesUtils.tryToHexString(data)
    };
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.proofOp;

  @override
  List get values => [type, key, data];
}
