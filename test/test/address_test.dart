import 'package:blockchain_utils/crypto/quick_crypto.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:test/test.dart';

void main() {
  test("IAddress encoding", () {
    final addr = CosmosBaseAddress.fromBytes(
      QuickCrypto.generateRandom(),
      hrp: CosmosAddrConst.kujira,
    );
    final decode = CosmosBaseAddress.deserializeIAddress(
      bytes: addr.encodeAsIAddress(),
    );
    expect(decode, addr);
    expect(decode.hrp, CosmosAddrConst.kujira);
  });
}
