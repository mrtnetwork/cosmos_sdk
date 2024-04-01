import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/binary/binary.dart';

/// SignDoc is the type used for generating sign bytes for SIGN_MODE_DIRECT.
class SignDoc extends CosmosMessage {
  /// body_bytes is protobuf serialization of a TxBody that matches the
  /// representation in TxRaw.
  final List<int> bodyBytes;

  /// auth_info_bytes is a protobuf serialization of an AuthInfo that matches the
  /// representation in TxRaw.
  final List<int> authInfoBytes;

  /// chain_id is the unique identifier of the chain this transaction targets.
  /// It prevents signed transactions from being used on another chain by an
  /// attacker
  final String chainId;

  /// account_number is the account number of the account in state
  final BigInt accountNumber;
  SignDoc(
      {required List<int> bodyBytes,
      required List<int> authInfoBytes,
      required this.chainId,
      required this.accountNumber})
      : bodyBytes = BytesUtils.toBytes(bodyBytes, unmodifiable: true),
        authInfoBytes = BytesUtils.toBytes(authInfoBytes, unmodifiable: true);
  factory SignDoc.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);

    return SignDoc(
        bodyBytes: decode.getField(1),
        authInfoBytes: decode.getField(2),
        chainId: decode.getField(3),
        accountNumber: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "body_bytes": BytesUtils.toHexString(bodyBytes),
      "auth_info_bytes": BytesUtils.toHexString(authInfoBytes),
      "chain_id": chainId,
      "account_number": accountNumber.toString()
    };
  }

  @override
  List get values => [bodyBytes, authInfoBytes, chainId, accountNumber];
  @override
  String get typeUrl => TxV1beta1Types.signDoc.typeUrl;
}
