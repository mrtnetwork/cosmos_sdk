import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/models/tendermint/tendermint_crypto/messages/proof.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class Part extends CosmosMessage {
  final BigInt? index;
  final List<int>? bytes;
  final Proof proof;
  Part({this.index, List<int>? bytes, required this.proof})
    : bytes = BytesUtils.tryToBytes(bytes, unmodifiable: true);

  factory Part.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Part(
      index: decode.getField(1),
      bytes: decode.getField(2),
      proof: Proof.deserialize(decode.getField(3)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "index": index?.toString(),
      "bytes": BytesUtils.tryToHexString(bytes),
      "proof": proof.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.tendermintPart;

  @override
  List get values => [index, bytes, proof];
}
