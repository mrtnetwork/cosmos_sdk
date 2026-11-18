@TestOn('browser')
@Tags(['wasm'])
library;

import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  setUpAll(() async {
    // Shared harness: loads the WASM module (built via
    // `dart tool/build_backends.dart --wasm`) and selects the Rust backend.
    // No .so involved.
    await CosmosTestApi.initWasmBrowser();
  });

  group('wasm backend smoke (cosmos_sdk)', () {
    test('sha256 empty (shared backend)', () {
      expect(
        BytesUtils.toHexString(QuickCrypto.sha256Hash([])),
        'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855',
      );
    });
    test('cosmos address roundtrip', () {
      final addr = CosmosBaseAddress.fromBytes(
        List<int>.filled(32, 7),
        hrp: CosmosAddrConst.kujira,
      );
      expect(
        CosmosBaseAddress.deserializeIAddress(bytes: addr.encodeAsIAddress()),
        addr,
      );
    });
  });
}
