import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/osmosis/lockup/src/lock.dart"
    as osmosis_lockup_lock;

class MsgLockTokens extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgLockTokensResponse>,
        ICosmosProtoAminoMessage {
  final String? owner;

  final google_protobuf_duration.Duration? duration;

  final List<cosmos_base_v1beta1_coin.Coin> coins;

  const MsgLockTokens({this.owner, this.duration, this.coins = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/lockup/lock-tokens",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "owner"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [owner, duration, coins];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'owner': owner,
      'duration': duration?.encodeString(asNanos: true),
      'coins': coins.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory MsgLockTokens.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgLockTokens(
      owner: json.valueAsString<String?>(
        'owner',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      duration: json.valueTo<google_protobuf_duration.Duration?, Object>(
        key: 'duration',
        parse:
            (v) => google_protobuf_duration.Duration.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      coins:
          (json.valueEnsureAsList<dynamic>(
                'coins',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory MsgLockTokens.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgLockTokens(
      owner: decode.getString<String?>(1),
      duration: decode.messageTo<google_protobuf_duration.Duration?>(
        2,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
      coins:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupMsgLockTokens;
  @override
  MsgLockTokensResponse onServiceResponse(List<int> bytes) {
    return MsgLockTokensResponse.deserialize(bytes);
  }

  @override
  MsgLockTokensResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgLockTokensResponse.fromJson(json);
  }
}

class MsgLockTokensResponse extends CosmosProtoMessage {
  final BigInt? id;

  const MsgLockTokensResponse({this.id});

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
  List<Object?> get protoValues => [id];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'ID': config.encodeBigint(id)};
  }

  factory MsgLockTokensResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgLockTokensResponse(
      id: json.valueAsBigInt<BigInt?>(
        'ID',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgLockTokensResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgLockTokensResponse(id: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupMsgLockTokensResponse;
}

class MsgBeginUnlockingAll extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgBeginUnlockingAllResponse>,
        ICosmosProtoAminoMessage {
  final String? owner;

  const MsgBeginUnlockingAll({this.owner});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/lockup/begin-unlock-tokens",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "owner"),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [owner];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'owner': owner};
  }

  factory MsgBeginUnlockingAll.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgBeginUnlockingAll(
      owner: json.valueAsString<String?>(
        'owner',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgBeginUnlockingAll.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBeginUnlockingAll(owner: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupMsgBeginUnlockingAll;
  @override
  MsgBeginUnlockingAllResponse onServiceResponse(List<int> bytes) {
    return MsgBeginUnlockingAllResponse.deserialize(bytes);
  }

  @override
  MsgBeginUnlockingAllResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgBeginUnlockingAllResponse.fromJson(json);
  }
}

class MsgBeginUnlockingAllResponse extends CosmosProtoMessage {
  final List<osmosis_lockup_lock.PeriodLock> unlocks;

  const MsgBeginUnlockingAllResponse({this.unlocks = const []});

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
  List<Object?> get protoValues => [unlocks];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'unlocks': unlocks.map((e) => config.encodeMessage(e)).toList()};
  }

  factory MsgBeginUnlockingAllResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgBeginUnlockingAllResponse(
      unlocks:
          (json.valueEnsureAsList<dynamic>(
                'unlocks',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<osmosis_lockup_lock.PeriodLock, Object>(
                      value: e,
                      parse:
                          (v) => osmosis_lockup_lock.PeriodLock.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory MsgBeginUnlockingAllResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBeginUnlockingAllResponse(
      unlocks:
          decode
              .getListOfBytes(1)
              .map((b) => osmosis_lockup_lock.PeriodLock.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupMsgBeginUnlockingAllResponse;
}

class MsgBeginUnlocking extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgBeginUnlockingResponse>,
        ICosmosProtoAminoMessage {
  final String? owner;

  final BigInt? id;

  /// Amount of unlocking coins. Unlock all if not set.
  final List<cosmos_base_v1beta1_coin.Coin> coins;

  const MsgBeginUnlocking({this.owner, this.id, this.coins = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/lockup/begin-unlock-period-lock",
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
  List<Object?> get protoValues => [owner, id, coins];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'owner': owner,
      'ID': config.encodeBigint(id),
      'coins': coins.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory MsgBeginUnlocking.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgBeginUnlocking(
      owner: json.valueAsString<String?>(
        'owner',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      id: json.valueAsBigInt<BigInt?>(
        'ID',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      coins:
          (json.valueEnsureAsList<dynamic>(
                'coins',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory MsgBeginUnlocking.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBeginUnlocking(
      owner: decode.getString<String?>(1),
      id: decode.getBigInt<BigInt?>(2),
      coins:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupMsgBeginUnlocking;
  @override
  MsgBeginUnlockingResponse onServiceResponse(List<int> bytes) {
    return MsgBeginUnlockingResponse.deserialize(bytes);
  }

  @override
  MsgBeginUnlockingResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgBeginUnlockingResponse.fromJson(json);
  }
}

class MsgBeginUnlockingResponse extends CosmosProtoMessage {
  final bool? success;

  final BigInt? unlockingLockID;

  const MsgBeginUnlockingResponse({this.success, this.unlockingLockID});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bool(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [success, unlockingLockID];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'success': success,
      'unlockingLockID': config.encodeBigint(unlockingLockID),
    };
  }

  factory MsgBeginUnlockingResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgBeginUnlockingResponse(
      success: json.valueAsBool<bool?>(
        'success',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      unlockingLockID: json.valueAsBigInt<BigInt?>(
        'unlockingLockID',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgBeginUnlockingResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBeginUnlockingResponse(
      success: decode.getBool<bool?>(1),
      unlockingLockID: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupMsgBeginUnlockingResponse;
}

/// MsgExtendLockup extends the existing lockup's duration.
/// The new duration is longer than the original.
class MsgExtendLockup extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgExtendLockupResponse>,
        ICosmosProtoAminoMessage {
  final String? owner;

  final BigInt? id;

  /// duration to be set. fails if lower than the current duration, or is
  /// unlocking
  final google_protobuf_duration.Duration? duration;

  const MsgExtendLockup({this.owner, this.id, this.duration});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/lockup/extend-lockup",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "owner"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [owner, id, duration];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'owner': owner,
      'ID': config.encodeBigint(id),
      'duration': duration?.encodeString(asNanos: true),
    };
  }

  factory MsgExtendLockup.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgExtendLockup(
      owner: json.valueAsString<String?>(
        'owner',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      id: json.valueAsBigInt<BigInt?>(
        'ID',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      duration: json.valueTo<google_protobuf_duration.Duration?, Object>(
        key: 'duration',
        parse:
            (v) => google_protobuf_duration.Duration.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgExtendLockup.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExtendLockup(
      owner: decode.getString<String?>(1),
      id: decode.getBigInt<BigInt?>(2),
      duration: decode.messageTo<google_protobuf_duration.Duration?>(
        3,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupMsgExtendLockup;
  @override
  MsgExtendLockupResponse onServiceResponse(List<int> bytes) {
    return MsgExtendLockupResponse.deserialize(bytes);
  }

  @override
  MsgExtendLockupResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgExtendLockupResponse.fromJson(json);
  }
}

/// extend for other edit, e.g. cancel unlocking
class MsgExtendLockupResponse extends CosmosProtoMessage {
  final bool? success;

  const MsgExtendLockupResponse({this.success});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bool(1)],
    );
  }

  @override
  List<Object?> get protoValues => [success];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'success': success};
  }

  factory MsgExtendLockupResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgExtendLockupResponse(
      success: json.valueAsBool<bool?>(
        'success',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgExtendLockupResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExtendLockupResponse(success: decode.getBool<bool?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupMsgExtendLockupResponse;
}

/// MsgForceUnlock unlocks locks immediately for
/// addresses registered via governance.
class MsgForceUnlock extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgForceUnlockResponse>,
        ICosmosProtoAminoMessage {
  final String? owner;

  final BigInt? id;

  /// Amount of unlocking coins. Unlock all if not set.
  final List<cosmos_base_v1beta1_coin.Coin> coins;

  const MsgForceUnlock({this.owner, this.id, this.coins = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/lockup/force-unlock-tokens",
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
  List<Object?> get protoValues => [owner, id, coins];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'owner': owner,
      'ID': config.encodeBigint(id),
      'coins': coins.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory MsgForceUnlock.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgForceUnlock(
      owner: json.valueAsString<String?>(
        'owner',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      id: json.valueAsBigInt<BigInt?>(
        'ID',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      coins:
          (json.valueEnsureAsList<dynamic>(
                'coins',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory MsgForceUnlock.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgForceUnlock(
      owner: decode.getString<String?>(1),
      id: decode.getBigInt<BigInt?>(2),
      coins:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupMsgForceUnlock;
  @override
  MsgForceUnlockResponse onServiceResponse(List<int> bytes) {
    return MsgForceUnlockResponse.deserialize(bytes);
  }

  @override
  MsgForceUnlockResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgForceUnlockResponse.fromJson(json);
  }
}

class MsgForceUnlockResponse extends CosmosProtoMessage {
  final bool? success;

  const MsgForceUnlockResponse({this.success});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bool(1)],
    );
  }

  @override
  List<Object?> get protoValues => [success];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'success': success};
  }

  factory MsgForceUnlockResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgForceUnlockResponse(
      success: json.valueAsBool<bool?>(
        'success',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgForceUnlockResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgForceUnlockResponse(success: decode.getBool<bool?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupMsgForceUnlockResponse;
}

class MsgSetRewardReceiverAddress extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetRewardReceiverAddressResponse>,
        ICosmosProtoAminoMessage {
  final String? owner;

  final BigInt? lockID;

  final String? rewardReceiver;

  const MsgSetRewardReceiverAddress({
    this.owner,
    this.lockID,
    this.rewardReceiver,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/lockup/set-reward-receiver-address",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "owner"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [owner, lockID, rewardReceiver];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'owner': owner,
      'lockID': config.encodeBigint(lockID),
      'reward_receiver': rewardReceiver,
    };
  }

  factory MsgSetRewardReceiverAddress.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSetRewardReceiverAddress(
      owner: json.valueAsString<String?>(
        'owner',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lockID: json.valueAsBigInt<BigInt?>(
        'lockID',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      rewardReceiver: json.valueAsString<String?>(
        'reward_receiver',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgSetRewardReceiverAddress.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetRewardReceiverAddress(
      owner: decode.getString<String?>(1),
      lockID: decode.getBigInt<BigInt?>(2),
      rewardReceiver: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupMsgSetRewardReceiverAddress;
  @override
  MsgSetRewardReceiverAddressResponse onServiceResponse(List<int> bytes) {
    return MsgSetRewardReceiverAddressResponse.deserialize(bytes);
  }

  @override
  MsgSetRewardReceiverAddressResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetRewardReceiverAddressResponse.fromJson(json);
  }
}

class MsgSetRewardReceiverAddressResponse extends CosmosProtoMessage {
  final bool? success;

  const MsgSetRewardReceiverAddressResponse({this.success});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bool(1)],
    );
  }

  @override
  List<Object?> get protoValues => [success];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'success': success};
  }

  factory MsgSetRewardReceiverAddressResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSetRewardReceiverAddressResponse(
      success: json.valueAsBool<bool?>(
        'success',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgSetRewardReceiverAddressResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetRewardReceiverAddressResponse(
      success: decode.getBool<bool?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisLockupMsgSetRewardReceiverAddressResponse;
}
