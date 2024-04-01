import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/models/tendermint/tendermint_crypto/messages/proof.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ValueOp extends CosmosMessage {
  final List<int>? key;
  final Proof? proof;
  ValueOp({List<int>? key, this.proof})
      : key = BytesUtils.tryToBytes(key, unmodifiable: true);
  factory ValueOp.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ValueOp(
        key: decode.getField(1),
        proof: decode
            .getResult(2)
            ?.to<Proof, List<int>>((e) => Proof.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"key": BytesUtils.tryToHexString(key), "proof": proof?.toJson()};
  }

  @override
  String get typeUrl => TendermintTypes.valueOp.typeUrl;

  @override
  List get values => [key, proof];
}
