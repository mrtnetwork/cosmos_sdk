import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;

/// ChainType defines the type of chain.
enum BatchInfoChainType implements ProtoEnumVariant {
  /// Unspecified chain type.
  unspecified(0, 'UNSPECIFIED'),

  /// The chain type of the initia chain.
  initia(1, 'INITIA'),

  /// The chain type of the celestia chain.
  celestia(2, 'CELESTIA');

  const BatchInfoChainType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static BatchInfoChainType fromValue(int? value) {
    return BatchInfoChainType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "BatchInfoChainType",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static BatchInfoChainType from(Object? value) {
    return BatchInfoChainType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "BatchInfoChainType",
                value: value,
              ),
    );
  }
}

/// Params defines the set of ophost parameters.
class Params extends CosmosProtoMessage {
  /// The amount to be paid by l2 creator.
  final List<cosmos_base_v1beta1_coin.Coin> registrationFee;

  const Params({this.registrationFee = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionString(name: "amino.name", value: "ophost/Params")],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [registrationFee];

  @override
  Map<String, dynamic> toJson() {
    return {
      'registration_fee': registrationFee.map((e) => e.toJson()).toList(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      registrationFee:
          (json.valueEnsureAsList<dynamic>(
                'registration_fee',
                acceptCamelCase: true,
              ))
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
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      registrationFee:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1Params;
}

/// BridgeConfig defines the set of bridge config.
class BridgeConfig extends CosmosProtoMessage {
  /// The address of the challenger.
  final String? challenger;

  /// The address of the proposer.
  final String? proposer;

  /// The information about batch submission.
  final BatchInfo? batchInfo;

  /// The time interval at which checkpoints must be submitted.
  /// NOTE: this param is currently not used, but will be used for challenge in future.
  final google_protobuf_duration.Duration? submissionInterval;

  /// The minimum time duration that must elapse before a withdrawal can be finalized.
  final google_protobuf_duration.Duration? finalizationPeriod;

  /// The the first l2 block will be recorded on l1.
  final BigInt? submissionStartHeight;

  /// oracle_enabled is a flag to enable oracle.
  final bool? oracleEnabled;

  /// Normally it is IBC channelID for permissioned IBC relayer.
  /// DEPRECATED: This field is deprecated and kept for backward compatibility.
  /// Use channel_id instead.
  final List<int>? metadata;

  /// bridge_disabled is a flag to disable the bridge.
  final bool? bridgeDisabled;

  /// bridge_disabled_at is the timestamp when the bridge is disabled.
  final google_protobuf_timestamp.Timestamp? bridgeDisabledAt;

  /// attestor_set is the set of attestors.
  final List<Attestor> attestorSet;

  /// channel_id is the IBC channel ID for the opinit port, used for relaying attestor set updates and oracle data to L2.
  final String? channelId;

  const BridgeConfig({
    this.challenger,
    this.proposer,
    this.batchInfo,
    this.submissionInterval,
    this.finalizationPeriod,
    this.submissionStartHeight,
    this.oracleEnabled,
    this.metadata,
    this.bridgeDisabled,
    this.bridgeDisabledAt,
    this.attestorSet = const [],
    this.channelId,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          4,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          5,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.uint64(6),
        ProtoFieldConfig.bool(7),
        ProtoFieldConfig.bytes(8),
        ProtoFieldConfig.bool(9),
        ProtoFieldConfig.message(
          10,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 11,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(12),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    challenger,
    proposer,
    batchInfo,
    submissionInterval,
    finalizationPeriod,
    submissionStartHeight,
    oracleEnabled,
    metadata,
    bridgeDisabled,
    bridgeDisabledAt,
    attestorSet,
    channelId,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'challenger': challenger,
      'proposer': proposer,
      'batch_info': batchInfo?.toJson(),
      'submission_interval': submissionInterval?.encodeString(asNanos: true),
      'finalization_period': finalizationPeriod?.encodeString(asNanos: true),
      'submission_start_height': submissionStartHeight?.toString(),
      'oracle_enabled': oracleEnabled,
      'metadata': switch (metadata) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'bridge_disabled': bridgeDisabled,
      'bridge_disabled_at': bridgeDisabledAt?.toRfc3339(),
      'attestor_set': attestorSet.map((e) => e.toJson()).toList(),
      'channel_id': channelId,
    };
  }

  factory BridgeConfig.fromJson(Map<String, dynamic> json) {
    return BridgeConfig(
      challenger: json.valueAsString<String?>(
        'challenger',
        acceptCamelCase: true,
      ),
      proposer: json.valueAsString<String?>('proposer', acceptCamelCase: true),
      batchInfo: json.valueTo<BatchInfo?, Map<String, dynamic>>(
        key: 'batch_info',
        parse: (v) => BatchInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      submissionInterval: json
          .valueTo<google_protobuf_duration.Duration?, String>(
            key: 'submission_interval',
            parse: (v) => google_protobuf_duration.Duration.fromString(v),
            acceptCamelCase: true,
          ),
      finalizationPeriod: json
          .valueTo<google_protobuf_duration.Duration?, String>(
            key: 'finalization_period',
            parse: (v) => google_protobuf_duration.Duration.fromString(v),
            acceptCamelCase: true,
          ),
      submissionStartHeight: json.valueAsBigInt<BigInt?>(
        'submission_start_height',
        acceptCamelCase: true,
      ),
      oracleEnabled: json.valueAsBool<bool?>(
        'oracle_enabled',
        acceptCamelCase: true,
      ),
      metadata: json.valueAsBytes<List<int>?>(
        'metadata',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      bridgeDisabled: json.valueAsBool<bool?>(
        'bridge_disabled',
        acceptCamelCase: true,
      ),
      bridgeDisabledAt: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'bridge_disabled_at',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
      attestorSet:
          (json.valueEnsureAsList<dynamic>(
                'attestor_set',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<Attestor, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Attestor.fromJson(v),
                ),
              )
              .toList(),
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory BridgeConfig.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BridgeConfig(
      challenger: decode.getString<String?>(1),
      proposer: decode.getString<String?>(2),
      batchInfo: decode.messageTo<BatchInfo?>(
        3,
        (b) => BatchInfo.deserialize(b),
      ),
      submissionInterval: decode.messageTo<google_protobuf_duration.Duration?>(
        4,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
      finalizationPeriod: decode.messageTo<google_protobuf_duration.Duration?>(
        5,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
      submissionStartHeight: decode.getBigInt<BigInt?>(6),
      oracleEnabled: decode.getBool<bool?>(7),
      metadata: decode.getBytes<List<int>?>(8),
      bridgeDisabled: decode.getBool<bool?>(9),
      bridgeDisabledAt: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        10,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      attestorSet:
          decode
              .getListOfBytes(11)
              .map((b) => Attestor.deserialize(b))
              .toList(),
      channelId: decode.getString<String?>(12),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1BridgeConfig;
}

/// BatchInfo defines the set of batch information.
class BatchInfo extends CosmosProtoMessage {
  /// The address of the batch submitter.
  final String? submitter;

  /// The target chain type.
  final BatchInfoChainType? chainType;

  const BatchInfo({this.submitter, this.chainType});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.enumType(2)],
    );
  }

  @override
  List<Object?> get protoValues => [submitter, chainType];

  @override
  Map<String, dynamic> toJson() {
    return {'submitter': submitter, 'chain_type': chainType?.protoName};
  }

  factory BatchInfo.fromJson(Map<String, dynamic> json) {
    return BatchInfo(
      submitter: json.valueAsString<String?>(
        'submitter',
        acceptCamelCase: true,
      ),
      chainType: json.valueTo<BatchInfoChainType?, Object?>(
        key: 'chain_type',
        parse: (v) => BatchInfoChainType.from(v),
      ),
    );
  }

  factory BatchInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BatchInfo(
      submitter: decode.getString<String?>(1),
      chainType: decode.getEnum<BatchInfoChainType?>(
        2,
        BatchInfoChainType.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1BatchInfo;
}

/// TokenPair defines l1 and l2 token pair
class TokenPair extends CosmosProtoMessage {
  final String? l1Denom;

  final String? l2Denom;

  const TokenPair({this.l1Denom, this.l2Denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [l1Denom, l2Denom];

  @override
  Map<String, dynamic> toJson() {
    return {'l1_denom': l1Denom, 'l2_denom': l2Denom};
  }

  factory TokenPair.fromJson(Map<String, dynamic> json) {
    return TokenPair(
      l1Denom: json.valueAsString<String?>('l1_denom', acceptCamelCase: true),
      l2Denom: json.valueAsString<String?>('l2_denom', acceptCamelCase: true),
    );
  }

  factory TokenPair.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TokenPair(
      l1Denom: decode.getString<String?>(1),
      l2Denom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1TokenPair;
}

/// Output is a l2 block submitted by proposer.
class Output extends CosmosProtoMessage {
  /// Hash of the l2 output.
  final List<int>? outputRoot;

  /// The l1 block number that the output root was submitted in.
  final BigInt? l1BlockNumber;

  /// Timestamp of the l1 block that the output root was submitted in.
  final google_protobuf_timestamp.Timestamp? l1BlockTime;

  /// The l2 block number that the output root was submitted in.
  final BigInt? l2BlockNumber;

  const Output({
    this.outputRoot,
    this.l1BlockNumber,
    this.l1BlockTime,
    this.l2BlockNumber,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.uint64(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    outputRoot,
    l1BlockNumber,
    l1BlockTime,
    l2BlockNumber,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'output_root': switch (outputRoot) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'l1_block_number': l1BlockNumber?.toString(),
      'l1_block_time': l1BlockTime?.toRfc3339(),
      'l2_block_number': l2BlockNumber?.toString(),
    };
  }

  factory Output.fromJson(Map<String, dynamic> json) {
    return Output(
      outputRoot: json.valueAsBytes<List<int>?>(
        'output_root',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      l1BlockNumber: json.valueAsBigInt<BigInt?>(
        'l1_block_number',
        acceptCamelCase: true,
      ),
      l1BlockTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'l1_block_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      l2BlockNumber: json.valueAsBigInt<BigInt?>(
        'l2_block_number',
        acceptCamelCase: true,
      ),
    );
  }

  factory Output.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Output(
      outputRoot: decode.getBytes<List<int>?>(1),
      l1BlockNumber: decode.getBigInt<BigInt?>(2),
      l1BlockTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        3,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      l2BlockNumber: decode.getBigInt<BigInt?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1Output;
}

/// BatchInfoWithOutput defines the batch information with output.
class BatchInfoWithOutput extends CosmosProtoMessage {
  final BatchInfo? batchInfo;

  final Output? output;

  const BatchInfoWithOutput({this.batchInfo, this.output});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [batchInfo, output];

  @override
  Map<String, dynamic> toJson() {
    return {'batch_info': batchInfo?.toJson(), 'output': output?.toJson()};
  }

  factory BatchInfoWithOutput.fromJson(Map<String, dynamic> json) {
    return BatchInfoWithOutput(
      batchInfo: json.valueTo<BatchInfo?, Map<String, dynamic>>(
        key: 'batch_info',
        parse: (v) => BatchInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      output: json.valueTo<Output?, Map<String, dynamic>>(
        key: 'output',
        parse: (v) => Output.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory BatchInfoWithOutput.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BatchInfoWithOutput(
      batchInfo: decode.messageTo<BatchInfo?>(
        1,
        (b) => BatchInfo.deserialize(b),
      ),
      output: decode.messageTo<Output?>(2, (b) => Output.deserialize(b)),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1BatchInfoWithOutput;
}

/// MigrationInfo defines the information for migration.
class MigrationInfo extends CosmosProtoMessage {
  /// BridgeID is the id of the bridge.
  final BigInt? bridgeId;

  /// IBC ChannelID is the channel id of the ibc.
  final String? ibcChannelId;

  /// IBC PortID is the port id of the ibc.
  final String? ibcPortId;

  /// L1Denom is the denom of the l1.
  final String? l1Denom;

  const MigrationInfo({
    this.bridgeId,
    this.ibcChannelId,
    this.ibcPortId,
    this.l1Denom,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [bridgeId, ibcChannelId, ibcPortId, l1Denom];

  @override
  Map<String, dynamic> toJson() {
    return {
      'bridge_id': bridgeId?.toString(),
      'ibc_channel_id': ibcChannelId,
      'ibc_port_id': ibcPortId,
      'l1_denom': l1Denom,
    };
  }

  factory MigrationInfo.fromJson(Map<String, dynamic> json) {
    return MigrationInfo(
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      ibcChannelId: json.valueAsString<String?>(
        'ibc_channel_id',
        acceptCamelCase: true,
      ),
      ibcPortId: json.valueAsString<String?>(
        'ibc_port_id',
        acceptCamelCase: true,
      ),
      l1Denom: json.valueAsString<String?>('l1_denom', acceptCamelCase: true),
    );
  }

  factory MigrationInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MigrationInfo(
      bridgeId: decode.getBigInt<BigInt?>(1),
      ibcChannelId: decode.getString<String?>(2),
      ibcPortId: decode.getString<String?>(3),
      l1Denom: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MigrationInfo;
}

/// Attestor defines an attestor in the bridge.
class Attestor extends CosmosProtoMessage {
  /// The validator operator address of the attestor.
  final String? operatorAddress;

  /// The consensus pubkey of the attestor.
  final google_protobuf_any.Any? consensusPubkey;

  /// The moniker of the attestor.
  final String? moniker;

  const Attestor({this.operatorAddress, this.consensusPubkey, this.moniker});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "ophost/Attestor"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [operatorAddress, consensusPubkey, moniker];

  @override
  Map<String, dynamic> toJson() {
    return {
      'operator_address': operatorAddress,
      'consensus_pubkey': consensusPubkey?.toJson(),
      'moniker': moniker,
    };
  }

  factory Attestor.fromJson(Map<String, dynamic> json) {
    return Attestor(
      operatorAddress: json.valueAsString<String?>(
        'operator_address',
        acceptCamelCase: true,
      ),
      consensusPubkey: json
          .valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
            key: 'consensus_pubkey',
            parse: (v) => google_protobuf_any.Any.fromJson(v),
            acceptCamelCase: true,
          ),
      moniker: json.valueAsString<String?>('moniker', acceptCamelCase: true),
    );
  }

  factory Attestor.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Attestor(
      operatorAddress: decode.getString<String?>(1),
      consensusPubkey: decode.messageTo<google_protobuf_any.Any?>(
        2,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      moniker: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1Attestor;
}

/// OraclePriceHash defines the hash of all oracle prices for a bridge.
/// This is computed and stored in EndBlock to enable batched oracle price relaying.
class OraclePriceHash extends CosmosProtoMessage {
  /// hash is the hash of all oracle prices for the bridge.
  final List<int>? hash;

  /// l1_block_height is the L1 block height at which this hash was computed.
  final BigInt? l1BlockHeight;

  /// l1_block_time is the L1 block timestamp when this hash was computed, in unix nanoseconds.
  final BigInt? l1BlockTime;

  const OraclePriceHash({this.hash, this.l1BlockHeight, this.l1BlockTime});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.int64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [hash, l1BlockHeight, l1BlockTime];

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
      'l1_block_height': l1BlockHeight?.toString(),
      'l1_block_time': l1BlockTime?.toString(),
    };
  }

  factory OraclePriceHash.fromJson(Map<String, dynamic> json) {
    return OraclePriceHash(
      hash: json.valueAsBytes<List<int>?>(
        'hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      l1BlockHeight: json.valueAsBigInt<BigInt?>(
        'l1_block_height',
        acceptCamelCase: true,
      ),
      l1BlockTime: json.valueAsBigInt<BigInt?>(
        'l1_block_time',
        acceptCamelCase: true,
      ),
    );
  }

  factory OraclePriceHash.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OraclePriceHash(
      hash: decode.getBytes<List<int>?>(1),
      l1BlockHeight: decode.getBigInt<BigInt?>(2),
      l1BlockTime: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1OraclePriceHash;
}
