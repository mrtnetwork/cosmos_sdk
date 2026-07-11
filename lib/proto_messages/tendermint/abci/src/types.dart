import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/tendermint/types/src/params.dart"
    as tendermint_types_params;
import "package:cosmos_sdk/proto_messages/tendermint/crypto/src/proof.dart"
    as tendermint_crypto_proof;
import "package:cosmos_sdk/proto_messages/tendermint/crypto/src/keys.dart"
    as tendermint_crypto_keys;
import "package:cosmos_sdk/proto_messages/tendermint/types/src/validator.dart"
    as tendermint_types_validator;

enum CheckTxType implements ProtoEnumVariant {
  new_(0, 'NEW'),
  recheck(1, 'RECHECK');

  const CheckTxType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static CheckTxType fromValue(int? value) {
    return CheckTxType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () => throw ItemNotFoundException(name: "CheckTxType", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static CheckTxType from(Object? value) {
    return CheckTxType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () => throw ItemNotFoundException(name: "CheckTxType", value: value),
    );
  }
}

enum ResponseOfferSnapshotResult implements ProtoEnumVariant {
  unknown(0, 'UNKNOWN'),

  /// Unknown result, abort all snapshot restoration
  accept(1, 'ACCEPT'),

  /// Snapshot accepted, apply chunks
  abort(2, 'ABORT'),

  /// Abort all snapshot restoration
  reject(3, 'REJECT'),

  /// Reject this specific snapshot, try others
  rejectFormat(4, 'REJECT_FORMAT'),

  /// Reject all snapshots of this format, try others
  rejectSender(5, 'REJECT_SENDER');

  const ResponseOfferSnapshotResult(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static ResponseOfferSnapshotResult fromValue(int? value) {
    return ResponseOfferSnapshotResult.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "ResponseOfferSnapshotResult",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static ResponseOfferSnapshotResult from(Object? value) {
    return ResponseOfferSnapshotResult.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "ResponseOfferSnapshotResult",
                value: value,
              ),
    );
  }
}

/// Chunk senders to reject and ban
enum ResponseApplySnapshotChunkResult implements ProtoEnumVariant {
  unknown(0, 'UNKNOWN'),

  /// Unknown result, abort all snapshot restoration
  accept(1, 'ACCEPT'),

  /// Chunk successfully accepted
  abort(2, 'ABORT'),

  /// Abort all snapshot restoration
  retry(3, 'RETRY'),

  /// Retry chunk (combine with refetch and reject)
  retrySnapshot(4, 'RETRY_SNAPSHOT'),

  /// Retry snapshot (combine with refetch and reject)
  rejectSnapshot(5, 'REJECT_SNAPSHOT');

  const ResponseApplySnapshotChunkResult(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static ResponseApplySnapshotChunkResult fromValue(int? value) {
    return ResponseApplySnapshotChunkResult.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "ResponseApplySnapshotChunkResult",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static ResponseApplySnapshotChunkResult from(Object? value) {
    return ResponseApplySnapshotChunkResult.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "ResponseApplySnapshotChunkResult",
                value: value,
              ),
    );
  }
}

enum ResponseProcessProposalProposalStatus implements ProtoEnumVariant {
  unknown(0, 'UNKNOWN'),
  accept(1, 'ACCEPT'),
  reject(2, 'REJECT');

  const ResponseProcessProposalProposalStatus(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static ResponseProcessProposalProposalStatus fromValue(int? value) {
    return ResponseProcessProposalProposalStatus.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "ResponseProcessProposalProposalStatus",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static ResponseProcessProposalProposalStatus from(Object? value) {
    return ResponseProcessProposalProposalStatus.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "ResponseProcessProposalProposalStatus",
                value: value,
              ),
    );
  }
}

enum ResponseVerifyVoteExtensionVerifyStatus implements ProtoEnumVariant {
  unknown(0, 'UNKNOWN'),
  accept(1, 'ACCEPT'),

  /// Rejecting the vote extension will reject the entire precommit by the sender.
  /// Incorrectly implementing this thus has liveness implications as it may affect
  /// CometBFT's ability to receive 2/3+ valid votes to finalize the block.
  /// Honest nodes should never be rejected.
  reject(2, 'REJECT');

  const ResponseVerifyVoteExtensionVerifyStatus(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static ResponseVerifyVoteExtensionVerifyStatus fromValue(int? value) {
    return ResponseVerifyVoteExtensionVerifyStatus.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "ResponseVerifyVoteExtensionVerifyStatus",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static ResponseVerifyVoteExtensionVerifyStatus from(Object? value) {
    return ResponseVerifyVoteExtensionVerifyStatus.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "ResponseVerifyVoteExtensionVerifyStatus",
                value: value,
              ),
    );
  }
}

/// signed_last_block
enum MisbehaviorType implements ProtoEnumVariant {
  unknown(0, 'UNKNOWN'),
  duplicateVote(1, 'DUPLICATE_VOTE'),
  lightClientAttack(2, 'LIGHT_CLIENT_ATTACK');

  const MisbehaviorType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static MisbehaviorType fromValue(int? value) {
    return MisbehaviorType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "MisbehaviorType",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static MisbehaviorType from(Object? value) {
    return MisbehaviorType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "MisbehaviorType",
                value: value,
              ),
    );
  }
}

/// SetOption, BeginBlock, DeliverTx, EndBlock
class RequestEcho extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<ResponseEcho> {
  final String? message;

  const RequestEcho({this.message});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [message];

  @override
  Map<String, dynamic> toJson() {
    return {'message': message};
  }

  factory RequestEcho.fromJson(Map<String, dynamic> json) {
    return RequestEcho(
      message: json.valueAsString<String?>('message', acceptCamelCase: true),
    );
  }

  factory RequestEcho.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RequestEcho(message: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciRequestEcho;
  @override
  ResponseEcho onServiceResponse(List<int> bytes) {
    return ResponseEcho.deserialize(bytes);
  }

  @override
  ResponseEcho onServiceResponseJson(Map<String, dynamic> json) {
    return ResponseEcho.fromJson(json);
  }
}

class RequestFlush extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<ResponseFlush> {
  const RequestFlush();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory RequestFlush.fromJson(Map<String, dynamic> json) {
    return RequestFlush();
  }

  factory RequestFlush.deserialize(List<int> bytes) {
    return RequestFlush();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciRequestFlush;
  @override
  ResponseFlush onServiceResponse(List<int> bytes) {
    return ResponseFlush.deserialize(bytes);
  }

  @override
  ResponseFlush onServiceResponseJson(Map<String, dynamic> json) {
    return ResponseFlush.fromJson(json);
  }
}

class RequestInfo extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<ResponseInfo> {
  final String? version;

  final BigInt? blockVersion;

  final BigInt? p2pVersion;

  final String? abciVersion;

  const RequestInfo({
    this.version,
    this.blockVersion,
    this.p2pVersion,
    this.abciVersion,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    version,
    blockVersion,
    p2pVersion,
    abciVersion,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'block_version': blockVersion?.toString(),
      'p2p_version': p2pVersion?.toString(),
      'abci_version': abciVersion,
    };
  }

  factory RequestInfo.fromJson(Map<String, dynamic> json) {
    return RequestInfo(
      version: json.valueAsString<String?>('version', acceptCamelCase: true),
      blockVersion: json.valueAsBigInt<BigInt?>(
        'block_version',
        acceptCamelCase: true,
      ),
      p2pVersion: json.valueAsBigInt<BigInt?>(
        'p2p_version',
        acceptCamelCase: true,
      ),
      abciVersion: json.valueAsString<String?>(
        'abci_version',
        acceptCamelCase: true,
      ),
    );
  }

  factory RequestInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RequestInfo(
      version: decode.getString<String?>(1),
      blockVersion: decode.getBigInt<BigInt?>(2),
      p2pVersion: decode.getBigInt<BigInt?>(3),
      abciVersion: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciRequestInfo;
  @override
  ResponseInfo onServiceResponse(List<int> bytes) {
    return ResponseInfo.deserialize(bytes);
  }

  @override
  ResponseInfo onServiceResponseJson(Map<String, dynamic> json) {
    return ResponseInfo.fromJson(json);
  }
}

class RequestInitChain extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<ResponseInitChain> {
  final google_protobuf_timestamp.Timestamp? time;

  final String? chainId;

  final tendermint_types_params.ConsensusParams? consensusParams;

  final List<ValidatorUpdate> validators;

  final List<int>? appStateBytes;

  final BigInt? initialHeight;

