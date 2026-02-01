import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/messages/tip.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// SignDocDirectAux is the type used for generating sign bytes for SIGN_MODE_DIRECT_AUX.
///
/// Since: cosmos-sdk 0.46
class SignDocDirectAux extends CosmosMessage {
  /// body_bytes is protobuf serialization of a TxBody that matches the
  /// representation in TxRaw.
  final List<int>? bodyBytes;

  /// public_key is the public key of the signing account.
  final Any? publicKey;

  /// chain_id is the identifier of the chain this transaction targets.
  /// It prevents signed transactions from being used on another chain by an
  /// attacker.
  final String? chainId;

  /// account_number is the account number of the account in state.
  final BigInt? accountNumber;

  /// sequence is the sequence number of the signing account.
  final BigInt? sequence;

  /// tips have been deprecated and should not be used
  final Tip? tip;
  SignDocDirectAux({
    List<int>? bodyBytes,
    this.publicKey,
    this.chainId,
    this.accountNumber,
    this.sequence,
    this.tip,
  }) : bodyBytes = BytesUtils.tryToBytes(bodyBytes, unmodifiable: true);
  factory SignDocDirectAux.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SignDocDirectAux(
      bodyBytes: decode.getField(1),
      publicKey: decode
          .getResult(2)
          ?.to<Any, List<int>>((e) => Any.deserialize(e)),
      accountNumber: decode.getField(4),
      chainId: decode.getField(3),
      sequence: decode.getField(5),
      tip: decode.getResult(6)?.to<Tip, List<int>>((e) => Tip.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "body_bytes": BytesUtils.tryToHexString(bodyBytes),
      "public_key": publicKey?.toJson(),
      "chain_id": chainId,
      "account_number": accountNumber?.toString(),
      "sequence": sequence?.toString(),
      "tip": tip?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => TxV1beta1Types.signDocDirectAux;

  @override
  List get values => [
    bodyBytes,
    publicKey,
    chainId,
    accountNumber,
    sequence,
    tip,
  ];
}
