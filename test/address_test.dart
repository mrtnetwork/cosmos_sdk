import 'package:blockchain_utils/blockchain_utils.dart';
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

  test("test vecotr", () {
    for (final i in cosmosTestVectors) {
      final String type = i.valueAs("publicKeyType");
      final pk = switch (type) {
        "secp256k1" => CosmosSecp256K1PublicKey.fromHex(i.valueAs("publicKey")),
        _ => CosmosED25519PublicKey.fromHex(i.valueAs("publicKey")),
      };
      final address = pk.toAddress();
      expect(address.address, i.valueAs("address"));
    }
  });
}

final List<Map<String, String>> cosmosTestVectors = [
  // ============================================================
  // SECP256K1  (20-byte address)
  // ============================================================
  {
    'publicKey':
        '0279be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f2815b16f81798',
    'publicKeyType': 'secp256k1',
    'address': 'cosmos1w508d6qejxtdg4y5r3zarvary0c5xw7k6ah60c',
    // 'addressBytes': '751e76e8199196d454941c45d1b3a323f1433bd6'
  },
  {
    'publicKey':
        '02c6047f9441ed7d6d3045406e95c07cd85c778e4b8cef3ca7abac09b95c709ee5',
    'publicKeyType': 'secp256k1',
    'address': 'cosmos1q6hag67dl53wl99vzg42z8eyzfz2xlkvsrxukv',
    // 'addressBytes': '06afd46bcdfd22ef94ac122aa11f241244a37ecc'
  },
  {
    'publicKey':
        '03f01d6b9018ab421dd410404cb869072065522bf85734008f105cf385a023a80f',
    'publicKeyType': 'secp256k1',
    'address': 'cosmos1z5s0ppmjpcvprqpdakdu8qqcm2v3z8us8ttk0h',
    // 'addressBytes': '1520f087720e1811802ded9bc38018da99111f90'
  },
  {
    'publicKey':
        '0314601b8cdf761d4ed94554865ef0ef5c451e275f3dfc0a667fea04fa5a833bed',
    'publicKeyType': 'secp256k1',
    'address': 'cosmos1kk80nv7s9yhwyhp6adtrsf4fjyh52nqwt4cw89',
    // 'addressBytes': 'b58ef9b3d0292ee25c3aeb563826a9912f454c0e'
  },
  {
    'publicKey':
        '0276d2fdf1302d1fa9556f4df94ec84cefba6d482e54f47c6c2a238c1baa560f0e',
    'publicKeyType': 'secp256k1',
    'address': 'cosmos18juz8qhggmtthkalzx8kuggemp9svch7c5gxf3',
    // 'addressBytes': '3cb82382e846d6bbdbbf118f6e2119d84b0662fe'
  },

  // ============================================================
  // ED25519  (20-byte address — truncated SHA256)
  // ============================================================
  {
    'publicKey':
        '3b6a27bcceb6a42d62a3a8d02a6f0d73653215771de243a63ac048a18b59da29',
    'publicKeyType': 'ed25519',
    'address': 'cosmos1zw0rjs8xfd2fzu3q3rv6p46pv28usfhqtmzkty',
    'consensusAddress': 'cosmosvalcons1zw0rjs8xfd2fzu3q3rv6p46pv28usfhq6u9ltk',
    // 'addressBytes': '139e3940e64b5491722088d9a0d741628fc826e0'
  },
  {
    'publicKey':
        '8a88e3dd7409f195fd52db2d3cba5d72ca6709bf1d94121bf3748801b40f6f5c',
    'publicKeyType': 'ed25519',
    'address': 'cosmos1x36slx9at870e9rd53d2405n80s4ff9476ffvm',
    'consensusAddress': 'cosmosvalcons1x36slx9at870e9rd53d2405n80s4ff940awqvf',
    // 'addressBytes': '34750f98bd59fcfc946da45aaabe933be154a4b5'
  },
  {
    'publicKey':
        'ff57575dc7af8bfc4d0837cc1ce2017b686a88145dc5579a958e3462fe9a908e',
    'publicKeyType': 'ed25519',
    'address': 'cosmos1u7xhd2t2hacu78r0cqewjuw73lvrfx3ttkptdt',
    'consensusAddress': 'cosmosvalcons1u7xhd2t2hacu78r0cqewjuw73lvrfx3t63xzde',
    // 'addressBytes': 'e78d76a96abf71cf1c6fc032e971de8fd8349a2b'
  },
  {
    'publicKey':
        '06c40af51143c8d2f3cf60880e05d38137dabc4263c2f292f8b1ace6724ac000',
    'publicKeyType': 'ed25519',
    'address': 'cosmos1f2dd7k2lg97pg45n6kgfryf94sznh663c33z9n',
    'consensusAddress': 'cosmosvalcons1f2dd7k2lg97pg45n6kgfryf94sznh663fkkt9p',
    // 'addressBytes': '4a9adf595f417c145693d590919125ac053beb51'
  },
  {
    'publicKey':
        '76a1592044a6e4f511265bca73a604d90b0529d1df602be30a19a9257660d1f5',
    'publicKeyType': 'ed25519',
    'address': 'cosmos147pzjk8j6ad0hy0c4r6d5ffjxrtrh6lcc4rzt8',
    'consensusAddress': 'cosmosvalcons147pzjk8j6ad0hy0c4r6d5ffjxrtrh6lcfjytt4',
    // 'addressBytes': 'af822958f2d75afb91f8a8f4da253230d63bebf8'
  },
];