  const RequestInitChain({
    this.time,
    this.chainId,
    this.consensusParams,
    this.validators = const [],
    this.appStateBytes,
    this.initialHeight,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.bytes(5),
        ProtoFieldConfig.int64(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    time,
    chainId,
    consensusParams,
    validators,
    appStateBytes,
    initialHeight,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'time': time?.toRfc3339(),
      'chain_id': chainId,
      'consensus_params': consensusParams?.toJson(),
      'validators': validators.map((e) => e.toJson()).toList(),
      'app_state_bytes': switch (appStateBytes) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'initial_height': initialHeight?.toString(),
    };
  }

  factory RequestInitChain.fromJson(Map<String, dynamic> json) {
    return RequestInitChain(
      time: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      consensusParams: json.valueTo<
        tendermint_types_params.ConsensusParams?,
        Map<String, dynamic>
      >(
        key: 'consensus_params',
        parse: (v) => tendermint_types_params.ConsensusParams.fromJson(v),
        acceptCamelCase: true,
      ),
      validators:
          (json.valueEnsureAsList<dynamic>('validators', acceptCamelCase: true))
              .map(
                (e) =>
                    JsonParser.valueTo<ValidatorUpdate, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => ValidatorUpdate.fromJson(v),
                    ),
              )
              .toList(),
      appStateBytes: json.valueAsBytes<List<int>?>(
        'app_state_bytes',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      initialHeight: json.valueAsBigInt<BigInt?>(
        'initial_height',
        acceptCamelCase: true,
      ),
    );
  }

  factory RequestInitChain.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RequestInitChain(
      time: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        1,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      chainId: decode.getString<String?>(2),
      consensusParams: decode
          .messageTo<tendermint_types_params.ConsensusParams?>(
            3,
            (b) => tendermint_types_params.ConsensusParams.deserialize(b),
          ),
      validators:
          decode
              .getListOfBytes(4)
              .map((b) => ValidatorUpdate.deserialize(b))
              .toList(),
      appStateBytes: decode.getBytes<List<int>?>(5),
      initialHeight: decode.getBigInt<BigInt?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciRequestInitChain;
  @override
  ResponseInitChain onServiceResponse(List<int> bytes) {
    return ResponseInitChain.deserialize(bytes);
  }

  @override
  ResponseInitChain onServiceResponseJson(Map<String, dynamic> json) {
    return ResponseInitChain.fromJson(json);
  }
}

class RequestQuery extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<ResponseQuery> {
  final List<int>? data;

  final String? path;

  final BigInt? height;

  final bool? prove;

  const RequestQuery({this.data, this.path, this.height, this.prove});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.bool(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [data, path, height, prove];

  @override
  Map<String, dynamic> toJson() {
    return {
      'data': switch (data) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'path': path,
      'height': height?.toString(),
      'prove': prove,
    };
  }

  factory RequestQuery.fromJson(Map<String, dynamic> json) {
    return RequestQuery(
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      path: json.valueAsString<String?>('path', acceptCamelCase: true),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      prove: json.valueAsBool<bool?>('prove', acceptCamelCase: true),
    );
  }

  factory RequestQuery.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RequestQuery(
      data: decode.getBytes<List<int>?>(1),
      path: decode.getString<String?>(2),
      height: decode.getBigInt<BigInt?>(3),
      prove: decode.getBool<bool?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciRequestQuery;
  @override
  ResponseQuery onServiceResponse(List<int> bytes) {
    return ResponseQuery.deserialize(bytes);
  }

  @override
  ResponseQuery onServiceResponseJson(Map<String, dynamic> json) {
    return ResponseQuery.fromJson(json);
  }
}

class RequestCheckTx extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<ResponseCheckTx> {
  final List<int>? tx;

  final CheckTxType? type;

  const RequestCheckTx({this.tx, this.type});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1), ProtoFieldConfig.enumType(2)],
    );
  }

  @override
  List<Object?> get protoValues => [tx, type];

  @override
  Map<String, dynamic> toJson() {
    return {
      'tx': switch (tx) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'type': type?.protoName,
    };
  }

  factory RequestCheckTx.fromJson(Map<String, dynamic> json) {
    return RequestCheckTx(
      tx: json.valueAsBytes<List<int>?>(
        'tx',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      type: json.valueTo<CheckTxType?, Object?>(
        key: 'type',
        parse: (v) => CheckTxType.from(v),
      ),
    );
  }

  factory RequestCheckTx.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RequestCheckTx(
      tx: decode.getBytes<List<int>?>(1),
      type: decode.getEnum<CheckTxType?>(2, CheckTxType.values),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciRequestCheckTx;
  @override
  ResponseCheckTx onServiceResponse(List<int> bytes) {
    return ResponseCheckTx.deserialize(bytes);
  }

  @override
  ResponseCheckTx onServiceResponseJson(Map<String, dynamic> json) {
    return ResponseCheckTx.fromJson(json);
  }
}

class RequestCommit extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<ResponseCommit> {
  const RequestCommit();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory RequestCommit.fromJson(Map<String, dynamic> json) {
    return RequestCommit();
  }

  factory RequestCommit.deserialize(List<int> bytes) {
    return RequestCommit();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciRequestCommit;
  @override
  ResponseCommit onServiceResponse(List<int> bytes) {
    return ResponseCommit.deserialize(bytes);
  }

  @override
  ResponseCommit onServiceResponseJson(Map<String, dynamic> json) {
    return ResponseCommit.fromJson(json);
  }
}

/// lists available snapshots
class RequestListSnapshots extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<ResponseListSnapshots> {
  const RequestListSnapshots();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory RequestListSnapshots.fromJson(Map<String, dynamic> json) {
    return RequestListSnapshots();
  }

  factory RequestListSnapshots.deserialize(List<int> bytes) {
    return RequestListSnapshots();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciRequestListSnapshots;
  @override
  ResponseListSnapshots onServiceResponse(List<int> bytes) {
    return ResponseListSnapshots.deserialize(bytes);
  }

  @override
  ResponseListSnapshots onServiceResponseJson(Map<String, dynamic> json) {
    return ResponseListSnapshots.fromJson(json);
  }
}

/// offers a snapshot to the application
class RequestOfferSnapshot extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<ResponseOfferSnapshot> {
  final Snapshot? snapshot;

  /// snapshot offered by peers
  final List<int>? appHash;

  const RequestOfferSnapshot({this.snapshot, this.appHash});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1), ProtoFieldConfig.bytes(2)],
    );
  }

  @override
  List<Object?> get protoValues => [snapshot, appHash];

