import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/address/address/addr_utils.dart';
import 'package:cosmos_sdk/src/address/address/address.dart';
import 'package:cosmos_sdk/src/address/address/address_const.dart';
import 'package:cosmos_sdk/src/crypto/public_key/public_key.dart';
import 'package:cosmos_sdk/src/crypto/ed25519/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';

class CosmosED25519PublicKey extends CosmosPublicKeyInfo {
  final Ed25519PublicKey _publicKey;
  const CosmosED25519PublicKey._(this._publicKey);
  factory CosmosED25519PublicKey.fromBytes(List<int> keyBytes) {
    return CosmosED25519PublicKey._(Ed25519PublicKey.fromBytes(keyBytes));
  }
  factory CosmosED25519PublicKey.fromHex(String keyHex) {
    return CosmosED25519PublicKey.fromBytes(BytesUtils.fromHexString(keyHex));
  }
  factory CosmosED25519PublicKey.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmosED25519PublicKey._(
        Ed25519PublicKey.fromBytes(decode.getField(1)));
  }

  List<int> toBytes() {
    return _publicKey.uncompressed;
  }

  CosmosBaseAddress toAddresss({String hrp = CosmosAddrConst.validatorHRP}) {
    return CosmosBaseAddress.fromBytes(
        CosmosAddrUtils.ed22195PubkeyToAddress(toBytes()),
        hrp: hrp);
  }

  @override
  String toString() {
    return _publicKey.toHex();
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"key": _publicKey.toHex()};
  }

  @override
  List get values => [_publicKey.compressed.sublist(1)];

  @override
  String get typeUrl => CryptoTypes.ed25519Publickey.typeUrl;
}
