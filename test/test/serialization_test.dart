import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:test/test.dart';

void main() {
  group("serialization", () {
    _fee();
    _signerInfo();
    _authInfo();
    _msgSend();
    _txBody();
    _signDoc();
    _txRaw();
  });
}

void _fee() {
  test("fee", () {
    final fee = Fee(amount: [
      Coin(
        denom: "uatom",
        amount: BigInt.from(500),
      )
    ], gasLimit: BigInt.from(200000));
    expect(fee.toHex, "0a0c0a057561746f6d120335303010c09a0c");
  });
}

void _signerInfo() {
  test("signer info", () {
    final sigInfo = SignerInfo(
        publicKey: CosmosSecp256K1PublicKey.fromHex(
                "0312b4a708eaf861f52a8e934716d24b3ba3b13cf3acee3145aff924507a6e3f77")
            .toAny(),
        modeInfo: const ModeInfo(ModeInfoSignle(SignMode.signModeDirect)),
        sequence: BigInt.zero);
    expect(sigInfo.toHex,
        "0a460a1f2f636f736d6f732e63727970746f2e736563703235366b312e5075624b657912230a210312b4a708eaf861f52a8e934716d24b3ba3b13cf3acee3145aff924507a6e3f7712040a020801");
  });
}

void _authInfo() {
  test("auth info", () {
    final authInfo = AuthInfo(
        signerInfos: [
          SignerInfo(
              publicKey: CosmosSecp256K1PublicKey.fromHex(
                      "0312b4a708eaf861f52a8e934716d24b3ba3b13cf3acee3145aff924507a6e3f77")
                  .toAny(),
              modeInfo: const ModeInfo(ModeInfoSignle(SignMode.signModeDirect)),
              sequence: BigInt.zero)
        ],
        fee: Fee(amount: [
          Coin(
            denom: "uatom",
            amount: BigInt.from(500),
          )
        ], gasLimit: BigInt.from(200000)));
    expect(authInfo.toHex,
        "0a4e0a460a1f2f636f736d6f732e63727970746f2e736563703235366b312e5075624b657912230a210312b4a708eaf861f52a8e934716d24b3ba3b13cf3acee3145aff924507a6e3f7712040a02080112120a0c0a057561746f6d120335303010c09a0c");
  });
}

void _msgSend() {
  test("msg send", () {
    final message = MsgSend(
        fromAddress:
            CosmosBaseAddress("cosmos1htg7dmhelazdsmuwm9ngtg0tpe82006uqdw9nj"),
        toAddress:
            CosmosBaseAddress("cosmos1qhslf0sx2fegltfqq0p5j6etmdznjgfnm2j6nc"),
        amount: [Coin(denom: "uatom", amount: BigInt.from(1000000))]);
    expect(message.toHex,
        "0a2d636f736d6f733168746737646d68656c617a64736d75776d396e67746730747065383230303675716477396e6a122d636f736d6f73317168736c66307378326665676c746671713070356a3665746d647a6e6a67666e6d326a366e631a100a057561746f6d120731303030303030");
  });
}

void _txBody() {
  test("txbody", () {
    final message = MsgSend(
        fromAddress:
            CosmosBaseAddress("cosmos1htg7dmhelazdsmuwm9ngtg0tpe82006uqdw9nj"),
        toAddress:
            CosmosBaseAddress("cosmos1qhslf0sx2fegltfqq0p5j6etmdznjgfnm2j6nc"),
        amount: [Coin(denom: "uatom", amount: BigInt.from(1000000))]);
    final txbody = TXBody(messages: [message]);
    expect(txbody.toHex,
        "0a90010a1c2f636f736d6f732e62616e6b2e763162657461312e4d736753656e6412700a2d636f736d6f733168746737646d68656c617a64736d75776d396e67746730747065383230303675716477396e6a122d636f736d6f73317168736c66307378326665676c746671713070356a3665746d647a6e6a67666e6d326a366e631a100a057561746f6d120731303030303030");
  });
}

