import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;

/// IncentiveRecord is the high-level struct we use to deal with an independent
/// incentive being distributed on a pool. Note that PoolId, Denom, and MinUptime
/// are included in the key so we avoid storing them in state, hence the
/// distinction between IncentiveRecord and IncentiveRecordBody.
class IncentiveRecord extends CosmosProtoMessage {
  /// incentive_id is the id uniquely identifying this incentive record.
  final BigInt? incentiveId;

  final BigInt? poolId;

  /// incentive record body holds necessary
  final IncentiveRecordBody? incentiveRecordBody;

  /// min_uptime is the minimum uptime required for liquidity to qualify for this
  /// incentive. It should be always be one of the supported uptimes in
  /// types.SupportedUptimes
  final google_protobuf_duration.Duration? minUptime;

  const IncentiveRecord({
    this.incentiveId,
    this.poolId,
    this.incentiveRecordBody,
    this.minUptime,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.message(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    incentiveId,
    poolId,
    incentiveRecordBody,
    minUptime,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'incentive_id': config.encodeBigint(incentiveId),
      'pool_id': config.encodeBigint(poolId),
      'incentive_record_body': config.encodeMessage(incentiveRecordBody),
      'min_uptime': minUptime?.encodeString(asNanos: true),
    };
  }

  factory IncentiveRecord.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return IncentiveRecord(
      incentiveId: json.valueAsBigInt<BigInt?>(
        'incentive_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      incentiveRecordBody: json.valueTo<IncentiveRecordBody?, Object>(
        key: 'incentive_record_body',
        parse:
            (v) => IncentiveRecordBody.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minUptime: json.valueTo<google_protobuf_duration.Duration?, Object>(
        key: 'min_uptime',
        parse:
            (v) => google_protobuf_duration.Duration.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory IncentiveRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return IncentiveRecord(
      incentiveId: decode.getBigInt<BigInt?>(1),
      poolId: decode.getBigInt<BigInt?>(2),
      incentiveRecordBody: decode.messageTo<IncentiveRecordBody?>(
        4,
        (b) => IncentiveRecordBody.deserialize(b),
      ),
      minUptime: decode.messageTo<google_protobuf_duration.Duration?>(
        5,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1IncentiveRecord;
}

/// IncentiveRecordBody represents the body stored in state for each individual
/// record.
class IncentiveRecordBody extends CosmosProtoMessage {
  /// remaining_coin is the total amount of incentives to be distributed
  final cosmos_base_v1beta1_coin.DecCoin? remainingCoin;

  /// emission_rate is the incentive emission rate per second
  final String? emissionRate;

  /// start_time is the time when the incentive starts distributing
  final google_protobuf_timestamp.Timestamp? startTime;

  const IncentiveRecordBody({
    this.remainingCoin,
    this.emissionRate,
    this.startTime,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [remainingCoin, emissionRate, startTime];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'remaining_coin': config.encodeMessage(remainingCoin),
      'emission_rate': emissionRate,
      'start_time': startTime?.toRfc3339(),
    };
  }

  factory IncentiveRecordBody.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return IncentiveRecordBody(
      remainingCoin: json.valueTo<cosmos_base_v1beta1_coin.DecCoin?, Object>(
        key: 'remaining_coin',
        parse:
            (v) => cosmos_base_v1beta1_coin.DecCoin.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      emissionRate: json.valueAsString<String?>(
        'emission_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      startTime: json.valueTo<google_protobuf_timestamp.Timestamp?, Object>(
        key: 'start_time',
        parse:
            (v) => google_protobuf_timestamp.Timestamp.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory IncentiveRecordBody.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return IncentiveRecordBody(
      remainingCoin: decode.messageTo<cosmos_base_v1beta1_coin.DecCoin?>(
        1,
        (b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b),
      ),
      emissionRate: decode.getString<String?>(2),
      startTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        3,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1IncentiveRecordBody;
}
