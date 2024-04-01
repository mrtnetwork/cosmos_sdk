import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/address/address/addr_utils.dart';
import 'package:cosmos_sdk/src/address/address/address.dart';
import 'package:cosmos_sdk/src/address/address/address_const.dart';
import 'package:cosmos_sdk/src/crypto/public_key/public_key.dart';
import 'package:cosmos_sdk/src/crypto/ed25519/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';

class CosmosSecp256R1PublicKey extends CosmosPublicKeyInfo {
  final Nist256p1PublicKey _publicKey;
  const CosmosSecp256R1PublicKey._(this._publicKey);
  factory CosmosSecp256R1PublicKey.fromBytes(List<int> keyBytes) {
    return CosmosSecp256R1PublicKey._(Nist256p1PublicKey.fromBytes(keyBytes));
  }
  factory CosmosSecp256R1PublicKey.fromHex(String keyHex) {
    return CosmosSecp256R1PublicKey.fromBytes(BytesUtils.fromHexString(keyHex));
  }
  factory CosmosSecp256R1PublicKey.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmosSecp256R1PublicKey._(
        Nist256p1PublicKey.fromBytes(decode.getField(1)));
  }
  List<int> toBytes({bool compressed = true}) {
    if (compressed) return _publicKey.compressed;
    return _publicKey.uncompressed;
  }

  BaseAddress toAddresss({String hrp = CosmosAddrConst.accHRP}) {
    return BaseAddress.fromBytes(
        CosmosAddrUtils.secp256r1PubKeyToAddress(toBytes()),
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
  List get values => [toBytes()];

  @override
  String get typeUrl => CryptoTypes.secp256R1Publickey.typeUrl;
}
