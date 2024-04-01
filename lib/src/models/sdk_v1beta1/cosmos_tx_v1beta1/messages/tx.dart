import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/messages/auth_info.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/messages/tx_body.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/binary/binary.dart';

/// Tx is the standard type used for broadcasting transactions.
class Tx extends CosmosMessage {
  /// body is the processable content of the transaction
  final TXBody body;

  /// auth_info is the authorization related content of the transaction,
  /// specifically signers, signer modes and fee
  final AuthInfo authInfo;

  /// signatures is a list of signatures that matches the length and order of
  /// AuthInfo's signer_infos to allow connecting signature meta information like
  /// public key and signing mode by position.
  final List<List<int>> signatures;
  Tx(
      {required this.body,
      required this.authInfo,
      required List<List<int>> signatures})
      : signatures = List<List<int>>.unmodifiable(signatures
            .map((e) => BytesUtils.toBytes(e, unmodifiable: true))
            .toList());
  factory Tx.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Tx(
        body: TXBody.deserialize(decode.getField(1)),
        authInfo: AuthInfo.deserialize(decode.getField(2)),
        signatures: decode.getFileds<List<int>>(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "body": body.toJson(),
      "auth_info": authInfo.toJson(),
      "signatures": signatures.map((e) => BytesUtils.toHexString(e)).toList()
    };
  }

  @override
  List get values => [body, authInfo, signatures];

  @override
  String get typeUrl => TxV1beta1Types.tx.typeUrl;
}