void _signDoc() {
  test("signDoc", () {
    final authInfo = AuthInfo(
        signerInfos: [
          SignerInfo(
              publicKey: CosmosSecp256K1PublicKey.fromHex(
                      "0312b4a708eaf861f52a8e934716d24b3ba3b13cf3acee3145aff924507a6e3f77")
                  .toAny(),
              modeInfo: const ModeInfo(ModeInfoSignle(SignMode.signModeDirect)),
              sequence: BigInt.zero)
        ],
        fee: Fee(amount: [
          Coin(
            denom: "uatom",
            amount: BigInt.from(500),
          )
        ], gasLimit: BigInt.from(200000)));
    final message = MsgSend(
        fromAddress:
            CosmosBaseAddress("cosmos1htg7dmhelazdsmuwm9ngtg0tpe82006uqdw9nj"),
        toAddress:
            CosmosBaseAddress("cosmos1qhslf0sx2fegltfqq0p5j6etmdznjgfnm2j6nc"),
        amount: [Coin(denom: "uatom", amount: BigInt.from(1000000))]);
    final txbody = TXBody(messages: [message]);
    final SignDoc signDoc = SignDoc(
        bodyBytes: txbody.toBuffer(),
        authInfoBytes: authInfo.toBuffer(),
        chainId: "theta-testnet-001",
        accountNumber: BigInt.from(747363));
    expect(signDoc.toHex,
        "0a93010a90010a1c2f636f736d6f732e62616e6b2e763162657461312e4d736753656e6412700a2d636f736d6f733168746737646d68656c617a64736d75776d396e67746730747065383230303675716477396e6a122d636f736d6f73317168736c66307378326665676c746671713070356a3665746d647a6e6a67666e6d326a366e631a100a057561746f6d12073130303030303012640a4e0a460a1f2f636f736d6f732e63727970746f2e736563703235366b312e5075624b657912230a210312b4a708eaf861f52a8e934716d24b3ba3b13cf3acee3145aff924507a6e3f7712040a02080112120a0c0a057561746f6d120335303010c09a0c1a1174686574612d746573746e65742d30303120e3ce2d");
  });
}

void _txRaw() {
  test("txRaw", () {
    final authInfo = AuthInfo(
        signerInfos: [
          SignerInfo(
              publicKey: CosmosSecp256K1PublicKey.fromHex(
                      "0312b4a708eaf861f52a8e934716d24b3ba3b13cf3acee3145aff924507a6e3f77")
                  .toAny(),
              modeInfo: const ModeInfo(ModeInfoSignle(SignMode.signModeDirect)),
              sequence: BigInt.zero)
        ],
        fee: Fee(amount: [
          Coin(
            denom: "uatom",
            amount: BigInt.from(500),
          )
        ], gasLimit: BigInt.from(200000)));
    final message = MsgSend(
        fromAddress:
            CosmosBaseAddress("cosmos1htg7dmhelazdsmuwm9ngtg0tpe82006uqdw9nj"),
        toAddress:
            CosmosBaseAddress("cosmos1qhslf0sx2fegltfqq0p5j6etmdznjgfnm2j6nc"),
        amount: [Coin(denom: "uatom", amount: BigInt.from(1000000))]);
    final txbody = TXBody(messages: [message]);
    final txRaw = TxRaw(
        bodyBytes: txbody.toBuffer(),
        authInfoBytes: authInfo.toBuffer(),
        signatures: [
          BytesUtils.fromHexString(
              "4409cfd68f922f0aad913af1a415ea5b24550784f5a6f11408ccc18678747bf14a327fce0fdc1c5c99f7011065670dbf5ae187ed8cb96708cec9d3df3af92a1b")
        ]);
    expect(txRaw.toHex,
        "0a93010a90010a1c2f636f736d6f732e62616e6b2e763162657461312e4d736753656e6412700a2d636f736d6f733168746737646d68656c617a64736d75776d396e67746730747065383230303675716477396e6a122d636f736d6f73317168736c66307378326665676c746671713070356a3665746d647a6e6a67666e6d326a366e631a100a057561746f6d12073130303030303012640a4e0a460a1f2f636f736d6f732e63727970746f2e736563703235366b312e5075624b657912230a210312b4a708eaf861f52a8e934716d24b3ba3b13cf3acee3145aff924507a6e3f7712040a02080112120a0c0a057561746f6d120335303010c09a0c1a404409cfd68f922f0aad913af1a415ea5b24550784f5a6f11408ccc18678747bf14a327fce0fdc1c5c99f7011065670dbf5ae187ed8cb96708cec9d3df3af92a1b");
  });
}
