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
  Map<String, dynamic> toJson() {
    return {
      'incentive_id': incentiveId?.toString(),
      'pool_id': poolId?.toString(),
      'incentive_record_body': incentiveRecordBody?.toJson(),
      'min_uptime': minUptime?.encodeString(asNanos: true),
    };
  }

  factory IncentiveRecord.fromJson(Map<String, dynamic> json) {
    return IncentiveRecord(
      incentiveId: json.valueAsBigInt<BigInt?>(
        'incentive_id',
        acceptCamelCase: true,
      ),
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      incentiveRecordBody: json
          .valueTo<IncentiveRecordBody?, Map<String, dynamic>>(
            key: 'incentive_record_body',
            parse: (v) => IncentiveRecordBody.fromJson(v),
            acceptCamelCase: true,
          ),
      minUptime: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'min_uptime',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'remaining_coin': remainingCoin?.toJson(),
      'emission_rate': emissionRate,
      'start_time': startTime?.toRfc3339(),
    };
  }

  factory IncentiveRecordBody.fromJson(Map<String, dynamic> json) {
    return IncentiveRecordBody(
      remainingCoin: json
          .valueTo<cosmos_base_v1beta1_coin.DecCoin?, Map<String, dynamic>>(
            key: 'remaining_coin',
            parse: (v) => cosmos_base_v1beta1_coin.DecCoin.fromJson(v),
            acceptCamelCase: true,
          ),
      emissionRate: json.valueAsString<String?>(
        'emission_rate',
        acceptCamelCase: true,
      ),
      startTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'start_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
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
