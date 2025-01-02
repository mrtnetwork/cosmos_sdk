import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainPubKeySet extends CosmosMessage {
  final String? secp256k1;
  final String? ed25519;
  const ThorchainPubKeySet({this.secp256k1, this.ed25519});
  factory ThorchainPubKeySet.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainPubKeySet(
        secp256k1: decode.getField(1), ed25519: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"secp256k1": secp256k1, "ed25519": ed25519};
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.pubKeySet;

  @override
  List get values => [secp256k1, ed25519];
}
