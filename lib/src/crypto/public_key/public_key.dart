import 'package:cosmos_sdk/src/crypto/crypto.dart';
import 'package:cosmos_sdk/src/crypto/ed25519/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/message/any.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:blockchain_utils/blockchain_utils.dart';

abstract class CosmosPublicKeyInfo extends CosmosMessage {
  const CosmosPublicKeyInfo();
  factory CosmosPublicKeyInfo.fromAnyBytes(List<int> bytes) {
    final any = Any.deserialize(bytes);
    final pubkeyType = CryptoTypes.fromType(any.typeUrl);
    switch (pubkeyType) {
      case CryptoTypes.secp256R1Publickey:
        return CosmosSecp256R1PublicKey.deserialize(any.value);
      case CryptoTypes.secp256k1Publickey:
        return CosmosSecp256K1PublicKey.deserialize(any.value);
      case CryptoTypes.ed25519Publickey:
        return CosmosED25519PublicKey.deserialize(any.value);
      default:
        throw MessageException("Invalid public type.",
            details: {"type": any.typeUrl});
    }
  }
  factory CosmosPublicKeyInfo.fromRpc(Map<String, dynamic> json) {
    final pubkeyType = CryptoTypes.fromType(json["@type"]);
    final List<int> key =
        StringUtils.encode(json["key"], StringEncoding.base64);
    switch (pubkeyType) {
      case CryptoTypes.secp256R1Publickey:
        return CosmosSecp256R1PublicKey.fromBytes(key);
      case CryptoTypes.secp256k1Publickey:
        return CosmosSecp256K1PublicKey.fromBytes(key);
      case CryptoTypes.ed25519Publickey:
        return CosmosED25519PublicKey.fromBytes(key);
      default:
        throw MessageException("Invalid public type.",
            details: {"type": pubkeyType.typeUrl});
    }
  }
}
