import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/cosmos/tx/signing/v1beta1/src/signing.dart"
    as cosmos_tx_signing_v1beta1_signing;
import "package:cosmos_sdk/proto_messages/cosmos/crypto/multisig/v1beta1/src/multisig.dart"
    as cosmos_crypto_multisig_v1beta1_multisig;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// Tx is the standard type used for broadcasting transactions.
class Tx extends CosmosProtoMessage {
  /// body is the processable content of the transaction
  final TxBody? body;

  /// auth_info is the authorization related content of the transaction,
  /// specifically signers, signer modes and fee
  final AuthInfo? authInfo;

  /// signatures is a list of signatures that matches the length and order of
  /// AuthInfo's signer_infos to allow connecting signature meta information like
  /// public key and signing mode by position.
  final List<List<int>> signatures;

  const Tx({this.body, this.authInfo, this.signatures = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.bytes,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [body, authInfo, signatures];

  @override
  Map<String, dynamic> toJson() {
    return {
      'body': body?.toJson(),
      'auth_info': authInfo?.toJson(),
      'signatures':
          signatures
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
    };
  }

  factory Tx.fromJson(Map<String, dynamic> json) {
    return Tx(
      body: json.valueTo<TxBody?, Map<String, dynamic>>(
        key: 'body',
        parse: (v) => TxBody.fromJson(v),
        acceptCamelCase: true,
      ),
      authInfo: json.valueTo<AuthInfo?, Map<String, dynamic>>(
        key: 'auth_info',
        parse: (v) => AuthInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      signatures:
          (json.valueEnsureAsList<dynamic>('signatures', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
    );
  }

  factory Tx.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Tx(
      body: decode.messageTo<TxBody?>(1, (b) => TxBody.deserialize(b)),
      authInfo: decode.messageTo<AuthInfo?>(2, (b) => AuthInfo.deserialize(b)),
      signatures: decode.getListOfBytes(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1Tx;
}

/// TxRaw is a variant of Tx that pins the signer's exact binary representation
/// of body and auth_info. This is used for signing, broadcasting and
/// verification. The binary `serialize(tx: TxRaw)` is stored in Tendermint and
/// the hash `sha256(serialize(tx: TxRaw))` becomes the "txhash", commonly used
/// as the transaction ID.
class TxRaw extends CosmosProtoMessage {
  /// body_bytes is a protobuf serialization of a TxBody that matches the
  /// representation in SignDoc.
  final List<int>? bodyBytes;

  /// auth_info_bytes is a protobuf serialization of an AuthInfo that matches the
  /// representation in SignDoc.
  final List<int>? authInfoBytes;

  /// signatures is a list of signatures that matches the length and order of
  /// AuthInfo's signer_infos to allow connecting signature meta information like
  /// public key and signing mode by position.
  final List<List<int>> signatures;

  const TxRaw({this.bodyBytes, this.authInfoBytes, this.signatures = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.bytes,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [bodyBytes, authInfoBytes, signatures];

  @override
  Map<String, dynamic> toJson() {
    return {
      'body_bytes': switch (bodyBytes) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'auth_info_bytes': switch (authInfoBytes) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'signatures':
          signatures
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
    };
  }

  factory TxRaw.fromJson(Map<String, dynamic> json) {
    return TxRaw(
      bodyBytes: json.valueAsBytes<List<int>?>(
        'body_bytes',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      authInfoBytes: json.valueAsBytes<List<int>?>(
        'auth_info_bytes',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      signatures:
          (json.valueEnsureAsList<dynamic>('signatures', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
    );
  }

  factory TxRaw.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TxRaw(
      bodyBytes: decode.getBytes<List<int>?>(1),
      authInfoBytes: decode.getBytes<List<int>?>(2),
      signatures: decode.getListOfBytes(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1TxRaw;
}

/// SignDoc is the type used for generating sign bytes for SIGN_MODE_DIRECT.
class SignDoc extends CosmosProtoMessage {
  /// body_bytes is protobuf serialization of a TxBody that matches the
  /// representation in TxRaw.
  final List<int>? bodyBytes;

  /// auth_info_bytes is a protobuf serialization of an AuthInfo that matches the
  /// representation in TxRaw.
  final List<int>? authInfoBytes;

  /// chain_id is the unique identifier of the chain this transaction targets.
  /// It prevents signed transactions from being used on another chain by an
  /// attacker
  final String? chainId;

  /// account_number is the account number of the account in state
  final BigInt? accountNumber;

  const SignDoc({
    this.bodyBytes,
    this.authInfoBytes,
    this.chainId,
    this.accountNumber,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.uint64(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    bodyBytes,
    authInfoBytes,
    chainId,
    accountNumber,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'body_bytes': switch (bodyBytes) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'auth_info_bytes': switch (authInfoBytes) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'chain_id': chainId,
      'account_number': accountNumber?.toString(),
    };
  }

  factory SignDoc.fromJson(Map<String, dynamic> json) {
    return SignDoc(
      bodyBytes: json.valueAsBytes<List<int>?>(
        'body_bytes',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      authInfoBytes: json.valueAsBytes<List<int>?>(
        'auth_info_bytes',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      accountNumber: json.valueAsBigInt<BigInt?>(
        'account_number',
        acceptCamelCase: true,
      ),
    );
  }

  factory SignDoc.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SignDoc(
      bodyBytes: decode.getBytes<List<int>?>(1),
      authInfoBytes: decode.getBytes<List<int>?>(2),
      chainId: decode.getString<String?>(3),
      accountNumber: decode.getBigInt<BigInt?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1SignDoc;
}

/// SignDocDirectAux is the type used for generating sign bytes for
/// SIGN_MODE_DIRECT_AUX.
class SignDocDirectAux extends CosmosProtoMessage {
  /// body_bytes is protobuf serialization of a TxBody that matches the
  /// representation in TxRaw.
  final List<int>? bodyBytes;

  /// public_key is the public key of the signing account.
  final google_protobuf_any.Any? publicKey;

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

  const SignDocDirectAux({
    this.bodyBytes,
    this.publicKey,
    this.chainId,
    this.accountNumber,
    this.sequence,
    this.tip,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.uint64(5),
        ProtoFieldConfig.message(
          6,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    bodyBytes,
    publicKey,
    chainId,
    accountNumber,
    sequence,
    tip,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'body_bytes': switch (bodyBytes) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'public_key': publicKey?.toJson(),
      'chain_id': chainId,
      'account_number': accountNumber?.toString(),
      'sequence': sequence?.toString(),
      'tip': tip?.toJson(),
    };
  }

  factory SignDocDirectAux.fromJson(Map<String, dynamic> json) {
    return SignDocDirectAux(
      bodyBytes: json.valueAsBytes<List<int>?>(
        'body_bytes',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      publicKey: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'public_key',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      accountNumber: json.valueAsBigInt<BigInt?>(
        'account_number',
        acceptCamelCase: true,
      ),
      sequence: json.valueAsBigInt<BigInt?>('sequence', acceptCamelCase: true),
      tip: json.valueTo<Tip?, Map<String, dynamic>>(
        key: 'tip',
        parse: (v) => Tip.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory SignDocDirectAux.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SignDocDirectAux(
      bodyBytes: decode.getBytes<List<int>?>(1),
      publicKey: decode.messageTo<google_protobuf_any.Any?>(
        2,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      chainId: decode.getString<String?>(3),
      accountNumber: decode.getBigInt<BigInt?>(4),
      sequence: decode.getBigInt<BigInt?>(5),
      tip: decode.messageTo<Tip?>(6, (b) => Tip.deserialize(b)),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1SignDocDirectAux;
}

/// TxBody is the body of a transaction that all signers sign over.
class TxBody extends CosmosProtoMessage {
  /// messages is a list of messages to be executed. The required signers of
  /// those messages define the number and order of elements in AuthInfo's
  /// signer_infos and Tx's signatures. Each required signer address is added to
  /// the list only the first time it occurs.
  /// By convention, the first required signer (usually from the first message)
  /// is referred to as the primary signer and pays the fee for the whole
  /// transaction.
  final List<google_protobuf_any.Any> messages;

  /// memo is any arbitrary note/comment to be added to the transaction.
  /// WARNING: in clients, any publicly exposed text should not be called memo,
  /// but should be called `note` instead (see
  /// https://github.com/cosmos/cosmos-sdk/issues/9122).
  final String? memo;

  /// timeout_height is the block height after which this transaction will not
  /// be processed by the chain.
  final BigInt? timeoutHeight;

  /// unordered, when set to true, indicates that the transaction signer(s)
  /// intend for the transaction to be evaluated and executed in an un-ordered
  /// fashion. Specifically, the account's nonce will NOT be checked or
  /// incremented, which allows for fire-and-forget as well as concurrent
  /// transaction execution.
  ///
  /// Note, when set to true, the existing 'timeout_timestamp' value must
  /// be set and will be used to correspond to a timestamp in which the transaction is deemed
  /// valid.
  ///
  /// When true, the sequence value MUST be 0, and any transaction with unordered=true and a non-zero sequence value will
  /// be rejected.
  /// External services that make assumptions about sequence values may need to be updated because of this.
  final bool? unordered;

  /// timeout_timestamp is the block time after which this transaction will not
  /// be processed by the chain.
  ///
  /// Note, if unordered=true this value MUST be set
  /// and will act as a short-lived TTL in which the transaction is deemed valid
  /// and kept in memory to prevent duplicates.
  final google_protobuf_timestamp.Timestamp? timeoutTimestamp;

  /// extension_options are arbitrary options that can be added by chains
  /// when the default options are not sufficient. If any of these are present
  /// and can't be handled, the transaction will be rejected
  final List<google_protobuf_any.Any> extensionOptions;

  /// extension_options are arbitrary options that can be added by chains
  /// when the default options are not sufficient. If any of these are present
  /// and can't be handled, they will be ignored
  final List<google_protobuf_any.Any> nonCriticalExtensionOptions;

  const TxBody({
    this.messages = const [],
    this.memo,
    this.timeoutHeight,
    this.unordered,
    this.timeoutTimestamp,
    this.extensionOptions = const [],
    this.nonCriticalExtensionOptions = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.bool(
          4,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.53",
            ),
          ],
        ),
        ProtoFieldConfig.message(
          5,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.53",
            ),
          ],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 1023,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2047,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    messages,
    memo,
    timeoutHeight,
    unordered,
    timeoutTimestamp,
    extensionOptions,
    nonCriticalExtensionOptions,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'messages': messages.map((e) => e.toJson()).toList(),
      'memo': memo,
      'timeout_height': timeoutHeight?.toString(),
      'unordered': unordered,
      'timeout_timestamp': timeoutTimestamp?.toRfc3339(),
      'extension_options': extensionOptions.map((e) => e.toJson()).toList(),
      'non_critical_extension_options':
          nonCriticalExtensionOptions.map((e) => e.toJson()).toList(),
    };
  }

  factory TxBody.fromJson(Map<String, dynamic> json) {
    return TxBody(
      messages:
          (json.valueEnsureAsList<dynamic>('messages', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  google_protobuf_any.Any,
                  Map<String, dynamic>
                >(value: e, parse: (v) => google_protobuf_any.Any.fromJson(v)),
              )
              .toList(),
      memo: json.valueAsString<String?>('memo', acceptCamelCase: true),
      timeoutHeight: json.valueAsBigInt<BigInt?>(
        'timeout_height',
        acceptCamelCase: true,
      ),
      unordered: json.valueAsBool<bool?>('unordered', acceptCamelCase: true),
      timeoutTimestamp: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'timeout_timestamp',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
      extensionOptions:
          (json.valueEnsureAsList<dynamic>(
                'extension_options',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  google_protobuf_any.Any,
                  Map<String, dynamic>
                >(value: e, parse: (v) => google_protobuf_any.Any.fromJson(v)),
              )
              .toList(),
      nonCriticalExtensionOptions:
          (json.valueEnsureAsList<dynamic>(
                'non_critical_extension_options',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  google_protobuf_any.Any,
                  Map<String, dynamic>
                >(value: e, parse: (v) => google_protobuf_any.Any.fromJson(v)),
              )
              .toList(),
    );
  }

  factory TxBody.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TxBody(
      messages:
          decode
              .getListOfBytes(1)
              .map((b) => google_protobuf_any.Any.deserialize(b))
              .toList(),
      memo: decode.getString<String?>(2),
      timeoutHeight: decode.getBigInt<BigInt?>(3),
      unordered: decode.getBool<bool?>(4),
      timeoutTimestamp: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        5,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      extensionOptions:
          decode
              .getListOfBytes(1023)
              .map((b) => google_protobuf_any.Any.deserialize(b))
              .toList(),
      nonCriticalExtensionOptions:
          decode
              .getListOfBytes(2047)
              .map((b) => google_protobuf_any.Any.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1TxBody;
}

/// AuthInfo describes the fee and signer modes that are used to sign a
/// transaction.
class AuthInfo extends CosmosProtoMessage {
  /// signer_infos defines the signing modes for the required signers. The number
  /// and order of elements must match the required signers from TxBody's
  /// messages. The first element is the primary signer and the one which pays
  /// the fee.
  final List<SignerInfo> signerInfos;

  /// Fee is the fee and gas limit for the transaction. The first signer is the
  /// primary signer and the one which pays the fee. The fee can be calculated
  /// based on the cost of evaluating the body and doing signature verification
  /// of the signers. This can be estimated via simulation.
  final Fee? fee;

  /// Tip is the optional tip used for transactions fees paid in another denom.
  ///
  /// This field is ignored if the chain didn't enable tips, i.e. didn't add the
  /// `TipDecorator` in its posthandler.
  final Tip? tip;

  const AuthInfo({this.signerInfos = const [], this.fee, this.tip});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.message(
          3,
          options: [
            ProtoOptionBool(name: "deprecated", value: true),
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.46",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [signerInfos, fee, tip];

  @override
  Map<String, dynamic> toJson() {
    return {
      'signer_infos': signerInfos.map((e) => e.toJson()).toList(),
      'fee': fee?.toJson(),
      'tip': tip?.toJson(),
    };
  }

  factory AuthInfo.fromJson(Map<String, dynamic> json) {
    return AuthInfo(
      signerInfos:
          (json.valueEnsureAsList<dynamic>(
                'signer_infos',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<SignerInfo, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => SignerInfo.fromJson(v),
                ),
              )
              .toList(),
      fee: json.valueTo<Fee?, Map<String, dynamic>>(
        key: 'fee',
        parse: (v) => Fee.fromJson(v),
        acceptCamelCase: true,
      ),
      tip: json.valueTo<Tip?, Map<String, dynamic>>(
        key: 'tip',
        parse: (v) => Tip.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory AuthInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AuthInfo(
      signerInfos:
          decode
              .getListOfBytes(1)
              .map((b) => SignerInfo.deserialize(b))
              .toList(),
      fee: decode.messageTo<Fee?>(2, (b) => Fee.deserialize(b)),
      tip: decode.messageTo<Tip?>(3, (b) => Tip.deserialize(b)),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1AuthInfo;
}

/// SignerInfo describes the public key and signing mode of a single top-level
/// signer.
class SignerInfo extends CosmosProtoMessage {
  /// public_key is the public key of the signer. It is optional for accounts
  /// that already exist in state. If unset, the verifier can use the required \
  /// signer address for this position and lookup the public key.
  final google_protobuf_any.Any? publicKey;

  /// mode_info describes the signing mode of the signer and is a nested
  /// structure to support nested multisig pubkey's
  final ModeInfo? modeInfo;

  /// sequence is the sequence of the account, which describes the
  /// number of committed transactions signed by a given address. It is used to
  /// prevent replay attacks.
  final BigInt? sequence;

  const SignerInfo({this.publicKey, this.modeInfo, this.sequence});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [publicKey, modeInfo, sequence];

  @override
  Map<String, dynamic> toJson() {
    return {
      'public_key': publicKey?.toJson(),
      'mode_info': modeInfo?.toJson(),
      'sequence': sequence?.toString(),
    };
  }

  factory SignerInfo.fromJson(Map<String, dynamic> json) {
    return SignerInfo(
      publicKey: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'public_key',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
      modeInfo: json.valueTo<ModeInfo?, Map<String, dynamic>>(
        key: 'mode_info',
        parse: (v) => ModeInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      sequence: json.valueAsBigInt<BigInt?>('sequence', acceptCamelCase: true),
    );
  }

  factory SignerInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SignerInfo(
      publicKey: decode.messageTo<google_protobuf_any.Any?>(
        1,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      modeInfo: decode.messageTo<ModeInfo?>(2, (b) => ModeInfo.deserialize(b)),
      sequence: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1SignerInfo;
}

/// ModeInfo describes the signing mode of a single or nested multisig signer.
class ModeInfo extends CosmosProtoMessage {
  /// sum is the oneof that specifies whether this represents a single or nested
  /// multisig signer
  /// single represents a single signer
  final ModeInfoSingle? single;

  /// multi represents a nested multisig signer
  final ModeInfoMulti? multi;

  const ModeInfo({this.single, this.multi});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [single, multi];

  @override
  Map<String, dynamic> toJson() {
    return {'single': single?.toJson(), 'multi': multi?.toJson()};
  }

  factory ModeInfo.fromJson(Map<String, dynamic> json) {
    return ModeInfo(
      single: json.valueTo<ModeInfoSingle?, Map<String, dynamic>>(
        key: 'single',
        parse: (v) => ModeInfoSingle.fromJson(v),
        acceptCamelCase: true,
      ),
      multi: json.valueTo<ModeInfoMulti?, Map<String, dynamic>>(
        key: 'multi',
        parse: (v) => ModeInfoMulti.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory ModeInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ModeInfo(
      single: decode.messageTo<ModeInfoSingle?>(
        1,
        (b) => ModeInfoSingle.deserialize(b),
      ),
      multi: decode.messageTo<ModeInfoMulti?>(
        2,
        (b) => ModeInfoMulti.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1ModeInfo;
}

/// Single is the mode info for a single signer. It is structured as a message
/// to allow for additional fields such as locale for SIGN_MODE_TEXTUAL in the
/// future
class ModeInfoSingle extends CosmosProtoMessage {
  /// mode is the signing mode of the single signer
  final cosmos_tx_signing_v1beta1_signing.SignMode? mode;

  const ModeInfoSingle({this.mode});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.enumType(1)],
    );
  }

  @override
  List<Object?> get protoValues => [mode];

  @override
  Map<String, dynamic> toJson() {
    return {'mode': mode?.protoName};
  }

  factory ModeInfoSingle.fromJson(Map<String, dynamic> json) {
    return ModeInfoSingle(
      mode: json.valueTo<cosmos_tx_signing_v1beta1_signing.SignMode?, Object?>(
        key: 'mode',
        parse: (v) => cosmos_tx_signing_v1beta1_signing.SignMode.from(v),
      ),
    );
  }

  factory ModeInfoSingle.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ModeInfoSingle(
      mode: decode.getEnum<cosmos_tx_signing_v1beta1_signing.SignMode?>(
        1,
        cosmos_tx_signing_v1beta1_signing.SignMode.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1ModeInfoSingle;
}

/// Multi is the mode info for a multisig public key
class ModeInfoMulti extends CosmosProtoMessage {
  /// bitarray specifies which keys within the multisig are signing
  final cosmos_crypto_multisig_v1beta1_multisig.CompactBitArray? bitarray;

  /// mode_infos is the corresponding modes of the signers of the multisig
  /// which could include nested multisig public keys
  final List<ModeInfo> modeInfos;

  const ModeInfoMulti({this.bitarray, this.modeInfos = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [bitarray, modeInfos];

  @override
  Map<String, dynamic> toJson() {
    return {
      'bitarray': bitarray?.toJson(),
      'mode_infos': modeInfos.map((e) => e.toJson()).toList(),
    };
  }

  factory ModeInfoMulti.fromJson(Map<String, dynamic> json) {
    return ModeInfoMulti(
      bitarray: json.valueTo<
        cosmos_crypto_multisig_v1beta1_multisig.CompactBitArray?,
        Map<String, dynamic>
      >(
        key: 'bitarray',
        parse:
            (v) => cosmos_crypto_multisig_v1beta1_multisig
                .CompactBitArray.fromJson(v),
        acceptCamelCase: true,
      ),
      modeInfos:
          (json.valueEnsureAsList<dynamic>('mode_infos', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<ModeInfo, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => ModeInfo.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory ModeInfoMulti.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ModeInfoMulti(
      bitarray: decode
          .messageTo<cosmos_crypto_multisig_v1beta1_multisig.CompactBitArray?>(
            1,
            (b) => cosmos_crypto_multisig_v1beta1_multisig
                .CompactBitArray.deserialize(b),
          ),
      modeInfos:
          decode.getListOfBytes(2).map((b) => ModeInfo.deserialize(b)).toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1ModeInfoMulti;
}

/// Fee includes the amount of coins paid in fees and the maximum
/// gas to be used by the transaction. The ratio yields an effective "gasprice",
/// which must be above some minimum to be accepted into the mempool.
class Fee extends CosmosProtoMessage {
  /// amount is the amount of coins to be paid as a fee
  final List<cosmos_base_v1beta1_coin.Coin> amount;

  /// gas_limit is the maximum gas that can be used in transaction processing
  /// before an out of gas error occurs
  final BigInt? gasLimit;

  /// if unset, the first signer is responsible for paying the fees. If set, the
  /// specified account must pay the fees. the payer must be a tx signer (and
  /// thus have signed this field in AuthInfo). setting this field does *not*
  /// change the ordering of required signers for the transaction.
  final String? payer;

  /// if set, the fee payer (either the first signer or the value of the payer
  /// field) requests that a fee grant be used to pay fees instead of the fee
  /// payer's own balance. If an appropriate fee grant does not exist or the
  /// chain does not support fee grants, this will fail
  final String? granter;

  const Fee({this.amount = const [], this.gasLimit, this.payer, this.granter});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [amount, gasLimit, payer, granter];

  @override
  Map<String, dynamic> toJson() {
    return {
      'amount': amount.map((e) => e.toJson()).toList(),
      'gas_limit': gasLimit?.toString(),
      'payer': payer,
      'granter': granter,
    };
  }

  factory Fee.fromJson(Map<String, dynamic> json) {
    return Fee(
      amount:
          (json.valueEnsureAsList<dynamic>('amount', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
      gasLimit: json.valueAsBigInt<BigInt?>('gas_limit', acceptCamelCase: true),
      payer: json.valueAsString<String?>('payer', acceptCamelCase: true),
      granter: json.valueAsString<String?>('granter', acceptCamelCase: true),
    );
  }

  factory Fee.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Fee(
      amount:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      gasLimit: decode.getBigInt<BigInt?>(2),
      payer: decode.getString<String?>(3),
      granter: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1Fee;
}

/// Tip is the tip used for meta-transactions.
class Tip extends CosmosProtoMessage {
  /// amount is the amount of the tip
  final List<cosmos_base_v1beta1_coin.Coin> amount;

  /// tipper is the address of the account paying for the tip
  final String? tipper;

  const Tip({this.amount = const [], this.tipper});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionBool(name: "deprecated", value: true)],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [amount, tipper];

  @override
  Map<String, dynamic> toJson() {
    return {'amount': amount.map((e) => e.toJson()).toList(), 'tipper': tipper};
  }

  factory Tip.fromJson(Map<String, dynamic> json) {
    return Tip(
      amount:
          (json.valueEnsureAsList<dynamic>('amount', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
      tipper: json.valueAsString<String?>('tipper', acceptCamelCase: true),
    );
  }

  factory Tip.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Tip(
      amount:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      tipper: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1Tip;
}

/// AuxSignerData is the intermediary format that an auxiliary signer (e.g. a
/// tipper) builds and sends to the fee payer (who will build and broadcast the
/// actual tx). AuxSignerData is not a valid tx in itself, and will be rejected
/// by the node if sent directly as-is.
class AuxSignerData extends CosmosProtoMessage {
  /// address is the bech32-encoded address of the auxiliary signer. If using
  /// AuxSignerData across different chains, the bech32 prefix of the target
  /// chain (where the final transaction is broadcasted) should be used.
  final String? address;

  /// sign_doc is the SIGN_MODE_DIRECT_AUX sign doc that the auxiliary signer
  /// signs. Note: we use the same sign doc even if we're signing with
  /// LEGACY_AMINO_JSON.
  final SignDocDirectAux? signDoc;

  /// mode is the signing mode of the single signer.
  final cosmos_tx_signing_v1beta1_signing.SignMode? mode;

  /// sig is the signature of the sign doc.
  final List<int>? sig;

  const AuxSignerData({this.address, this.signDoc, this.mode, this.sig});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.enumType(3),
        ProtoFieldConfig.bytes(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, signDoc, mode, sig];

  @override
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'sign_doc': signDoc?.toJson(),
      'mode': mode?.protoName,
      'sig': switch (sig) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory AuxSignerData.fromJson(Map<String, dynamic> json) {
    return AuxSignerData(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      signDoc: json.valueTo<SignDocDirectAux?, Map<String, dynamic>>(
        key: 'sign_doc',
        parse: (v) => SignDocDirectAux.fromJson(v),
        acceptCamelCase: true,
      ),
      mode: json.valueTo<cosmos_tx_signing_v1beta1_signing.SignMode?, Object?>(
        key: 'mode',
        parse: (v) => cosmos_tx_signing_v1beta1_signing.SignMode.from(v),
      ),
      sig: json.valueAsBytes<List<int>?>(
        'sig',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory AuxSignerData.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AuxSignerData(
      address: decode.getString<String?>(1),
      signDoc: decode.messageTo<SignDocDirectAux?>(
        2,
        (b) => SignDocDirectAux.deserialize(b),
      ),
      mode: decode.getEnum<cosmos_tx_signing_v1beta1_signing.SignMode?>(
        3,
        cosmos_tx_signing_v1beta1_signing.SignMode.values,
      ),
      sig: decode.getBytes<List<int>?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1AuxSignerData;
}
