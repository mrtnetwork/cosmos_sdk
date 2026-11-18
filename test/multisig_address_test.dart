import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:test/test.dart';
import 'utils.dart';

void main() {
  CosmosTestApi.runTest(multisigAddressTest, 'MultisigAddress');
}

void multisigAddressTest() {
  // Valid keys derived from fixed secrets. Multisig encodings verified
  // byte-for-byte against real go-amino (tendermint/go-amino, registered
  // names tendermint/PubKeySecp256k1, tendermint/PubKeyEd25519,
  // tendermint/PubKeyMultisigThreshold); addresses are sha256(...)[:20].
  CosmosSecp256K1PublicKey secp(int byte) {
    return CosmosSecp256K1PublicKey(
      Secp256k1PrivateKey.fromBytes(List<int>.filled(32, byte)).publicKey,
    );
  }

  final k1 = secp(1);
  final k2 = secp(2);
  final k3 =
      CosmosED25519PrivateKey.fromBytes(List<int>.filled(32, 3)).toPublicKey();

  test('member encodings use amino prefixes', () {
    expect(k1.toBytes().toHex().length, 66);
    expect(k3.toBytes().toHex().length, 64);
  });

  test('multisig amino bytes match go-amino reference (2-of-3)', () {
    final bytes = CosmosMultisigAddress.aminoBytes(
      threshold: 2,
      pubKeys: [k1, k2, k3],
    );
    expect(
      bytes.toHex(),
      '22c1f7e20802'
      '1226eb5ae98721031b84c5567b126440995d3ed5aaba0565d71e1834604819ff9c17f5e9d5dd078f'
      '1226eb5ae98721024d4b6cd1361032ca9bd2aeb9d900aa4d45d9ead80ac9423374c451a7254d0766'
      '12251624de6420ed4928c628d1c2c6eae90338905995612959273a5c63f93636c14614ac8737d1',
    );
  });

  test('multisig address matches sha256 reference (2-of-3)', () {
    final addr = CosmosMultisigAddress.address(
      threshold: 2,
      pubKeys: [k1, k2, k3],
      hrp: 'cosmos',
    );
    expect(
      BytesUtils.toHexString(addr.toBytes()),
      '786779cd8bd7d1125db070965d0b78177cd27eca',
    );
    expect(addr.address.startsWith('cosmos1'), true);
  });

  test('multisig reference vector (1-of-1)', () {
    final bytes = CosmosMultisigAddress.aminoBytes(threshold: 1, pubKeys: [k1]);
    expect(
      bytes.toHex(),
      '22c1f7e20801'
      '1226eb5ae98721031b84c5567b126440995d3ed5aaba0565d71e1834604819ff9c17f5e9d5dd078f',
    );
    final addr = CosmosMultisigAddress.address(
      threshold: 1,
      pubKeys: [k1],
      hrp: 'cosmos',
    );
    expect(
      BytesUtils.toHexString(addr.toBytes()),
      '0eca3dd0069d99d444ce978bfef2913cd3905bea',
    );
  });

  test('member order changes the address', () {
    final a = CosmosMultisigAddress.address(
      threshold: 2,
      pubKeys: [k1, k2],
      hrp: 'cosmos',
    );
    final b = CosmosMultisigAddress.address(
      threshold: 2,
      pubKeys: [k2, k1],
      hrp: 'cosmos',
    );
    expect(a.address == b.address, false);
  });

  test('non-amino member types throw instead of guessing', () {
    // Valid compressed point, but an eth algorithm: no amino registration.
    final eth = CosmosETHSecp256K1PublicKey.fromBytes(
      BytesUtils.fromHexString(k1.toBytes().toHex()),
      algorithm: CosmosKeysAlgs.ethsecp256k1,
    );
    expect(
      () => CosmosMultisigAddress.address(
        threshold: 1,
        pubKeys: [eth],
        hrp: 'cosmos',
      ),
      throwsA(isA<BuError>()),
    );
  });

  test('invalid threshold and key count throw', () {
    expect(
      () => CosmosMultisigAddress.aminoBytes(threshold: 0, pubKeys: [k1]),
      throwsA(isA<BuError>()),
    );
    expect(
      () => CosmosMultisigAddress.aminoBytes(threshold: 2, pubKeys: [k1]),
      throwsA(isA<BuError>()),
    );
  });

  test('addressForChain is gated by multisigSupports', () {
    CosmosSdkChain chainWith(List<CosmosMultisigSupport> supports) {
      return CosmosSdkChain(
        name: 'cosmoshub',
        path: 'cosmoshub',
        chainName: 'Cosmos Hub',
        chainId: 'cosmoshub-4',
        bech32Prefix: 'cosmos',
        native: CosmosSdkAsset(
          name: 'Atom',
          decimals: 6,
          denom: 'uatom',
          imagePng: null,
          imageSvg: null,
          coingeckoId: null,
          symbol: 'ATOM',
        ),
        slip44: 118,
        explorers: CosmosSkdExplorer(accountPage: null, txPage: null),
        bestApis: [],
        fees: [],
        supportedAlgs: [CosmosKeysAlgs.secp256k1],
        type: ChainType.mainnet,
        ibcChannels: [],
        multisigSupports: supports,
      );
    }

    final ok = CosmosMultisigAddress.addressForChain(
      chain: chainWith([CosmosMultisigSupport.legacyAminoThreshold]),
      threshold: 1,
      pubKeys: [k1],
    );
    expect(
      BytesUtils.toHexString(ok.toBytes()),
      '0eca3dd0069d99d444ce978bfef2913cd3905bea',
    );
    expect(
      () => CosmosMultisigAddress.addressForChain(
        chain: chainWith([CosmosMultisigSupport.unknown]),
        threshold: 1,
        pubKeys: [k1],
      ),
      throwsA(isA<BuError>()),
    );
    expect(
      () => CosmosMultisigAddress.addressForChain(
        chain: chainWith([CosmosMultisigSupport.none]),
        threshold: 1,
        pubKeys: [k1],
      ),
      throwsA(isA<BuError>()),
    );
  });
}
