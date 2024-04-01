import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/crypto/ed25519/types/types.dart';
import 'address_const.dart';

class CosmosAddrUtils {
  static void validateAddressBytes(List<int> addrBytes) {
    if (addrBytes.length != QuickCrypto.hash160DigestSize &&
        addrBytes.length != QuickCrypto.sha256DigestSize) {
      throw MessageException("Invalid address bytes length.", details: {
        "length": addrBytes.length,
        "Excepted":
            "${QuickCrypto.hash160DigestSize} or ${QuickCrypto.sha256DigestSize}"
      });
    }
  }

  static String toAddr(List<int> addrBytes,
      {String hrp = CosmosAddrConst.accHRP}) {
    validateAddressBytes(addrBytes);
    return Bech32Encoder.encode(hrp, addrBytes);
  }

  static String prefix(String addr) {
    final decode = Bech32Decoder.decodeWithoutHRP(addr);
    return decode.item1;
  }

  static List<int> decodeBytes(String addr, {String? hrp}) {
    final decode = Bech32Decoder.decodeWithoutHRP(addr);
    validateAddressBytes(decode.item2);
    if (hrp != null && hrp != decode.item1) {
      throw MessageException("Invalid network address prefix.",
          details: {"Excepted": hrp, "hrp": decode.item1});
    }
    return decode.item2;
  }

  static List<int> secp256k1PubKeyToAddress(List<int> pubkeyBytes) {
    final pubkey = Secp256k1PublicKeyEcdsa.fromBytes(pubkeyBytes);
    return QuickCrypto.hash160(pubkey.compressed);
  }

  static List<int> secp256r1PubKeyToAddress(List<int> pubkeyBytes) {
    final pubkey = Nist256p1PublicKey.fromBytes(pubkeyBytes);
    return hash(CryptoTypes.secp256R1Publickey.typeUrl.substring(1).codeUnits,
        pubkey.compressed);
  }

  /// Hash creates a new address from address type and key.
  /// The functions should only be used by new types defining their own address function
  /// (eg public keys).
  static List<int> hash(List<int> typ, List<int> key) {
    return QuickCrypto.sha256Hash([...QuickCrypto.sha256Hash(typ), ...key]);
  }

  /// Module is a specialized version of a composed address for modules. Each module account
  /// is constructed from a module name and a sequence of derivation keys (at least one
  /// derivation key must be provided). The derivation keys must be unique
  /// in the module scope, and is usually constructed from some object id. Example, let's
  /// a x/dao module, and a new DAO object, it's address would be:
  ///
  ///	address.Module(dao.ModuleName, newDAO.ID)
  static List<int> module(String moduleName,
      {List<List<int>> derivationKeys = const []}) {
    List<int> keyBytes = StringUtils.encode(moduleName);
    if (derivationKeys.isEmpty) {
      return QuickCrypto.sha256Hash(keyBytes).sublist(0, 20);
    }
    keyBytes = [...keyBytes, 0];
    List<int> addr =
        hash("module".codeUnits, [...keyBytes, ...derivationKeys[0]]);
    for (int i = 1; i < derivationKeys.length; i++) {
      addr = hash(addr, derivationKeys[i]);
    }
    return addr;
  }

  static List<int> ed22195PubkeyToAddress(List<int> pubkeyBytes) {
    final ed25519 = Ed25519PublicKey.fromBytes(pubkeyBytes);
    return QuickCrypto.sha256Hash(ed25519.compressed).sublist(0, 20);
  }
}
