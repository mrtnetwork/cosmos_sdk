/// Key and address derivation for Cosmos SDK accounts.
///
/// Run the chain first (see README.md):
///   ./start.sh
/// then:
///   dart run lib/examples/cosmos/keys.dart
library;

import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';

import 'cosmos_node.dart';

Future<void> main() async {
  print('Cosmos SDK — key & address derivation');
  print(field('hrp', CosmosAddrConst.accHRP));
  print(field('mnemonic', cosmosMnemonic));

  for (var i = 0; i < 3; i++) {
    final key = cosmosAccount(i);
    final pub = key.toPublicKey();
    final address = pub.toAddress(hrp: CosmosAddrConst.accHRP);
    print('--- account $i  (m/44\'/118\'/0\'/0/$i) ---');
    print(field(
        'private key', '0x${BytesUtils.toHexString(key.toBytes().toBytes())}'));
    print(field('public key', pub.toBytes().toHex()));
    print(field('address', address.address));
  }
}
