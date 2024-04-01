import 'package:blockchain_utils/exception/exceptions.dart';

class CryptoTypes {
  final String typeUrl;
  const CryptoTypes._(this.typeUrl);

  static const CryptoTypes secp256k1Publickey =
      CryptoTypes._("/cosmos.crypto.secp256k1.PubKey");
  static const CryptoTypes secp256k1Privatekey =
      CryptoTypes._("/cosmos.crypto.secp256k1.PrivKey");
  static const CryptoTypes secp256R1Publickey =
      CryptoTypes._("/cosmos.crypto.secp256r1.PubKey");
  static const CryptoTypes secp256R1Privatekey =
      CryptoTypes._("/cosmos.crypto.secp256r1.PrivKey");
  static const CryptoTypes ed25519Publickey =
      CryptoTypes._("/cosmos.crypto.ed25519.PubKey");
  static const CryptoTypes ed25519Privatekey =
      CryptoTypes._("/cosmos.crypto.ed25519.PrivKey");

  static const List<CryptoTypes> values = [
    secp256k1Publickey,
    secp256k1Privatekey,
    secp256R1Publickey,
    secp256R1Privatekey,
    ed25519Publickey,
    ed25519Privatekey
  ];

  static CryptoTypes fromType(String type) {
    return values.firstWhere((element) => element.typeUrl == type,
        orElse: () => throw MessageException(
            "No matching element found for the given type.",
            details: {"type": type}));
  }
}