  @override
  Map<String, dynamic> toJson() {
    return {
      'snapshot': snapshot?.toJson(),
      'app_hash': switch (appHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory RequestOfferSnapshot.fromJson(Map<String, dynamic> json) {
    return RequestOfferSnapshot(
      snapshot: json.valueTo<Snapshot?, Map<String, dynamic>>(
        key: 'snapshot',
        parse: (v) => Snapshot.fromJson(v),
        acceptCamelCase: true,
      ),
      appHash: json.valueAsBytes<List<int>?>(
        'app_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory RequestOfferSnapshot.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RequestOfferSnapshot(
      snapshot: decode.messageTo<Snapshot?>(1, (b) => Snapshot.deserialize(b)),
      appHash: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciRequestOfferSnapshot;
  @override
  ResponseOfferSnapshot onServiceResponse(List<int> bytes) {
    return ResponseOfferSnapshot.deserialize(bytes);
  }

  @override
  ResponseOfferSnapshot onServiceResponseJson(Map<String, dynamic> json) {
    return ResponseOfferSnapshot.fromJson(json);
  }
}

/// light client-verified app hash for snapshot height
/// loads a snapshot chunk
class RequestLoadSnapshotChunk extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<ResponseLoadSnapshotChunk> {
  final BigInt? height;

  final int? format;

  final int? chunk;

  const RequestLoadSnapshotChunk({this.height, this.format, this.chunk});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.uint32(2),
        ProtoFieldConfig.uint32(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [height, format, chunk];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height?.toString(), 'format': format, 'chunk': chunk};
  }

  factory RequestLoadSnapshotChunk.fromJson(Map<String, dynamic> json) {
    return RequestLoadSnapshotChunk(
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      format: json.valueAsInt<int?>('format', acceptCamelCase: true),
      chunk: json.valueAsInt<int?>('chunk', acceptCamelCase: true),
    );
  }

  factory RequestLoadSnapshotChunk.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RequestLoadSnapshotChunk(
      height: decode.getBigInt<BigInt?>(1),
      format: decode.getInt<int?>(2),
      chunk: decode.getInt<int?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciRequestLoadSnapshotChunk;
  @override
  ResponseLoadSnapshotChunk onServiceResponse(List<int> bytes) {
    return ResponseLoadSnapshotChunk.deserialize(bytes);
  }

  @override
  ResponseLoadSnapshotChunk onServiceResponseJson(Map<String, dynamic> json) {
    return ResponseLoadSnapshotChunk.fromJson(json);
  }
}

/// Applies a snapshot chunk
class RequestApplySnapshotChunk extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<ResponseApplySnapshotChunk> {
  final int? index;

  final List<int>? chunk;

  final String? sender;

  const RequestApplySnapshotChunk({this.index, this.chunk, this.sender});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint32(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [index, chunk, sender];

  @override
  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'chunk': switch (chunk) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'sender': sender,
    };
  }

  factory RequestApplySnapshotChunk.fromJson(Map<String, dynamic> json) {
    return RequestApplySnapshotChunk(
      index: json.valueAsInt<int?>('index', acceptCamelCase: true),
      chunk: json.valueAsBytes<List<int>?>(
        'chunk',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
    );
  }

  factory RequestApplySnapshotChunk.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RequestApplySnapshotChunk(
      index: decode.getInt<int?>(1),
      chunk: decode.getBytes<List<int>?>(2),
      sender: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciRequestApplySnapshotChunk;
  @override
  ResponseApplySnapshotChunk onServiceResponse(List<int> bytes) {
    return ResponseApplySnapshotChunk.deserialize(bytes);
  }

  @override
  ResponseApplySnapshotChunk onServiceResponseJson(Map<String, dynamic> json) {
    return ResponseApplySnapshotChunk.fromJson(json);
  }
}

class RequestPrepareProposal extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<ResponsePrepareProposal> {
  /// the modified transactions cannot exceed this size.
  final BigInt? maxTxBytes;

  /// txs is an array of transactions that will be included in a block,
  /// sent to the app for possible modifications.
  final List<List<int>> txs;

  final ExtendedCommitInfo? localLastCommit;

  final List<Misbehavior> misbehavior;

  final BigInt? height;

  final google_protobuf_timestamp.Timestamp? time;

  final List<int>? nextValidatorsHash;

  /// address of the public key of the validator proposing the block.
  final List<int>? proposerAddress;

  const RequestPrepareProposal({
    this.maxTxBytes,
    this.txs = const [],
    this.localLastCommit,
    this.misbehavior = const [],
    this.height,
    this.time,
    this.nextValidatorsHash,
    this.proposerAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.bytes,
        ),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.message(6, options: const []),
        ProtoFieldConfig.bytes(7),
        ProtoFieldConfig.bytes(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    maxTxBytes,
    txs,
    localLastCommit,
    misbehavior,
    height,
    time,
    nextValidatorsHash,
    proposerAddress,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'max_tx_bytes': maxTxBytes?.toString(),
      'txs':
          txs
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
      'local_last_commit': localLastCommit?.toJson(),
      'misbehavior': misbehavior.map((e) => e.toJson()).toList(),
      'height': height?.toString(),
      'time': time?.toRfc3339(),
      'next_validators_hash': switch (nextValidatorsHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'proposer_address': switch (proposerAddress) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory RequestPrepareProposal.fromJson(Map<String, dynamic> json) {
    return RequestPrepareProposal(
      maxTxBytes: json.valueAsBigInt<BigInt?>(
        'max_tx_bytes',
        acceptCamelCase: true,
      ),
      txs:
          (json.valueEnsureAsList<dynamic>('txs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
      localLastCommit: json.valueTo<ExtendedCommitInfo?, Map<String, dynamic>>(
        key: 'local_last_commit',
        parse: (v) => ExtendedCommitInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      misbehavior:
          (json.valueEnsureAsList<dynamic>(
                'misbehavior',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<Misbehavior, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Misbehavior.fromJson(v),
                ),
              )
              .toList(),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      time: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      nextValidatorsHash: json.valueAsBytes<List<int>?>(
        'next_validators_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      proposerAddress: json.valueAsBytes<List<int>?>(
        'proposer_address',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory RequestPrepareProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RequestPrepareProposal(
      maxTxBytes: decode.getBigInt<BigInt?>(1),
      txs: decode.getListOfBytes(2),
      localLastCommit: decode.messageTo<ExtendedCommitInfo?>(
        3,
        (b) => ExtendedCommitInfo.deserialize(b),
      ),
      misbehavior:
          decode
              .getListOfBytes(4)
              .map((b) => Misbehavior.deserialize(b))
              .toList(),
      height: decode.getBigInt<BigInt?>(5),
      time: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        6,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      nextValidatorsHash: decode.getBytes<List<int>?>(7),
      proposerAddress: decode.getBytes<List<int>?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciRequestPrepareProposal;
  @override
  ResponsePrepareProposal onServiceResponse(List<int> bytes) {
    return ResponsePrepareProposal.deserialize(bytes);
  }

  @override
  ResponsePrepareProposal onServiceResponseJson(Map<String, dynamic> json) {
    return ResponsePrepareProposal.fromJson(json);
  }
}

class RequestProcessProposal extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<ResponseProcessProposal> {
  final List<List<int>> txs;

  final CommitInfo? proposedLastCommit;

  final List<Misbehavior> misbehavior;

  /// hash is the merkle root hash of the fields of the proposed block.
  final List<int>? hash;

  final BigInt? height;

  final google_protobuf_timestamp.Timestamp? time;

  final List<int>? nextValidatorsHash;

  /// address of the public key of the original proposer of the block.
  final List<int>? proposerAddress;

  const RequestProcessProposal({
    this.txs = const [],
    this.proposedLastCommit,
    this.misbehavior = const [],
    this.hash,
    this.height,
    this.time,
    this.nextValidatorsHash,
    this.proposerAddress,
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
          elementType: ProtoFieldType.bytes,
        ),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.bytes(4),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.message(6, options: const []),
        ProtoFieldConfig.bytes(7),
        ProtoFieldConfig.bytes(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    txs,
    proposedLastCommit,
    misbehavior,
    hash,
    height,
    time,
    nextValidatorsHash,
    proposerAddress,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'txs':
          txs
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
      'proposed_last_commit': proposedLastCommit?.toJson(),
      'misbehavior': misbehavior.map((e) => e.toJson()).toList(),
      'hash': switch (hash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'height': height?.toString(),
      'time': time?.toRfc3339(),
      'next_validators_hash': switch (nextValidatorsHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'proposer_address': switch (proposerAddress) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory RequestProcessProposal.fromJson(Map<String, dynamic> json) {
    return RequestProcessProposal(
      txs:
          (json.valueEnsureAsList<dynamic>('txs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
      proposedLastCommit: json.valueTo<CommitInfo?, Map<String, dynamic>>(
        key: 'proposed_last_commit',
        parse: (v) => CommitInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      misbehavior:
          (json.valueEnsureAsList<dynamic>(
                'misbehavior',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<Misbehavior, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Misbehavior.fromJson(v),
                ),
              )
              .toList(),
      hash: json.valueAsBytes<List<int>?>(
        'hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      time: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      nextValidatorsHash: json.valueAsBytes<List<int>?>(
        'next_validators_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      proposerAddress: json.valueAsBytes<List<int>?>(
        'proposer_address',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory RequestProcessProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RequestProcessProposal(
      txs: decode.getListOfBytes(1),
      proposedLastCommit: decode.messageTo<CommitInfo?>(
        2,
        (b) => CommitInfo.deserialize(b),
      ),
      misbehavior:
          decode
              .getListOfBytes(3)
              .map((b) => Misbehavior.deserialize(b))
              .toList(),
      hash: decode.getBytes<List<int>?>(4),
      height: decode.getBigInt<BigInt?>(5),
      time: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        6,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      nextValidatorsHash: decode.getBytes<List<int>?>(7),
      proposerAddress: decode.getBytes<List<int>?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciRequestProcessProposal;
  @override
  ResponseProcessProposal onServiceResponse(List<int> bytes) {
    return ResponseProcessProposal.deserialize(bytes);
  }

  @override
  ResponseProcessProposal onServiceResponseJson(Map<String, dynamic> json) {
    return ResponseProcessProposal.fromJson(json);
  }
}

/// Extends a vote with application-injected data
class RequestExtendVote extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<ResponseExtendVote> {
  /// the hash of the block that this vote may be referring to
  final List<int>? hash;

  /// the height of the extended vote
  final BigInt? height;

  /// info of the block that this vote may be referring to
  final google_protobuf_timestamp.Timestamp? time;

  final List<List<int>> txs;

  final CommitInfo? proposedLastCommit;

  final List<Misbehavior> misbehavior;

  final List<int>? nextValidatorsHash;

  /// address of the public key of the original proposer of the block.
  final List<int>? proposerAddress;

  const RequestExtendVote({
    this.hash,
    this.height,
    this.time,
    this.txs = const [],
    this.proposedLastCommit,
    this.misbehavior = const [],
    this.nextValidatorsHash,
    this.proposerAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.bytes,
        ),
        ProtoFieldConfig.message(5, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.bytes(7),
        ProtoFieldConfig.bytes(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    hash,
    height,
    time,
    txs,
    proposedLastCommit,
    misbehavior,
    nextValidatorsHash,
    proposerAddress,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'hash': switch (hash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'height': height?.toString(),
      'time': time?.toRfc3339(),
      'txs':
          txs
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
      'proposed_last_commit': proposedLastCommit?.toJson(),
      'misbehavior': misbehavior.map((e) => e.toJson()).toList(),
      'next_validators_hash': switch (nextValidatorsHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'proposer_address': switch (proposerAddress) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory RequestExtendVote.fromJson(Map<String, dynamic> json) {
    return RequestExtendVote(
      hash: json.valueAsBytes<List<int>?>(
        'hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      time: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      txs:
          (json.valueEnsureAsList<dynamic>('txs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
      proposedLastCommit: json.valueTo<CommitInfo?, Map<String, dynamic>>(
        key: 'proposed_last_commit',
        parse: (v) => CommitInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      misbehavior:
          (json.valueEnsureAsList<dynamic>(
                'misbehavior',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<Misbehavior, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Misbehavior.fromJson(v),
                ),
              )
              .toList(),
      nextValidatorsHash: json.valueAsBytes<List<int>?>(
        'next_validators_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      proposerAddress: json.valueAsBytes<List<int>?>(
        'proposer_address',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory RequestExtendVote.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RequestExtendVote(
      hash: decode.getBytes<List<int>?>(1),
      height: decode.getBigInt<BigInt?>(2),
      time: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        3,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      txs: decode.getListOfBytes(4),
      proposedLastCommit: decode.messageTo<CommitInfo?>(
        5,
        (b) => CommitInfo.deserialize(b),
      ),
      misbehavior:
          decode
              .getListOfBytes(6)
              .map((b) => Misbehavior.deserialize(b))
              .toList(),
      nextValidatorsHash: decode.getBytes<List<int>?>(7),
      proposerAddress: decode.getBytes<List<int>?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciRequestExtendVote;
  @override
  ResponseExtendVote onServiceResponse(List<int> bytes) {
    return ResponseExtendVote.deserialize(bytes);
  }

  @override
  ResponseExtendVote onServiceResponseJson(Map<String, dynamic> json) {
    return ResponseExtendVote.fromJson(json);
  }
}

/// Verify the vote extension
class RequestVerifyVoteExtension extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<ResponseVerifyVoteExtension> {
  /// the hash of the block that this received vote corresponds to
  final List<int>? hash;

  /// the validator that signed the vote extension
  final List<int>? validatorAddress;

  final BigInt? height;

  final List<int>? voteExtension;

  const RequestVerifyVoteExtension({
    this.hash,
    this.validatorAddress,
    this.height,
    this.voteExtension,
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
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.bytes(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    hash,
    validatorAddress,
    height,
    voteExtension,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'hash': switch (hash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'validator_address': switch (validatorAddress) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'height': height?.toString(),
      'vote_extension': switch (voteExtension) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory RequestVerifyVoteExtension.fromJson(Map<String, dynamic> json) {
    return RequestVerifyVoteExtension(
      hash: json.valueAsBytes<List<int>?>(
        'hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      validatorAddress: json.valueAsBytes<List<int>?>(
        'validator_address',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      voteExtension: json.valueAsBytes<List<int>?>(
        'vote_extension',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory RequestVerifyVoteExtension.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RequestVerifyVoteExtension(
      hash: decode.getBytes<List<int>?>(1),
      validatorAddress: decode.getBytes<List<int>?>(2),
      height: decode.getBigInt<BigInt?>(3),
      voteExtension: decode.getBytes<List<int>?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciRequestVerifyVoteExtension;
  @override
  ResponseVerifyVoteExtension onServiceResponse(List<int> bytes) {
    return ResponseVerifyVoteExtension.deserialize(bytes);
  }

  @override
  ResponseVerifyVoteExtension onServiceResponseJson(Map<String, dynamic> json) {
    return ResponseVerifyVoteExtension.fromJson(json);
  }
}

class RequestFinalizeBlock extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<ResponseFinalizeBlock> {
  final List<List<int>> txs;

  final CommitInfo? decidedLastCommit;

  final List<Misbehavior> misbehavior;

  /// hash is the merkle root hash of the fields of the decided block.
  final List<int>? hash;

  final BigInt? height;

  final google_protobuf_timestamp.Timestamp? time;

  final List<int>? nextValidatorsHash;

  /// proposer_address is the address of the public key of the original proposer of the block.
  final List<int>? proposerAddress;

  const RequestFinalizeBlock({
    this.txs = const [],
    this.decidedLastCommit,
    this.misbehavior = const [],
    this.hash,
    this.height,
    this.time,
    this.nextValidatorsHash,
    this.proposerAddress,
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
          elementType: ProtoFieldType.bytes,
        ),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.bytes(4),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.message(6, options: const []),
        ProtoFieldConfig.bytes(7),
        ProtoFieldConfig.bytes(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    txs,
    decidedLastCommit,
    misbehavior,
    hash,
    height,
    time,
    nextValidatorsHash,
    proposerAddress,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'txs':
          txs
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
      'decided_last_commit': decidedLastCommit?.toJson(),
      'misbehavior': misbehavior.map((e) => e.toJson()).toList(),
      'hash': switch (hash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'height': height?.toString(),
      'time': time?.toRfc3339(),
      'next_validators_hash': switch (nextValidatorsHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'proposer_address': switch (proposerAddress) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory RequestFinalizeBlock.fromJson(Map<String, dynamic> json) {
    return RequestFinalizeBlock(
      txs:
          (json.valueEnsureAsList<dynamic>('txs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
      decidedLastCommit: json.valueTo<CommitInfo?, Map<String, dynamic>>(
        key: 'decided_last_commit',
        parse: (v) => CommitInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      misbehavior:
          (json.valueEnsureAsList<dynamic>(
                'misbehavior',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<Misbehavior, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Misbehavior.fromJson(v),
                ),
              )
              .toList(),
      hash: json.valueAsBytes<List<int>?>(
        'hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      time: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      nextValidatorsHash: json.valueAsBytes<List<int>?>(
        'next_validators_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      proposerAddress: json.valueAsBytes<List<int>?>(
        'proposer_address',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory RequestFinalizeBlock.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RequestFinalizeBlock(
      txs: decode.getListOfBytes(1),
      decidedLastCommit: decode.messageTo<CommitInfo?>(
        2,
        (b) => CommitInfo.deserialize(b),
      ),
      misbehavior:
          decode
              .getListOfBytes(3)
              .map((b) => Misbehavior.deserialize(b))
              .toList(),
      hash: decode.getBytes<List<int>?>(4),
      height: decode.getBigInt<BigInt?>(5),
      time: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        6,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      nextValidatorsHash: decode.getBytes<List<int>?>(7),
      proposerAddress: decode.getBytes<List<int>?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciRequestFinalizeBlock;
  @override
  ResponseFinalizeBlock onServiceResponse(List<int> bytes) {
    return ResponseFinalizeBlock.deserialize(bytes);
  }

  @override
  ResponseFinalizeBlock onServiceResponseJson(Map<String, dynamic> json) {
    return ResponseFinalizeBlock.fromJson(json);
  }
}

class ResponseEcho extends CosmosProtoMessage {
  final String? message;

  const ResponseEcho({this.message});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [message];

  @override
  Map<String, dynamic> toJson() {
    return {'message': message};
  }

  factory ResponseEcho.fromJson(Map<String, dynamic> json) {
    return ResponseEcho(
      message: json.valueAsString<String?>('message', acceptCamelCase: true),
    );
  }

  factory ResponseEcho.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ResponseEcho(message: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciResponseEcho;
}

class ResponseFlush extends CosmosProtoMessage {
  const ResponseFlush();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory ResponseFlush.fromJson(Map<String, dynamic> json) {
    return ResponseFlush();
  }

  factory ResponseFlush.deserialize(List<int> bytes) {
    return ResponseFlush();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciResponseFlush;
}

class ResponseInfo extends CosmosProtoMessage {
  final String? data;

  final String? version;

  final BigInt? appVersion;

  final BigInt? lastBlockHeight;

  final List<int>? lastBlockAppHash;

  const ResponseInfo({
    this.data,
    this.version,
    this.appVersion,
    this.lastBlockHeight,
    this.lastBlockAppHash,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.bytes(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    data,
    version,
    appVersion,
    lastBlockHeight,
    lastBlockAppHash,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'version': version,
      'app_version': appVersion?.toString(),
      'last_block_height': lastBlockHeight?.toString(),
      'last_block_app_hash': switch (lastBlockAppHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory ResponseInfo.fromJson(Map<String, dynamic> json) {
    return ResponseInfo(
      data: json.valueAsString<String?>('data', acceptCamelCase: true),
      version: json.valueAsString<String?>('version', acceptCamelCase: true),
      appVersion: json.valueAsBigInt<BigInt?>(
        'app_version',
        acceptCamelCase: true,
      ),
      lastBlockHeight: json.valueAsBigInt<BigInt?>(
        'last_block_height',
        acceptCamelCase: true,
      ),
      lastBlockAppHash: json.valueAsBytes<List<int>?>(
        'last_block_app_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory ResponseInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ResponseInfo(
      data: decode.getString<String?>(1),
      version: decode.getString<String?>(2),
      appVersion: decode.getBigInt<BigInt?>(3),
      lastBlockHeight: decode.getBigInt<BigInt?>(4),
      lastBlockAppHash: decode.getBytes<List<int>?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciResponseInfo;
}

class ResponseInitChain extends CosmosProtoMessage {
  final tendermint_types_params.ConsensusParams? consensusParams;

  final List<ValidatorUpdate> validators;

  final List<int>? appHash;

  const ResponseInitChain({
    this.consensusParams,
    this.validators = const [],
    this.appHash,
  });

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
          options: const [],
        ),
        ProtoFieldConfig.bytes(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [consensusParams, validators, appHash];

  @override
  Map<String, dynamic> toJson() {
    return {
      'consensus_params': consensusParams?.toJson(),
      'validators': validators.map((e) => e.toJson()).toList(),
      'app_hash': switch (appHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory ResponseInitChain.fromJson(Map<String, dynamic> json) {
    return ResponseInitChain(
      consensusParams: json.valueTo<
        tendermint_types_params.ConsensusParams?,
        Map<String, dynamic>
      >(
        key: 'consensus_params',
        parse: (v) => tendermint_types_params.ConsensusParams.fromJson(v),
        acceptCamelCase: true,
      ),
      validators:
          (json.valueEnsureAsList<dynamic>('validators', acceptCamelCase: true))
              .map(
                (e) =>
                    JsonParser.valueTo<ValidatorUpdate, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => ValidatorUpdate.fromJson(v),
                    ),
              )
              .toList(),
      appHash: json.valueAsBytes<List<int>?>(
        'app_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory ResponseInitChain.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ResponseInitChain(
      consensusParams: decode
          .messageTo<tendermint_types_params.ConsensusParams?>(
            1,
            (b) => tendermint_types_params.ConsensusParams.deserialize(b),
          ),
      validators:
          decode
              .getListOfBytes(2)
              .map((b) => ValidatorUpdate.deserialize(b))
              .toList(),
      appHash: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciResponseInitChain;
}

class ResponseQuery extends CosmosProtoMessage {
  final int? code;

  /// bytes data = 2; // use "value" instead.
  final String? log;

  /// nondeterministic
  final String? info;

  /// nondeterministic
  final BigInt? index;

  final List<int>? key;

  final List<int>? value;

  final tendermint_crypto_proof.ProofOps? proofOps;

  final BigInt? height;

  final String? codespace;

  const ResponseQuery({
    this.code,
    this.log,
    this.info,
    this.index,
    this.key,
    this.value,
    this.proofOps,
    this.height,
    this.codespace,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint32(1),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.bytes(6),
        ProtoFieldConfig.bytes(7),
        ProtoFieldConfig.message(8),
        ProtoFieldConfig.int64(9),
        ProtoFieldConfig.string(10),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    code,
    log,
    info,
    index,
    key,
    value,
    proofOps,
    height,
    codespace,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'log': log,
      'info': info,
      'index': index?.toString(),
      'key': switch (key) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'value': switch (value) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'proof_ops': proofOps?.toJson(),
      'height': height?.toString(),
      'codespace': codespace,
    };
  }

  factory ResponseQuery.fromJson(Map<String, dynamic> json) {
    return ResponseQuery(
      code: json.valueAsInt<int?>('code', acceptCamelCase: true),
      log: json.valueAsString<String?>('log', acceptCamelCase: true),
      info: json.valueAsString<String?>('info', acceptCamelCase: true),
      index: json.valueAsBigInt<BigInt?>('index', acceptCamelCase: true),
      key: json.valueAsBytes<List<int>?>(
        'key',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      value: json.valueAsBytes<List<int>?>(
        'value',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      proofOps: json
          .valueTo<tendermint_crypto_proof.ProofOps?, Map<String, dynamic>>(
            key: 'proof_ops',
            parse: (v) => tendermint_crypto_proof.ProofOps.fromJson(v),
            acceptCamelCase: true,
          ),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      codespace: json.valueAsString<String?>(
        'codespace',
        acceptCamelCase: true,
      ),
    );
  }

  factory ResponseQuery.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ResponseQuery(
      code: decode.getInt<int?>(1),
      log: decode.getString<String?>(3),
      info: decode.getString<String?>(4),
      index: decode.getBigInt<BigInt?>(5),
      key: decode.getBytes<List<int>?>(6),
      value: decode.getBytes<List<int>?>(7),
      proofOps: decode.messageTo<tendermint_crypto_proof.ProofOps?>(
        8,
        (b) => tendermint_crypto_proof.ProofOps.deserialize(b),
      ),
      height: decode.getBigInt<BigInt?>(9),
      codespace: decode.getString<String?>(10),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciResponseQuery;
}

class ResponseCheckTx extends CosmosProtoMessage {
  final int? code;

  final List<int>? data;

  final String? log;

  /// nondeterministic
  final String? info;

  /// nondeterministic
  final BigInt? gasWanted;

  final BigInt? gasUsed;

  final List<Event> events;

  final String? codespace;

  const ResponseCheckTx({
    this.code,
    this.data,
    this.log,
    this.info,
    this.gasWanted,
    this.gasUsed,
    this.events = const [],
    this.codespace,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint32(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.int64(
          5,
          options: [ProtoOptionString(name: "json_name", value: "gas_wanted")],
        ),
        ProtoFieldConfig.int64(
          6,
          options: [ProtoOptionString(name: "json_name", value: "gas_used")],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.string(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    code,
    data,
    log,
    info,
    gasWanted,
    gasUsed,
    events,
    codespace,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'data': switch (data) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'log': log,
      'info': info,
      'gas_wanted': gasWanted?.toString(),
      'gas_used': gasUsed?.toString(),
      'events': events.map((e) => e.toJson()).toList(),
      'codespace': codespace,
    };
  }

  factory ResponseCheckTx.fromJson(Map<String, dynamic> json) {
    return ResponseCheckTx(
      code: json.valueAsInt<int?>('code', acceptCamelCase: true),
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      log: json.valueAsString<String?>('log', acceptCamelCase: true),
      info: json.valueAsString<String?>('info', acceptCamelCase: true),
      gasWanted: json.valueAsBigInt<BigInt?>(
        'gas_wanted',
        acceptCamelCase: true,
      ),
      gasUsed: json.valueAsBigInt<BigInt?>('gas_used', acceptCamelCase: true),
      events:
          (json.valueEnsureAsList<dynamic>('events', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<Event, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Event.fromJson(v),
                ),
              )
              .toList(),
      codespace: json.valueAsString<String?>(
        'codespace',
        acceptCamelCase: true,
      ),
    );
  }

  factory ResponseCheckTx.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ResponseCheckTx(
      code: decode.getInt<int?>(1),
      data: decode.getBytes<List<int>?>(2),
      log: decode.getString<String?>(3),
      info: decode.getString<String?>(4),
      gasWanted: decode.getBigInt<BigInt?>(5),
      gasUsed: decode.getBigInt<BigInt?>(6),
      events:
          decode.getListOfBytes(7).map((b) => Event.deserialize(b)).toList(),
      codespace: decode.getString<String?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciResponseCheckTx;
}

/// These reserved fields were used until v0.37 by the priority mempool (now
/// removed).
class ResponseCommit extends CosmosProtoMessage {
  /// data was previously returned here
  final BigInt? retainHeight;

  const ResponseCommit({this.retainHeight});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.int64(3)],
    );
  }

  @override
  List<Object?> get protoValues => [retainHeight];

  @override
  Map<String, dynamic> toJson() {
    return {'retain_height': retainHeight?.toString()};
  }

  factory ResponseCommit.fromJson(Map<String, dynamic> json) {
    return ResponseCommit(
      retainHeight: json.valueAsBigInt<BigInt?>(
        'retain_height',
        acceptCamelCase: true,
      ),
    );
  }

  factory ResponseCommit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ResponseCommit(retainHeight: decode.getBigInt<BigInt?>(3));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciResponseCommit;
}

class ResponseListSnapshots extends CosmosProtoMessage {
  final List<Snapshot> snapshots;

  const ResponseListSnapshots({this.snapshots = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [snapshots];

  @override
  Map<String, dynamic> toJson() {
    return {'snapshots': snapshots.map((e) => e.toJson()).toList()};
  }

  factory ResponseListSnapshots.fromJson(Map<String, dynamic> json) {
    return ResponseListSnapshots(
      snapshots:
          (json.valueEnsureAsList<dynamic>('snapshots', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<Snapshot, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Snapshot.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory ResponseListSnapshots.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ResponseListSnapshots(
      snapshots:
          decode.getListOfBytes(1).map((b) => Snapshot.deserialize(b)).toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciResponseListSnapshots;
}

class ResponseOfferSnapshot extends CosmosProtoMessage {
  final ResponseOfferSnapshotResult? result;

  const ResponseOfferSnapshot({this.result});

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
  List<Object?> get protoValues => [result];

  @override
  Map<String, dynamic> toJson() {
    return {'result': result?.protoName};
  }

  factory ResponseOfferSnapshot.fromJson(Map<String, dynamic> json) {
    return ResponseOfferSnapshot(
      result: json.valueTo<ResponseOfferSnapshotResult?, Object?>(
        key: 'result',
        parse: (v) => ResponseOfferSnapshotResult.from(v),
      ),
    );
  }

  factory ResponseOfferSnapshot.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ResponseOfferSnapshot(
      result: decode.getEnum<ResponseOfferSnapshotResult?>(
        1,
        ResponseOfferSnapshotResult.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciResponseOfferSnapshot;
}

/// Reject all snapshots from the sender(s), try others
class ResponseLoadSnapshotChunk extends CosmosProtoMessage {
  final List<int>? chunk;

  const ResponseLoadSnapshotChunk({this.chunk});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1)],
    );
  }

  @override
  List<Object?> get protoValues => [chunk];

  @override
  Map<String, dynamic> toJson() {
    return {
      'chunk': switch (chunk) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory ResponseLoadSnapshotChunk.fromJson(Map<String, dynamic> json) {
    return ResponseLoadSnapshotChunk(
      chunk: json.valueAsBytes<List<int>?>(
        'chunk',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory ResponseLoadSnapshotChunk.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ResponseLoadSnapshotChunk(chunk: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciResponseLoadSnapshotChunk;
}

class ResponseApplySnapshotChunk extends CosmosProtoMessage {
  final ResponseApplySnapshotChunkResult? result;

  final List<int> refetchChunks;

  /// Chunks to refetch and reapply
  final List<String> rejectSenders;

  const ResponseApplySnapshotChunk({
    this.result,
    this.refetchChunks = const [],
    this.rejectSenders = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.enumType(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.uint32,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [result, refetchChunks, rejectSenders];

  @override
  Map<String, dynamic> toJson() {
    return {
      'result': result?.protoName,
      'refetch_chunks': refetchChunks.map((e) => e).toList(),
      'reject_senders': rejectSenders.map((e) => e).toList(),
    };
  }

  factory ResponseApplySnapshotChunk.fromJson(Map<String, dynamic> json) {
    return ResponseApplySnapshotChunk(
      result: json.valueTo<ResponseApplySnapshotChunkResult?, Object?>(
        key: 'result',
        parse: (v) => ResponseApplySnapshotChunkResult.from(v),
      ),
      refetchChunks:
          (json.valueEnsureAsList<dynamic>(
            'refetch_chunks',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsInt<int>(e)).toList(),
      rejectSenders:
          (json.valueEnsureAsList<dynamic>(
            'reject_senders',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory ResponseApplySnapshotChunk.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ResponseApplySnapshotChunk(
      result: decode.getEnum<ResponseApplySnapshotChunkResult?>(
        1,
        ResponseApplySnapshotChunkResult.values,
      ),
      refetchChunks: decode.getListOrEmpty<int>(2),
      rejectSenders: decode.getListOrEmpty<String>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciResponseApplySnapshotChunk;
}

/// Reject this snapshot, try others
class ResponsePrepareProposal extends CosmosProtoMessage {
  final List<List<int>> txs;

  const ResponsePrepareProposal({this.txs = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.bytes,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [txs];

  @override
  Map<String, dynamic> toJson() {
    return {
      'txs':
          txs
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
    };
  }

  factory ResponsePrepareProposal.fromJson(Map<String, dynamic> json) {
    return ResponsePrepareProposal(
      txs:
          (json.valueEnsureAsList<dynamic>('txs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
    );
  }

  factory ResponsePrepareProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ResponsePrepareProposal(txs: decode.getListOfBytes(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciResponsePrepareProposal;
}

class ResponseProcessProposal extends CosmosProtoMessage {
  final ResponseProcessProposalProposalStatus? status;

  const ResponseProcessProposal({this.status});

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
  List<Object?> get protoValues => [status];

  @override
  Map<String, dynamic> toJson() {
    return {'status': status?.protoName};
  }

  factory ResponseProcessProposal.fromJson(Map<String, dynamic> json) {
    return ResponseProcessProposal(
      status: json.valueTo<ResponseProcessProposalProposalStatus?, Object?>(
        key: 'status',
        parse: (v) => ResponseProcessProposalProposalStatus.from(v),
      ),
    );
  }

  factory ResponseProcessProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ResponseProcessProposal(
      status: decode.getEnum<ResponseProcessProposalProposalStatus?>(
        1,
        ResponseProcessProposalProposalStatus.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciResponseProcessProposal;
}

class ResponseExtendVote extends CosmosProtoMessage {
  final List<int>? voteExtension;

  const ResponseExtendVote({this.voteExtension});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1)],
    );
  }

  @override
  List<Object?> get protoValues => [voteExtension];

  @override
  Map<String, dynamic> toJson() {
    return {
      'vote_extension': switch (voteExtension) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory ResponseExtendVote.fromJson(Map<String, dynamic> json) {
    return ResponseExtendVote(
      voteExtension: json.valueAsBytes<List<int>?>(
        'vote_extension',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory ResponseExtendVote.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ResponseExtendVote(voteExtension: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciResponseExtendVote;
}

class ResponseVerifyVoteExtension extends CosmosProtoMessage {
  final ResponseVerifyVoteExtensionVerifyStatus? status;

  const ResponseVerifyVoteExtension({this.status});

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
  List<Object?> get protoValues => [status];

  @override
  Map<String, dynamic> toJson() {
    return {'status': status?.protoName};
  }

  factory ResponseVerifyVoteExtension.fromJson(Map<String, dynamic> json) {
    return ResponseVerifyVoteExtension(
      status: json.valueTo<ResponseVerifyVoteExtensionVerifyStatus?, Object?>(
        key: 'status',
        parse: (v) => ResponseVerifyVoteExtensionVerifyStatus.from(v),
      ),
    );
  }

  factory ResponseVerifyVoteExtension.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ResponseVerifyVoteExtension(
      status: decode.getEnum<ResponseVerifyVoteExtensionVerifyStatus?>(
        1,
        ResponseVerifyVoteExtensionVerifyStatus.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciResponseVerifyVoteExtension;
}

class ResponseFinalizeBlock extends CosmosProtoMessage {
  /// set of block events emitted as part of executing the block
  final List<Event> events;

  /// the result of executing each transaction including the events
  /// the particular transaction emitted. This should match the order
  /// of the transactions delivered in the block itself
  final List<ExecTxResult> txResults;

  /// a list of updates to the validator set. These will reflect the validator set at current height + 2.
  final List<ValidatorUpdate> validatorUpdates;

  /// updates to the consensus params, if any.
  final tendermint_types_params.ConsensusParams? consensusParamUpdates;

  /// app_hash is the hash of the applications' state which is used to confirm that execution of the transactions was
  /// deterministic. It is up to the application to decide which algorithm to use.
  final List<int>? appHash;

  const ResponseFinalizeBlock({
    this.events = const [],
    this.txResults = const [],
    this.validatorUpdates = const [],
    this.consensusParamUpdates,
    this.appHash,
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
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.message(4),
        ProtoFieldConfig.bytes(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    events,
    txResults,
    validatorUpdates,
    consensusParamUpdates,
    appHash,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'events': events.map((e) => e.toJson()).toList(),
      'tx_results': txResults.map((e) => e.toJson()).toList(),
      'validator_updates': validatorUpdates.map((e) => e.toJson()).toList(),
      'consensus_param_updates': consensusParamUpdates?.toJson(),
      'app_hash': switch (appHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory ResponseFinalizeBlock.fromJson(Map<String, dynamic> json) {
    return ResponseFinalizeBlock(
      events:
          (json.valueEnsureAsList<dynamic>('events', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<Event, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Event.fromJson(v),
                ),
              )
              .toList(),
      txResults:
          (json.valueEnsureAsList<dynamic>('tx_results', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<ExecTxResult, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => ExecTxResult.fromJson(v),
                ),
              )
              .toList(),
      validatorUpdates:
          (json.valueEnsureAsList<dynamic>(
                'validator_updates',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<ValidatorUpdate, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => ValidatorUpdate.fromJson(v),
                    ),
              )
              .toList(),
      consensusParamUpdates: json.valueTo<
        tendermint_types_params.ConsensusParams?,
        Map<String, dynamic>
      >(
        key: 'consensus_param_updates',
        parse: (v) => tendermint_types_params.ConsensusParams.fromJson(v),
        acceptCamelCase: true,
      ),
      appHash: json.valueAsBytes<List<int>?>(
        'app_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory ResponseFinalizeBlock.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ResponseFinalizeBlock(
      events:
          decode.getListOfBytes(1).map((b) => Event.deserialize(b)).toList(),
      txResults:
          decode
              .getListOfBytes(2)
              .map((b) => ExecTxResult.deserialize(b))
              .toList(),
      validatorUpdates:
          decode
              .getListOfBytes(3)
              .map((b) => ValidatorUpdate.deserialize(b))
              .toList(),
      consensusParamUpdates: decode
          .messageTo<tendermint_types_params.ConsensusParams?>(
            4,
            (b) => tendermint_types_params.ConsensusParams.deserialize(b),
          ),
      appHash: decode.getBytes<List<int>?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciResponseFinalizeBlock;
}

/// ----------------------------------------
/// Misc.
class CommitInfo extends CosmosProtoMessage {
  final int? round;

  final List<VoteInfo> votes;

  const CommitInfo({this.round, this.votes = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int32(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [round, votes];

  @override
  Map<String, dynamic> toJson() {
    return {'round': round, 'votes': votes.map((e) => e.toJson()).toList()};
  }

  factory CommitInfo.fromJson(Map<String, dynamic> json) {
    return CommitInfo(
      round: json.valueAsInt<int?>('round', acceptCamelCase: true),
      votes:
          (json.valueEnsureAsList<dynamic>('votes', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<VoteInfo, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => VoteInfo.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory CommitInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return CommitInfo(
      round: decode.getInt<int?>(1),
      votes:
          decode.getListOfBytes(2).map((b) => VoteInfo.deserialize(b)).toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciCommitInfo;
}

/// ExtendedCommitInfo is similar to CommitInfo except that it is only used in
/// the PrepareProposal request such that CometBFT can provide vote extensions
/// to the application.
class ExtendedCommitInfo extends CosmosProtoMessage {
  /// The round at which the block proposer decided in the previous height.
  final int? round;

  /// List of validators' addresses in the last validator set with their voting
  /// information, including vote extensions.
  final List<ExtendedVoteInfo> votes;

  const ExtendedCommitInfo({this.round, this.votes = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int32(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [round, votes];

  @override
  Map<String, dynamic> toJson() {
    return {'round': round, 'votes': votes.map((e) => e.toJson()).toList()};
  }

  factory ExtendedCommitInfo.fromJson(Map<String, dynamic> json) {
    return ExtendedCommitInfo(
      round: json.valueAsInt<int?>('round', acceptCamelCase: true),
      votes:
          (json.valueEnsureAsList<dynamic>('votes', acceptCamelCase: true))
              .map(
                (e) =>
                    JsonParser.valueTo<ExtendedVoteInfo, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => ExtendedVoteInfo.fromJson(v),
                    ),
              )
              .toList(),
    );
  }

  factory ExtendedCommitInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ExtendedCommitInfo(
      round: decode.getInt<int?>(1),
      votes:
          decode
              .getListOfBytes(2)
              .map((b) => ExtendedVoteInfo.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciExtendedCommitInfo;
}

/// Event allows application developers to attach additional information to
/// ResponseFinalizeBlock and ResponseCheckTx.
/// Later, transactions may be queried using these events.
class Event extends CosmosProtoMessage {
  final String? type;

  final List<EventAttribute> attributes;

  const Event({this.type, this.attributes = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [type, attributes];

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'attributes': attributes.map((e) => e.toJson()).toList(),
    };
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      type: json.valueAsString<String?>('type', acceptCamelCase: true),
      attributes:
          (json.valueEnsureAsList<dynamic>('attributes', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<EventAttribute, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => EventAttribute.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory Event.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Event(
      type: decode.getString<String?>(1),
      attributes:
          decode
              .getListOfBytes(2)
              .map((b) => EventAttribute.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciEvent;
}

/// EventAttribute is a single key-value pair, associated with an event.
class EventAttribute extends CosmosProtoMessage {
  final String? key;

  final String? value;

  final bool? index;

  const EventAttribute({this.key, this.value, this.index});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.bool(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [key, value, index];

  @override
  Map<String, dynamic> toJson() {
    return {'key': key, 'value': value, 'index': index};
  }

  factory EventAttribute.fromJson(Map<String, dynamic> json) {
    return EventAttribute(
      key: json.valueAsString<String?>('key', acceptCamelCase: true),
      value: json.valueAsString<String?>('value', acceptCamelCase: true),
      index: json.valueAsBool<bool?>('index', acceptCamelCase: true),
    );
  }

  factory EventAttribute.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EventAttribute(
      key: decode.getString<String?>(1),
      value: decode.getString<String?>(2),
      index: decode.getBool<bool?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciEventAttribute;
}

/// nondeterministic
/// ExecTxResult contains results of executing one individual transaction.
///
/// * Its structure is equivalent to #ResponseDeliverTx which will be deprecated/deleted
class ExecTxResult extends CosmosProtoMessage {
  final int? code;

  final List<int>? data;

  final String? log;

  /// nondeterministic
  final String? info;

  /// nondeterministic
  final BigInt? gasWanted;

  final BigInt? gasUsed;

  final List<Event> events;

  /// nondeterministic
  final String? codespace;

  const ExecTxResult({
    this.code,
    this.data,
    this.log,
    this.info,
    this.gasWanted,
    this.gasUsed,
    this.events = const [],
    this.codespace,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint32(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.int64(
          5,
          options: [ProtoOptionString(name: "json_name", value: "gas_wanted")],
        ),
        ProtoFieldConfig.int64(
          6,
          options: [ProtoOptionString(name: "json_name", value: "gas_used")],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.string(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    code,
    data,
    log,
    info,
    gasWanted,
    gasUsed,
    events,
    codespace,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'data': switch (data) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'log': log,
      'info': info,
      'gas_wanted': gasWanted?.toString(),
      'gas_used': gasUsed?.toString(),
      'events': events.map((e) => e.toJson()).toList(),
      'codespace': codespace,
    };
  }

  factory ExecTxResult.fromJson(Map<String, dynamic> json) {
    return ExecTxResult(
      code: json.valueAsInt<int?>('code', acceptCamelCase: true),
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      log: json.valueAsString<String?>('log', acceptCamelCase: true),
      info: json.valueAsString<String?>('info', acceptCamelCase: true),
      gasWanted: json.valueAsBigInt<BigInt?>(
        'gas_wanted',
        acceptCamelCase: true,
      ),
      gasUsed: json.valueAsBigInt<BigInt?>('gas_used', acceptCamelCase: true),
      events:
          (json.valueEnsureAsList<dynamic>('events', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<Event, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Event.fromJson(v),
                ),
              )
              .toList(),
      codespace: json.valueAsString<String?>(
        'codespace',
        acceptCamelCase: true,
      ),
    );
  }

  factory ExecTxResult.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ExecTxResult(
      code: decode.getInt<int?>(1),
      data: decode.getBytes<List<int>?>(2),
      log: decode.getString<String?>(3),
      info: decode.getString<String?>(4),
      gasWanted: decode.getBigInt<BigInt?>(5),
      gasUsed: decode.getBigInt<BigInt?>(6),
      events:
          decode.getListOfBytes(7).map((b) => Event.deserialize(b)).toList(),
      codespace: decode.getString<String?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciExecTxResult;
}

/// ----------------------------------------
/// Blockchain Types
class Validator extends CosmosProtoMessage {
  final List<int>? address;

  /// The first 20 bytes of SHA256(public key)
  /// PubKey pub_key = 2 [(gogoproto.nullable)=false];
  final BigInt? power;

  const Validator({this.address, this.power});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1), ProtoFieldConfig.int64(3)],
    );
  }

  @override
  List<Object?> get protoValues => [address, power];

  @override
  Map<String, dynamic> toJson() {
    return {
      'address': switch (address) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'power': power?.toString(),
    };
  }

  factory Validator.fromJson(Map<String, dynamic> json) {
    return Validator(
      address: json.valueAsBytes<List<int>?>(
        'address',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      power: json.valueAsBigInt<BigInt?>('power', acceptCamelCase: true),
    );
  }

  factory Validator.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Validator(
      address: decode.getBytes<List<int>?>(1),
      power: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciValidator;
}

/// The voting power
class ValidatorUpdate extends CosmosProtoMessage {
  final tendermint_crypto_keys.PublicKey? pubKey;

  final BigInt? power;

  const ValidatorUpdate({this.pubKey, this.power});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.int64(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [pubKey, power];

  @override
  Map<String, dynamic> toJson() {
    return {'pub_key': pubKey?.toJson(), 'power': power?.toString()};
  }

  factory ValidatorUpdate.fromJson(Map<String, dynamic> json) {
    return ValidatorUpdate(
      pubKey: json
          .valueTo<tendermint_crypto_keys.PublicKey?, Map<String, dynamic>>(
            key: 'pub_key',
            parse: (v) => tendermint_crypto_keys.PublicKey.fromJson(v),
            acceptCamelCase: true,
          ),
      power: json.valueAsBigInt<BigInt?>('power', acceptCamelCase: true),
    );
  }

  factory ValidatorUpdate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ValidatorUpdate(
      pubKey: decode.messageTo<tendermint_crypto_keys.PublicKey?>(
        1,
        (b) => tendermint_crypto_keys.PublicKey.deserialize(b),
      ),
      power: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciValidatorUpdate;
}

class VoteInfo extends CosmosProtoMessage {
  final Validator? validator;

  final tendermint_types_validator.BlockIDFlag? blockIdFlag;

  const VoteInfo({this.validator, this.blockIdFlag});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.enumType(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [validator, blockIdFlag];

  @override
  Map<String, dynamic> toJson() {
    return {
      'validator': validator?.toJson(),
      'block_id_flag': blockIdFlag?.protoName,
    };
  }

  factory VoteInfo.fromJson(Map<String, dynamic> json) {
    return VoteInfo(
      validator: json.valueTo<Validator?, Map<String, dynamic>>(
        key: 'validator',
        parse: (v) => Validator.fromJson(v),
        acceptCamelCase: true,
      ),
      blockIdFlag: json
          .valueTo<tendermint_types_validator.BlockIDFlag?, Object?>(
            key: 'block_id_flag',
            parse: (v) => tendermint_types_validator.BlockIDFlag.from(v),
          ),
    );
  }

  factory VoteInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return VoteInfo(
      validator: decode.messageTo<Validator?>(
        1,
        (b) => Validator.deserialize(b),
      ),
      blockIdFlag: decode.getEnum<tendermint_types_validator.BlockIDFlag?>(
        3,
        tendermint_types_validator.BlockIDFlag.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciVoteInfo;
}

/// signed_last_block
class ExtendedVoteInfo extends CosmosProtoMessage {
  /// The validator that sent the vote.
  final Validator? validator;

  /// Non-deterministic extension provided by the sending validator's application.
  final List<int>? voteExtension;

  /// Vote extension signature created by CometBFT
  final List<int>? extensionSignature;

  /// block_id_flag indicates whether the validator voted for a block, nil, or did not vote at all
  final tendermint_types_validator.BlockIDFlag? blockIdFlag;

  const ExtendedVoteInfo({
    this.validator,
    this.voteExtension,
    this.extensionSignature,
    this.blockIdFlag,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.bytes(4),
        ProtoFieldConfig.enumType(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    validator,
    voteExtension,
    extensionSignature,
    blockIdFlag,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'validator': validator?.toJson(),
      'vote_extension': switch (voteExtension) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'extension_signature': switch (extensionSignature) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'block_id_flag': blockIdFlag?.protoName,
    };
  }

  factory ExtendedVoteInfo.fromJson(Map<String, dynamic> json) {
    return ExtendedVoteInfo(
      validator: json.valueTo<Validator?, Map<String, dynamic>>(
        key: 'validator',
        parse: (v) => Validator.fromJson(v),
        acceptCamelCase: true,
      ),
      voteExtension: json.valueAsBytes<List<int>?>(
        'vote_extension',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      extensionSignature: json.valueAsBytes<List<int>?>(
        'extension_signature',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      blockIdFlag: json
          .valueTo<tendermint_types_validator.BlockIDFlag?, Object?>(
            key: 'block_id_flag',
            parse: (v) => tendermint_types_validator.BlockIDFlag.from(v),
          ),
    );
  }

  factory ExtendedVoteInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ExtendedVoteInfo(
      validator: decode.messageTo<Validator?>(
        1,
        (b) => Validator.deserialize(b),
      ),
      voteExtension: decode.getBytes<List<int>?>(3),
      extensionSignature: decode.getBytes<List<int>?>(4),
      blockIdFlag: decode.getEnum<tendermint_types_validator.BlockIDFlag?>(
        5,
        tendermint_types_validator.BlockIDFlag.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciExtendedVoteInfo;
}

class Misbehavior extends CosmosProtoMessage {
  final MisbehaviorType? type;

  /// The offending validator
  final Validator? validator;

  /// The height when the offense occurred
  final BigInt? height;

  /// The corresponding time where the offense occurred
  final google_protobuf_timestamp.Timestamp? time;

  /// Total voting power of the validator set in case the ABCI application does
  /// not store historical validators.
  /// https://github.com/tendermint/tendermint/issues/4581
  final BigInt? totalVotingPower;

  const Misbehavior({
    this.type,
    this.validator,
    this.height,
    this.time,
    this.totalVotingPower,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.enumType(1),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.int64(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    type,
    validator,
    height,
    time,
    totalVotingPower,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type?.protoName,
      'validator': validator?.toJson(),
      'height': height?.toString(),
      'time': time?.toRfc3339(),
      'total_voting_power': totalVotingPower?.toString(),
    };
  }

  factory Misbehavior.fromJson(Map<String, dynamic> json) {
    return Misbehavior(
      type: json.valueTo<MisbehaviorType?, Object?>(
        key: 'type',
        parse: (v) => MisbehaviorType.from(v),
      ),
      validator: json.valueTo<Validator?, Map<String, dynamic>>(
        key: 'validator',
        parse: (v) => Validator.fromJson(v),
        acceptCamelCase: true,
      ),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      time: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      totalVotingPower: json.valueAsBigInt<BigInt?>(
        'total_voting_power',
        acceptCamelCase: true,
      ),
    );
  }

  factory Misbehavior.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Misbehavior(
      type: decode.getEnum<MisbehaviorType?>(1, MisbehaviorType.values),
      validator: decode.messageTo<Validator?>(
        2,
        (b) => Validator.deserialize(b),
      ),
      height: decode.getBigInt<BigInt?>(3),
      time: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        4,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      totalVotingPower: decode.getBigInt<BigInt?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciMisbehavior;
}

/// ----------------------------------------
/// State Sync Types
class Snapshot extends CosmosProtoMessage {
  final BigInt? height;

  /// The height at which the snapshot was taken
  final int? format;

  /// The application-specific snapshot format
  final int? chunks;

  /// Number of chunks in the snapshot
  final List<int>? hash;

  /// Arbitrary snapshot hash, equal only if identical
  final List<int>? metadata;

  const Snapshot({
    this.height,
    this.format,
    this.chunks,
    this.hash,
    this.metadata,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.uint32(2),
        ProtoFieldConfig.uint32(3),
        ProtoFieldConfig.bytes(4),
        ProtoFieldConfig.bytes(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [height, format, chunks, hash, metadata];

  @override
  Map<String, dynamic> toJson() {
    return {
      'height': height?.toString(),
      'format': format,
      'chunks': chunks,
      'hash': switch (hash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'metadata': switch (metadata) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory Snapshot.fromJson(Map<String, dynamic> json) {
    return Snapshot(
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      format: json.valueAsInt<int?>('format', acceptCamelCase: true),
      chunks: json.valueAsInt<int?>('chunks', acceptCamelCase: true),
      hash: json.valueAsBytes<List<int>?>(
        'hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      metadata: json.valueAsBytes<List<int>?>(
        'metadata',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory Snapshot.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Snapshot(
      height: decode.getBigInt<BigInt?>(1),
      format: decode.getInt<int?>(2),
      chunks: decode.getInt<int?>(3),
      hash: decode.getBytes<List<int>?>(4),
      metadata: decode.getBytes<List<int>?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintAbciSnapshot;
}
