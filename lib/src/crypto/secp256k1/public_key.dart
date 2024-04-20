import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/address/address/addr_utils.dart';
import 'package:cosmos_sdk/src/address/address/address.dart';
import 'package:cosmos_sdk/src/address/address/address_const.dart';
import 'package:cosmos_sdk/src/crypto/public_key/public_key.dart';
import 'package:cosmos_sdk/src/crypto/ed25519/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';

class CosmosSecp256K1PublicKey extends CosmosPublicKeyInfo {
  final Secp256k1PublicKeyEcdsa _publicKey;
  const CosmosSecp256K1PublicKey._(this._publicKey);
  factory CosmosSecp256K1PublicKey.fromBytes(List<int> keyBytes) {
    return CosmosSecp256K1PublicKey._(
        Secp256k1PublicKeyEcdsa.fromBytes(keyBytes));
  }
  factory CosmosSecp256K1PublicKey.fromHex(String keyHex) {
    return CosmosSecp256K1PublicKey.fromBytes(BytesUtils.fromHexString(keyHex));
  }
  factory CosmosSecp256K1PublicKey.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmosSecp256K1PublicKey._(
        Secp256k1PublicKeyEcdsa.fromBytes(decode.getField(1)));
  }
  List<int> toBytes({bool compressed = true}) {
    if (compressed) return _publicKey.compressed;
    return _publicKey.uncompressed;
  }

  CosmosBaseAddress toAddresss({String hrp = CosmosAddrConst.accHRP}) {
    return CosmosBaseAddress.fromBytes(
        CosmosAddrUtils.secp256k1PubKeyToAddress(toBytes()),
        hrp: hrp);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"key": _publicKey.toHex()};
  }

  @override
  List get values => [toBytes()];

  @override
  String get typeUrl => CryptoTypes.secp256k1Publickey.typeUrl;
  @override
  String toString() {
    return _publicKey.toHex();
  }
}
