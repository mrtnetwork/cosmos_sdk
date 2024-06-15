import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_signing_v1beta1/messages/sign_mode.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_signing_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'signature_descriptor_data.dart';

/// Multi is the signature data for a multisig public key
class SignatureDescriptorDataSingle extends BaseSignatureDescriptorData {
  /// mode is the signing mode of the single signer
  final SignMode? mode;

  ///  signature is the raw signature bytes
  final List<int>? signature;
  SignatureDescriptorDataSingle({this.mode, List<int>? signature})
      : signature = BytesUtils.tryToBytes(signature, unmodifiable: true);
  factory SignatureDescriptorDataSingle.desrialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SignatureDescriptorDataSingle(
        mode: decode
            .getResult(1)
            ?.to<SignMode, int>((e) => SignMode.fromValue(e)),
        signature: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  int get id => 1;

  @override
  Map<String, dynamic> toJson() {
    return {
      "mode": mode?.value,
      "signature": BytesUtils.tryToHexString(signature)
    };
  }

  @override
  String get typeUrl => TxSigningV1beta1Types.single.typeUrl;

  @override
  List get values => [mode?.value, signature];
}
