import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// LockQueryType defines the type of the lock query that can
/// either be by duration or start time of the lock.
enum LockQueryType implements ProtoEnumVariant {
  byDuration(0, 'ByDuration'),
  byTime(1, 'ByTime'),
  noLock(2, 'NoLock'),
  byGroup(3, 'ByGroup');

  const LockQueryType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static LockQueryType fromValue(int? value) {
    return LockQueryType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(name: "LockQueryType", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static LockQueryType from(Object? value) {
    return LockQueryType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(name: "LockQueryType", value: value),
    );
  }
}

/// PeriodLock is a single lock unit by period defined by the x/lockup module.
/// It's a record of a locked coin at a specific time. It stores owner, duration,
/// unlock time and the number of coins locked. A state of a period lock is
/// created upon lock creation, and deleted once the lock has been matured after
/// the `duration` has passed since unbonding started.
class PeriodLock extends CosmosProtoMessage {
  /// ID is the unique id of the lock.
  /// The ID of the lock is decided upon lock creation, incrementing by 1 for
  /// every lock.
  final BigInt? id;

  /// Owner is the account address of the lock owner.
  /// Only the owner can modify the state of the lock.
  final String? owner;

  /// Duration is the time needed for a lock to mature after unlocking has
  /// started.
  final google_protobuf_duration.Duration? duration;

  /// EndTime refers to the time at which the lock would mature and get deleted.
  /// This value is first initialized when an unlock has started for the lock,
  /// end time being block time + duration.
  final google_protobuf_timestamp.Timestamp? endTime;

  /// Coins are the tokens locked within the lock, kept in the module account.
  final List<cosmos_base_v1beta1_coin.Coin> coins;

  /// Reward Receiver Address is the address that would be receiving rewards for
  /// the incentives for the lock. This is set to owner by default and can be
  /// changed via separate msg.
  final String? rewardReceiverAddress;

  const PeriodLock({
    this.id,
    this.owner,
    this.duration,
    this.endTime,
    this.coins = const [],
    this.rewardReceiverAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.string(6, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    id,
    owner,
    duration,
    endTime,
    coins,
    rewardReceiverAddress,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'ID': id?.toString(),
      'owner': owner,
      'duration': duration?.encodeString(asNanos: true),
      'end_time': endTime?.toRfc3339(),
      'coins': coins.map((e) => e.toJson()).toList(),
      'reward_receiver_address': rewardReceiverAddress,
    };
  }

  factory PeriodLock.fromJson(Map<String, dynamic> json) {
    return PeriodLock(
      id: json.valueAsBigInt<BigInt?>('ID', acceptCamelCase: true),
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      duration: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'duration',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
      ),
      endTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'end_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      coins:
          (json.valueEnsureAsList<dynamic>('coins', acceptCamelCase: true))
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
      rewardReceiverAddress: json.valueAsString<String?>(
        'reward_receiver_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory PeriodLock.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PeriodLock(
      id: decode.getBigInt<BigInt?>(1),
      owner: decode.getString<String?>(2),
      duration: decode.messageTo<google_protobuf_duration.Duration?>(
        3,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
      endTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        4,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      coins:
          decode
              .getListOfBytes(5)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      rewardReceiverAddress: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupPeriodLock;
}

/// QueryCondition is a struct used for querying locks upon different conditions.
/// Duration field and timestamp fields could be optional, depending on the
/// LockQueryType.
class QueryCondition extends CosmosProtoMessage {
  /// LockQueryType is a type of lock query, ByLockDuration | ByLockTime
  final LockQueryType? lockQueryType;

  /// Denom represents the token denomination we are looking to lock up
  final String? denom;

  /// Duration is used to query locks with longer duration than the specified
  /// duration. Duration field must not be nil when the lock query type is
  /// `ByLockDuration`.
  final google_protobuf_duration.Duration? duration;

  /// Timestamp is used by locks started before the specified duration.
  /// Timestamp field must not be nil when the lock query type is `ByLockTime`.
  /// Querying locks with timestamp is currently not implemented.
  final google_protobuf_timestamp.Timestamp? timestamp;

  const QueryCondition({
    this.lockQueryType,
    this.denom,
    this.duration,
    this.timestamp,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.enumType(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [lockQueryType, denom, duration, timestamp];

  @override
  Map<String, dynamic> toJson() {
    return {
      'lock_query_type': lockQueryType?.protoName,
      'denom': denom,
      'duration': duration?.encodeString(asNanos: true),
      'timestamp': timestamp?.toRfc3339(),
    };
  }

  factory QueryCondition.fromJson(Map<String, dynamic> json) {
    return QueryCondition(
      lockQueryType: json.valueTo<LockQueryType?, Object?>(
        key: 'lock_query_type',
        parse: (v) => LockQueryType.from(v),
      ),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      duration: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'duration',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
      ),
      timestamp: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'timestamp',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryCondition.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCondition(
      lockQueryType: decode.getEnum<LockQueryType?>(1, LockQueryType.values),
      denom: decode.getString<String?>(2),
      duration: decode.messageTo<google_protobuf_duration.Duration?>(
        3,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
      timestamp: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        4,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupQueryCondition;
}

/// SyntheticLock is creating virtual lockup where new denom is combination of
/// original denom and synthetic suffix. At the time of synthetic lockup creation
/// and deletion, accumulation store is also being updated and on querier side,
/// they can query as freely as native lockup.
class SyntheticLock extends CosmosProtoMessage {
  /// Underlying Lock ID is the underlying native lock's id for this synthetic
  /// lockup. A synthetic lock MUST have an underlying lock.
  final BigInt? underlyingLockId;

  /// SynthDenom is the synthetic denom that is a combination of
  /// gamm share + bonding status + validator address.
  final String? synthDenom;

  /// used for unbonding synthetic lockups, for active synthetic lockups, this
  /// value is set to uninitialized value
  final google_protobuf_timestamp.Timestamp? endTime;

  /// Duration is the duration for a synthetic lock to mature
  /// at the point of unbonding has started.
  final google_protobuf_duration.Duration? duration;

  const SyntheticLock({
    this.underlyingLockId,
    this.synthDenom,
    this.endTime,
    this.duration,
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
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    underlyingLockId,
    synthDenom,
    endTime,
    duration,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'underlying_lock_id': underlyingLockId?.toString(),
      'synth_denom': synthDenom,
      'end_time': endTime?.toRfc3339(),
      'duration': duration?.encodeString(asNanos: true),
    };
  }

  factory SyntheticLock.fromJson(Map<String, dynamic> json) {
    return SyntheticLock(
      underlyingLockId: json.valueAsBigInt<BigInt?>(
        'underlying_lock_id',
        acceptCamelCase: true,
      ),
      synthDenom: json.valueAsString<String?>(
        'synth_denom',
        acceptCamelCase: true,
      ),
      endTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'end_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      duration: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'duration',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory SyntheticLock.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SyntheticLock(
      underlyingLockId: decode.getBigInt<BigInt?>(1),
      synthDenom: decode.getString<String?>(2),
      endTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        3,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      duration: decode.messageTo<google_protobuf_duration.Duration?>(
        4,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupSyntheticLock;
}
