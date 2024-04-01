import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// TxBody is the body of a transaction that all signers sign over.
class TXBody extends CosmosMessage {
  /// messages is a list of messages to be executed. The required signers of
  /// those messages define the number and order of elements in AuthInfo's
  /// signer_infos and Tx's signatures. Each required signer address is added to
  /// the list only the first time it occurs.
  /// By convention, the first required signer (usually from the first message)
  /// is referred to as the primary signer and pays the fee for the whole
  /// transaction.
  final List<CosmosMessage> messages;

  /// memo is any arbitrary note/comment to be added to the transaction.
  /// WARNING: in clients, any publicly exposed text should not be called memo,
  /// but should be called `note` instead (see
  /// https://github.com/cosmos/cosmos-sdk/issues/9122).
  final String? memo;

  /// timeout_height is the block height after which this transaction will not
  /// be processed by the chain.
  ///
  /// Note, if unordered=true this value MUST be set
  /// and will act as a short-lived TTL in which the transaction is deemed valid
  /// and kept in memory to prevent duplicates.
  final BigInt? timeoutHeight;

  /// unordered, when set to true, indicates that the transaction signer(s)
  /// intend for the transaction to be evaluated and executed in an un-ordered
  /// fashion. Specifically, the account's nonce will NOT be checked or
  /// incremented, which allows for fire-and-forget as well as concurrent
  /// transaction execution.
  ///
  /// Note, when set to true, the existing 'timeout_height' value must be set and
  /// will be used to correspond to a height in which the transaction is deemed
  /// valid.
  final bool? unordered;

  /// extension_options are arbitrary options that can be added by chains
  /// when the default options are not sufficient. If any of these are present
  /// and can't be handled, the transaction will be rejected
  final List<Any> extensionOptions;

  /// extension_options are arbitrary options that can be added by chains
  /// when the default options are not sufficient. If any of these are present
  /// and can't be handled, they will be ignored
  final List<Any> nonCriticalExtensionOptions;
  const TXBody(
      {required this.messages,
      this.memo,
      this.timeoutHeight,
      this.unordered,
      this.extensionOptions = const [],
      this.nonCriticalExtensionOptions = const []});
  factory TXBody.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    final anys = decode
        .getFileds<List<int>>(1)
        .map((e) => Any.deserialize(e))
        .toList()
        .map((e) => AnyMessage(e))
        .toList();
    return TXBody(messages: anys);
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 1023, 2047];

  @override
  Map<String, dynamic> toJson() {
    return {
      "messages": messages.map((e) => e.toJson()).toList(),
      "memo": memo,
      "timeout_height": timeoutHeight?.toString(),
      "unordered": unordered,
      "extension_options": extensionOptions.map((e) => e.toJson()).toList(),
      "non_critical_extension_options":
          nonCriticalExtensionOptions.map((e) => e.toJson()).toList()
    };
  }

  @override
  List get values => [
        messages.map((e) => e.toAny()).toList(),
        memo,
        timeoutHeight,
        unordered,
        extensionOptions,
        nonCriticalExtensionOptions
      ];
  @override
  String get typeUrl => TxV1beta1Types.txBody.typeUrl;
}
