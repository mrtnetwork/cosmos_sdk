import 'package:cosmos_sdk/src/crypto/multisig_v1beta1/compact_bitarray.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_signing_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'signature_descriptor_data.dart';

/// Multi is the signature data for a multisig public key
class SignatureDescriptorDataMulti extends BaseSignatureDescriptorData {
  /// bitarray specifies which keys within the multisig are signing
  final CompactBitArray? bitarray;

  ///  signatures is the signatures of the multi-signature
  final List<BaseSignatureDescriptorData>? signatures;
  SignatureDescriptorDataMulti({
    this.bitarray,
    List<BaseSignatureDescriptorData>? signatures,
  }) : signatures = signatures?.emptyAsNull?.immutable;
  factory SignatureDescriptorDataMulti.desrialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SignatureDescriptorDataMulti(
      bitarray: decode
          .getResult(1)
          ?.to<CompactBitArray, List<int>>(
            (e) => CompactBitArray.deserialize(e),
          ),
      signatures:
          decode
              .getFields<List<int>>(2)
              .map((e) => BaseSignatureDescriptorData.deserialize(e))
              .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  int get id => 2;

  @override
  Map<String, dynamic> toJson() {
    return {
      "bitarray": bitarray?.toJson(),
      "signature": signatures?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => TxSigningV1beta1Types.multi;

  @override
  List get values => [bitarray, signatures];
}
