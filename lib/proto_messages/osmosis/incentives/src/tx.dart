import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/osmosis/lockup/src/lock.dart"
    as osmosis_lockup_lock;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;

/// MsgCreateGauge creates a gauge to distribute rewards to users
class MsgCreateGauge extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateGaugeResponse>,
        ICosmosProtoAminoMessage {
  /// is_perpetual shows if it's a perpetual or non-perpetual gauge
  /// Non-perpetual gauges distribute their tokens equally per epoch while the
  /// gauge is in the active period. Perpetual gauges distribute all their tokens
  /// at a single time and only distribute their tokens again once the gauge is
  /// refilled
  final bool? isPerpetual;

  /// owner is the address of gauge creator
  final String? owner;

  /// distribute_to show which lock the gauge should distribute to by time
  /// duration or by timestamp
  final osmosis_lockup_lock.QueryCondition? distributeTo;

  /// coins are coin(s) to be distributed by the gauge
  final List<cosmos_base_v1beta1_coin.Coin> coins;

  /// start_time is the distribution start time
  final google_protobuf_timestamp.Timestamp? startTime;

  /// num_epochs_paid_over is the number of epochs distribution will be completed
  /// over
  final BigInt? numEpochsPaidOver;

  /// pool_id is the ID of the pool that the gauge is meant to be associated
  /// with. if pool_id is set, then the "QueryCondition.LockQueryType" must be
  /// "NoLock" with all other fields of the "QueryCondition.LockQueryType" struct
  /// unset, including "QueryCondition.Denom". However, note that, internally,
  /// the empty string in "QueryCondition.Denom" ends up being overwritten with
  /// incentivestypes.NoLockExternalGaugeDenom(&lt;pool-id&gt;) so that the gauges
  /// associated with a pool can be queried by this prefix if needed.
  final BigInt? poolId;

  const MsgCreateGauge({
    this.isPerpetual,
    this.owner,
    this.distributeTo,
    this.coins = const [],
    this.startTime,
    this.numEpochsPaidOver,
    this.poolId,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/incentives/create-gauge",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "owner"),
      ],
      fields: [
        ProtoFieldConfig.bool(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.message(5, options: const []),
        ProtoFieldConfig.uint64(6),
        ProtoFieldConfig.uint64(7),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    isPerpetual,
    owner,
    distributeTo,
    coins,
    startTime,
    numEpochsPaidOver,
    poolId,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'is_perpetual': isPerpetual,
      'owner': owner,
      'distribute_to': distributeTo?.toJson(),
      'coins': coins.map((e) => e.toJson()).toList(),
      'start_time': startTime?.toRfc3339(),
      'num_epochs_paid_over': numEpochsPaidOver?.toString(),
      'pool_id': poolId?.toString(),
    };
  }

  factory MsgCreateGauge.fromJson(Map<String, dynamic> json) {
    return MsgCreateGauge(
      isPerpetual: json.valueAsBool<bool?>(
        'is_perpetual',
        acceptCamelCase: true,
      ),
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      distributeTo: json
          .valueTo<osmosis_lockup_lock.QueryCondition?, Map<String, dynamic>>(
            key: 'distribute_to',
            parse: (v) => osmosis_lockup_lock.QueryCondition.fromJson(v),
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
      startTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'start_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      numEpochsPaidOver: json.valueAsBigInt<BigInt?>(
        'num_epochs_paid_over',
        acceptCamelCase: true,
      ),
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
    );
  }

  factory MsgCreateGauge.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateGauge(
      isPerpetual: decode.getBool<bool?>(1),
      owner: decode.getString<String?>(2),
      distributeTo: decode.messageTo<osmosis_lockup_lock.QueryCondition?>(
        3,
        (b) => osmosis_lockup_lock.QueryCondition.deserialize(b),
      ),
      coins:
          decode
              .getListOfBytes(4)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      startTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        5,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      numEpochsPaidOver: decode.getBigInt<BigInt?>(6),
      poolId: decode.getBigInt<BigInt?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesMsgCreateGauge;
  @override
  MsgCreateGaugeResponse onServiceResponse(List<int> bytes) {
    return MsgCreateGaugeResponse.deserialize(bytes);
  }

  @override
  MsgCreateGaugeResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgCreateGaugeResponse.fromJson(json);
  }
}

class MsgCreateGaugeResponse extends CosmosProtoMessage {
  const MsgCreateGaugeResponse();

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

  factory MsgCreateGaugeResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateGaugeResponse();
  }

  factory MsgCreateGaugeResponse.deserialize(List<int> bytes) {
    return MsgCreateGaugeResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesMsgCreateGaugeResponse;
}

/// MsgAddToGauge adds coins to a previously created gauge
class MsgAddToGauge extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgAddToGaugeResponse>,
        ICosmosProtoAminoMessage {
  /// owner is the gauge owner's address
  final String? owner;

  /// gauge_id is the ID of gauge that rewards are getting added to
  final BigInt? gaugeId;

  /// rewards are the coin(s) to add to gauge
  final List<cosmos_base_v1beta1_coin.Coin> rewards;

  const MsgAddToGauge({this.owner, this.gaugeId, this.rewards = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/incentives/add-to-gauge",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "owner"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [owner, gaugeId, rewards];

  @override
  Map<String, dynamic> toJson() {
    return {
      'owner': owner,
      'gauge_id': gaugeId?.toString(),
      'rewards': rewards.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgAddToGauge.fromJson(Map<String, dynamic> json) {
    return MsgAddToGauge(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      gaugeId: json.valueAsBigInt<BigInt?>('gauge_id', acceptCamelCase: true),
      rewards:
          (json.valueEnsureAsList<dynamic>('rewards', acceptCamelCase: true))
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

  factory MsgAddToGauge.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAddToGauge(
      owner: decode.getString<String?>(1),
      gaugeId: decode.getBigInt<BigInt?>(2),
      rewards:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesMsgAddToGauge;
  @override
  MsgAddToGaugeResponse onServiceResponse(List<int> bytes) {
    return MsgAddToGaugeResponse.deserialize(bytes);
  }

  @override
  MsgAddToGaugeResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgAddToGaugeResponse.fromJson(json);
  }
}

class MsgAddToGaugeResponse extends CosmosProtoMessage {
  const MsgAddToGaugeResponse();

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

  factory MsgAddToGaugeResponse.fromJson(Map<String, dynamic> json) {
    return MsgAddToGaugeResponse();
  }

  factory MsgAddToGaugeResponse.deserialize(List<int> bytes) {
    return MsgAddToGaugeResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesMsgAddToGaugeResponse;
}

/// MsgCreateGroup creates a group to distribute rewards to a group of pools
class MsgCreateGroup extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateGroupResponse>,
        ICosmosProtoAminoMessage {
  /// coins are the provided coins that the group will distribute
  final List<cosmos_base_v1beta1_coin.Coin> coins;

  /// num_epochs_paid_over is the number of epochs distribution will be completed
  /// in. 0 means it's perpetual
  final BigInt? numEpochsPaidOver;

  /// owner is the group owner's address
  final String? owner;

  /// pool_ids are the IDs of pools that the group is comprised of
  final List<BigInt> poolIds;

  const MsgCreateGroup({
    this.coins = const [],
    this.numEpochsPaidOver,
    this.owner,
    this.poolIds = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/incentives/create-group",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "owner"),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.uint64,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [coins, numEpochsPaidOver, owner, poolIds];

  @override
  Map<String, dynamic> toJson() {
    return {
      'coins': coins.map((e) => e.toJson()).toList(),
      'num_epochs_paid_over': numEpochsPaidOver?.toString(),
      'owner': owner,
      'pool_ids': poolIds.map((e) => e.toString()).toList(),
    };
  }

  factory MsgCreateGroup.fromJson(Map<String, dynamic> json) {
    return MsgCreateGroup(
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
      numEpochsPaidOver: json.valueAsBigInt<BigInt?>(
        'num_epochs_paid_over',
        acceptCamelCase: true,
      ),
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      poolIds:
          (json.valueEnsureAsList<dynamic>(
            'pool_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
    );
  }

  factory MsgCreateGroup.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateGroup(
      coins:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      numEpochsPaidOver: decode.getBigInt<BigInt?>(2),
      owner: decode.getString<String?>(3),
      poolIds: decode.getListOrEmpty<BigInt>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesMsgCreateGroup;
  @override
  MsgCreateGroupResponse onServiceResponse(List<int> bytes) {
    return MsgCreateGroupResponse.deserialize(bytes);
  }

  @override
  MsgCreateGroupResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgCreateGroupResponse.fromJson(json);
  }
}

class MsgCreateGroupResponse extends CosmosProtoMessage {
  /// group_id is the ID of the group that is created from this msg
  final BigInt? groupId;

  const MsgCreateGroupResponse({this.groupId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [groupId];

  @override
  Map<String, dynamic> toJson() {
    return {'group_id': groupId?.toString()};
  }

  factory MsgCreateGroupResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateGroupResponse(
      groupId: json.valueAsBigInt<BigInt?>('group_id', acceptCamelCase: true),
    );
  }

  factory MsgCreateGroupResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateGroupResponse(groupId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesMsgCreateGroupResponse;
}
