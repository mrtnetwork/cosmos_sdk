import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/utils/utils.dart';
import 'package:blockchain_utils/crypto/quick_crypto.dart';

/// TxRaw is a variant of Tx that pins the signer's exact binary representation of body
/// and auth_info. This is used for signing, broadcasting and verification.
/// The binary toBuffer() is stored in Tendermint and the hash
/// sha256(toBuffer()) becomes the "txhash", commonly used as the transaction ID.
class TxRaw extends CosmosMessage {
  /// body_bytes is a protobuf serialization of a TxBody that matches the
  /// representation in SignDoc.
  final List<int> bodyBytes;

  /// auth_info_bytes is a protobuf serialization of an AuthInfo that matches the
  /// representation in SignDoc.
  final List<int> authInfoBytes;

  /// signatures is a list of signatures that matches the length and order of
  /// AuthInfo's signer_infos to allow connecting signature meta information like
  /// public key and signing mode by position.
  final List<List<int>> signatures;
  TxRaw({
    required List<int> bodyBytes,
    required List<int> authInfoBytes,
    required List<List<int>> signatures,
  }) : bodyBytes = BytesUtils.toBytes(bodyBytes, unmodifiable: true),
       authInfoBytes = BytesUtils.toBytes(authInfoBytes, unmodifiable: true),
       signatures = List<List<int>>.unmodifiable(
         signatures
             .map((e) => BytesUtils.toBytes(e, unmodifiable: true))
             .toList(),
       );
  factory TxRaw.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return TxRaw(
      bodyBytes: decode.getField(1),
      authInfoBytes: decode.getField(2),
      signatures: decode.getFields<List<int>>(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "body_bytes": BytesUtils.toHexString(bodyBytes),
      "auth_info_bytes": BytesUtils.toHexString(authInfoBytes),
      "signatures": signatures.map((e) => BytesUtils.toHexString(e)).toList(),
    };
  }

  String txId() {
    return BytesUtils.toHexString(QuickCrypto.sha256Hash(toBuffer()));
  }

  @override
  List get values => [bodyBytes, authInfoBytes, signatures];

  @override
  TypeUrl get typeUrl => TxV1beta1Types.txRaw;
}
