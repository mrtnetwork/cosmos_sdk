import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/messages/sign_doc_direct_aux.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_signing_v1beta1/messages/sign_mode.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// AuxSignerData is the intermediary format that an auxiliary signer (e.g. a tipper)
/// builds and sends to the fee payer (who will build and broadcast the actual tx).
/// AuxSignerData is not a valid tx in itself, and will be rejected by the node if sent directly as-is.
///
/// Since: cosmos-sdk 0.46
class AuxSignerData extends CosmosMessage {
  /// address is the bech32-encoded address of the auxiliary signer. If using
  /// AuxSignerData across different chains, the bech32 prefix of the target
  /// chain (where the final transaction is broadcasted) should be used.
  final CosmosBaseAddress? address;

  /// sign_doc is the SIGN_MODE_DIRECT_AUX sign doc that the auxiliary signer
  /// signs. Note: we use the same sign doc even if we're signing with
  /// LEGACY_AMINO_JSON.
  final SignDocDirectAux? signDoc;

  /// mode is the signing mode of the single signer.
  final SignMode? mode;

  /// sig is the signature of the sign doc.
  final List<int>? sig;
  AuxSignerData({this.address, this.signDoc, this.mode, List<int>? sig})
      : sig = BytesUtils.tryToBytes(sig, unmodifiable: true);

  factory AuxSignerData.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuxSignerData(
      address: decode
          .getResult(1)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      sig: decode.getField(4),
      signDoc: decode.getResult(2)?.to<SignDocDirectAux, List<int>>(
          (e) => SignDocDirectAux.deserialize(e)),
      mode:
          decode.getResult(3)?.to<SignMode, int>((e) => SignMode.fromValue(e)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "address": address?.address,
      "sign_doc": signDoc?.toJson(),
      "mode": mode?.value,
      "sig": BytesUtils.tryToHexString(sig)
    };
  }

  @override
  TypeUrl get typeUrl => TxV1beta1Types.auxSignerData;

  @override
  List get values => [address?.address, signDoc, mode?.value, sig];
}
