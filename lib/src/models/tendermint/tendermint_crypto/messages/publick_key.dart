import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// PublicKey defines the keys available for use with Validators
class TendermintPublicKey extends CosmosMessage {
  final Ed25519PublicKey? _ed25519;
  final Secp256k1PublicKey? _secp256k1;
  TendermintPublicKey(
      {Ed25519PublicKey? ed25519, Secp256k1PublicKey? secp256k1})
      : _ed25519 = ed25519,
        _secp256k1 = secp256k1;
  TendermintPublicKey.fromEd25519({List<int>? pubKeyBytes})
      : _ed25519 = pubKeyBytes == null
            ? null
            : Ed25519PublicKey.fromBytes(pubKeyBytes),
        _secp256k1 = null;
  TendermintPublicKey.fromSecp256k1({List<int>? pubKeyBytes})
      : _ed25519 = null,
        _secp256k1 = pubKeyBytes == null
            ? null
            : Secp256k1PublicKey.fromBytes(pubKeyBytes);
  factory TendermintPublicKey.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    if (decode.hasTag(1)) {
      return TendermintPublicKey.fromEd25519(pubKeyBytes: decode.getField(1));
    } else if (decode.hasTag(2)) {
      return TendermintPublicKey.fromSecp256k1(pubKeyBytes: decode.getField(2));
    }
    return TendermintPublicKey();
  }

  List<int>? get ed25519 => _ed25519?.compressed;
  List<int>? get secp256k1 => _secp256k1?.compressed;

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"ed25519": _ed25519?.toHex(), "secp256k1": _secp256k1?.toHex()};
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.publicKey;

  @override
  List get values => [_ed25519?.compressed.sublist(1), _secp256k1?.compressed];
}
