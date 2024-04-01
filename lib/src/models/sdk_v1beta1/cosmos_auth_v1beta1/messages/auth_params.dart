import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/auth_v1beta1_types.dart';

class AuthParams extends CosmosMessage {
  final BigInt maxMemoCharacters;
  final BigInt txSigLimit;
  final BigInt txSizeCostPerByte;
  final BigInt sigVerifyCostEd25519;
  final BigInt sigVerifyCostSecp256k1;
  const AuthParams(
      {required this.maxMemoCharacters,
      required this.txSigLimit,
      required this.txSizeCostPerByte,
      required this.sigVerifyCostEd25519,
      required this.sigVerifyCostSecp256k1});
  factory AuthParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthParams(
        maxMemoCharacters: decode.getField(1),
        txSigLimit: decode.getField(2),
        txSizeCostPerByte: decode.getField(3),
        sigVerifyCostEd25519: decode.getField(4),
        sigVerifyCostSecp256k1: decode.getField(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "max_memo_characters": maxMemoCharacters.toString(),
      "tx_sig_limit": txSigLimit.toString(),
      "tx_size_cost_per_byte": txSizeCostPerByte.toString(),
      "sig_verify_cost_ed25519": sigVerifyCostEd25519.toString(),
      "sig_verify_cost_secp256k1": sigVerifyCostSecp256k1.toString()
    };
  }

  @override
  String get typeUrl => AuthV1beta1Types.authParams.typeUrl;

  @override
  List get values => [
        maxMemoCharacters,
        txSigLimit,
        txSizeCostPerByte,
        sigVerifyCostEd25519,
        sigVerifyCostSecp256k1
      ];
}
