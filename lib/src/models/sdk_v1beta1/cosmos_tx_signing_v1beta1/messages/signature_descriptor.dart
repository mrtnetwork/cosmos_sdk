import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_signing_v1beta1/messages/data.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_signing_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// SignatureDescriptor is a convenience type which represents
/// the full data for a signature including the public key of the signer,
/// signing modes and the signature itself. It is primarily used for
/// coordinating signatures between clients.
class SignatureDescriptor extends CosmosMessage {
  /// public_key is the public key of the signer
  final Any? publicKey;
  final SignatureDescriptorData? data;

  /// sequence is the sequence of the account, which describes the
  /// number of committed transactions signed by a given address. It is used to prevent
  /// replay attacks.
  final BigInt? sequence;
  const SignatureDescriptor({this.publicKey, this.data, this.sequence});
  factory SignatureDescriptor.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SignatureDescriptor(
        publicKey:
            decode.getResult(1)?.to<Any, List<int>>((e) => Any.deserialize(e)),
        data: decode.getResult(2)?.to<SignatureDescriptorData, List<int>>(
            (e) => SignatureDescriptorData.deserialize(e)),
        sequence: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "public_key": publicKey?.toJson(),
      "data": data?.toJson(),
      "sequence": sequence?.toString()
    };
  }

  @override
  String get typeUrl => TxSigningV1beta1Types.signatureDescriptor.typeUrl;

  @override
  List get values => [1, 2, 3];
}
