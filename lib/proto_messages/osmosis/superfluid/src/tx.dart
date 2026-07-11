import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;

class MsgSuperfluidDelegate extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSuperfluidDelegateResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final BigInt? lockId;

  final String? valAddr;

  const MsgSuperfluidDelegate({this.sender, this.lockId, this.valAddr});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/superfluid-delegate",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, lockId, valAddr];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'lock_id': lockId?.toString(),
      'val_addr': valAddr,
    };
  }

  factory MsgSuperfluidDelegate.fromJson(Map<String, dynamic> json) {
    return MsgSuperfluidDelegate(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      lockId: json.valueAsBigInt<BigInt?>('lock_id', acceptCamelCase: true),
      valAddr: json.valueAsString<String?>('val_addr', acceptCamelCase: true),
    );
  }

  factory MsgSuperfluidDelegate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSuperfluidDelegate(
      sender: decode.getString<String?>(1),
      lockId: decode.getBigInt<BigInt?>(2),
      valAddr: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidMsgSuperfluidDelegate;
  @override
  MsgSuperfluidDelegateResponse onServiceResponse(List<int> bytes) {
    return MsgSuperfluidDelegateResponse.deserialize(bytes);
  }

  @override
  MsgSuperfluidDelegateResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSuperfluidDelegateResponse.fromJson(json);
  }
}

class MsgSuperfluidDelegateResponse extends CosmosProtoMessage {
  const MsgSuperfluidDelegateResponse();

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

  factory MsgSuperfluidDelegateResponse.fromJson(Map<String, dynamic> json) {
    return MsgSuperfluidDelegateResponse();
  }

  factory MsgSuperfluidDelegateResponse.deserialize(List<int> bytes) {
    return MsgSuperfluidDelegateResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidMsgSuperfluidDelegateResponse;
}

class MsgSuperfluidUndelegate extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSuperfluidUndelegateResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final BigInt? lockId;

  const MsgSuperfluidUndelegate({this.sender, this.lockId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/superfluid-undelegate",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, lockId];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'lock_id': lockId?.toString()};
  }

  factory MsgSuperfluidUndelegate.fromJson(Map<String, dynamic> json) {
    return MsgSuperfluidUndelegate(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      lockId: json.valueAsBigInt<BigInt?>('lock_id', acceptCamelCase: true),
    );
  }

  factory MsgSuperfluidUndelegate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSuperfluidUndelegate(
      sender: decode.getString<String?>(1),
      lockId: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidMsgSuperfluidUndelegate;
  @override
  MsgSuperfluidUndelegateResponse onServiceResponse(List<int> bytes) {
    return MsgSuperfluidUndelegateResponse.deserialize(bytes);
  }

  @override
  MsgSuperfluidUndelegateResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSuperfluidUndelegateResponse.fromJson(json);
  }
}

class MsgSuperfluidUndelegateResponse extends CosmosProtoMessage {
  const MsgSuperfluidUndelegateResponse();

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

  factory MsgSuperfluidUndelegateResponse.fromJson(Map<String, dynamic> json) {
    return MsgSuperfluidUndelegateResponse();
  }

  factory MsgSuperfluidUndelegateResponse.deserialize(List<int> bytes) {
    return MsgSuperfluidUndelegateResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidMsgSuperfluidUndelegateResponse;
}

class MsgSuperfluidUnbondLock extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSuperfluidUnbondLockResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final BigInt? lockId;

  const MsgSuperfluidUnbondLock({this.sender, this.lockId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/superfluid-unbond-lock",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, lockId];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'lock_id': lockId?.toString()};
  }

  factory MsgSuperfluidUnbondLock.fromJson(Map<String, dynamic> json) {
    return MsgSuperfluidUnbondLock(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      lockId: json.valueAsBigInt<BigInt?>('lock_id', acceptCamelCase: true),
    );
  }

  factory MsgSuperfluidUnbondLock.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSuperfluidUnbondLock(
      sender: decode.getString<String?>(1),
      lockId: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidMsgSuperfluidUnbondLock;
  @override
  MsgSuperfluidUnbondLockResponse onServiceResponse(List<int> bytes) {
    return MsgSuperfluidUnbondLockResponse.deserialize(bytes);
  }

  @override
  MsgSuperfluidUnbondLockResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSuperfluidUnbondLockResponse.fromJson(json);
  }
}

class MsgSuperfluidUnbondLockResponse extends CosmosProtoMessage {
  const MsgSuperfluidUnbondLockResponse();

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

  factory MsgSuperfluidUnbondLockResponse.fromJson(Map<String, dynamic> json) {
    return MsgSuperfluidUnbondLockResponse();
  }

  factory MsgSuperfluidUnbondLockResponse.deserialize(List<int> bytes) {
    return MsgSuperfluidUnbondLockResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidMsgSuperfluidUnbondLockResponse;
}

class MsgSuperfluidUndelegateAndUnbondLock extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<
          MsgSuperfluidUndelegateAndUnbondLockResponse
        >,
        ICosmosProtoAminoMessage {
  final String? sender;

  final BigInt? lockId;

  /// Amount of unlocking coin.
  final cosmos_base_v1beta1_coin.Coin? coin;

  const MsgSuperfluidUndelegateAndUnbondLock({
    this.sender,
    this.lockId,
    this.coin,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/superfluid-undelegate-unbond-lock",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, lockId, coin];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'lock_id': lockId?.toString(),
      'coin': coin?.toJson(),
    };
  }

  factory MsgSuperfluidUndelegateAndUnbondLock.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgSuperfluidUndelegateAndUnbondLock(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      lockId: json.valueAsBigInt<BigInt?>('lock_id', acceptCamelCase: true),
      coin: json.valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
        key: 'coin',
        parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgSuperfluidUndelegateAndUnbondLock.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSuperfluidUndelegateAndUnbondLock(
      sender: decode.getString<String?>(1),
      lockId: decode.getBigInt<BigInt?>(2),
      coin: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLock;
  @override
  MsgSuperfluidUndelegateAndUnbondLockResponse onServiceResponse(
    List<int> bytes,
  ) {
    return MsgSuperfluidUndelegateAndUnbondLockResponse.deserialize(bytes);
  }

  @override
  MsgSuperfluidUndelegateAndUnbondLockResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSuperfluidUndelegateAndUnbondLockResponse.fromJson(json);
  }
}

class MsgSuperfluidUndelegateAndUnbondLockResponse extends CosmosProtoMessage {
  /// lock id of the new lock created for the remaining amount.
  /// returns the original lockid if the unlocked amount is equal to the
  /// original lock's amount.
  final BigInt? lockId;

  const MsgSuperfluidUndelegateAndUnbondLockResponse({this.lockId});

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
  List<Object?> get protoValues => [lockId];

  @override
  Map<String, dynamic> toJson() {
    return {'lock_id': lockId?.toString()};
  }

  factory MsgSuperfluidUndelegateAndUnbondLockResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgSuperfluidUndelegateAndUnbondLockResponse(
      lockId: json.valueAsBigInt<BigInt?>('lock_id', acceptCamelCase: true),
    );
  }

  factory MsgSuperfluidUndelegateAndUnbondLockResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSuperfluidUndelegateAndUnbondLockResponse(
      lockId: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLockResponse;
}

/// message MsgSuperfluidRedelegate {
/// string sender = 1 [ (gogoproto.moretags) = "yaml:\"sender\"" ];
/// uint64 lock_id = 2;
/// string new_val_addr = 3;
/// }
/// message MsgSuperfluidRedelegateResponse {}
/// MsgLockAndSuperfluidDelegate locks coins with the unbonding period duration,
/// and then does a superfluid lock from the newly created lockup, to the
/// specified validator addr.
class MsgLockAndSuperfluidDelegate extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgLockAndSuperfluidDelegateResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final List<cosmos_base_v1beta1_coin.Coin> coins;

  final String? valAddr;

  const MsgLockAndSuperfluidDelegate({
    this.sender,
    this.coins = const [],
    this.valAddr,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/lock-and-superfluid-delegate",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, coins, valAddr];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'coins': coins.map((e) => e.toJson()).toList(),
      'val_addr': valAddr,
    };
  }

  factory MsgLockAndSuperfluidDelegate.fromJson(Map<String, dynamic> json) {
    return MsgLockAndSuperfluidDelegate(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
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
      valAddr: json.valueAsString<String?>('val_addr', acceptCamelCase: true),
    );
  }

  factory MsgLockAndSuperfluidDelegate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgLockAndSuperfluidDelegate(
      sender: decode.getString<String?>(1),
      coins:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      valAddr: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidMsgLockAndSuperfluidDelegate;
  @override
  MsgLockAndSuperfluidDelegateResponse onServiceResponse(List<int> bytes) {
    return MsgLockAndSuperfluidDelegateResponse.deserialize(bytes);
  }

  @override
  MsgLockAndSuperfluidDelegateResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgLockAndSuperfluidDelegateResponse.fromJson(json);
  }
}

class MsgLockAndSuperfluidDelegateResponse extends CosmosProtoMessage {
  final BigInt? id;

  const MsgLockAndSuperfluidDelegateResponse({this.id});

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
  Map<String, dynamic> toJson() {
    return {'ID': id?.toString()};
  }

  factory MsgLockAndSuperfluidDelegateResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgLockAndSuperfluidDelegateResponse(
      id: json.valueAsBigInt<BigInt?>('ID', acceptCamelCase: true),
    );
  }

  factory MsgLockAndSuperfluidDelegateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgLockAndSuperfluidDelegateResponse(
      id: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidMsgLockAndSuperfluidDelegateResponse;
}

/// MsgCreateFullRangePositionAndSuperfluidDelegate creates a full range position
/// in a concentrated liquidity pool, then superfluid delegates.
class MsgCreateFullRangePositionAndSuperfluidDelegate extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<
          MsgCreateFullRangePositionAndSuperfluidDelegateResponse
        >,
        ICosmosProtoAminoMessage {
  final String? sender;

  final List<cosmos_base_v1beta1_coin.Coin> coins;

  final String? valAddr;

  final BigInt? poolId;

  const MsgCreateFullRangePositionAndSuperfluidDelegate({
    this.sender,
    this.coins = const [],
    this.valAddr,
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
          value: "osmosis/full-range-and-sf-delegate",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.uint64(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, coins, valAddr, poolId];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'coins': coins.map((e) => e.toJson()).toList(),
      'val_addr': valAddr,
      'pool_id': poolId?.toString(),
    };
  }

  factory MsgCreateFullRangePositionAndSuperfluidDelegate.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateFullRangePositionAndSuperfluidDelegate(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
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
      valAddr: json.valueAsString<String?>('val_addr', acceptCamelCase: true),
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
    );
  }

  factory MsgCreateFullRangePositionAndSuperfluidDelegate.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateFullRangePositionAndSuperfluidDelegate(
      sender: decode.getString<String?>(1),
      coins:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      valAddr: decode.getString<String?>(3),
      poolId: decode.getBigInt<BigInt?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidMsgCreateFullRangePositionAndSuperfluidDelegate;
  @override
  MsgCreateFullRangePositionAndSuperfluidDelegateResponse onServiceResponse(
    List<int> bytes,
  ) {
    return MsgCreateFullRangePositionAndSuperfluidDelegateResponse.deserialize(
      bytes,
    );
  }

  @override
  MsgCreateFullRangePositionAndSuperfluidDelegateResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateFullRangePositionAndSuperfluidDelegateResponse.fromJson(
      json,
    );
  }
}

class MsgCreateFullRangePositionAndSuperfluidDelegateResponse
    extends CosmosProtoMessage {
  final BigInt? lockID;

  final BigInt? positionID;

  const MsgCreateFullRangePositionAndSuperfluidDelegateResponse({
    this.lockID,
    this.positionID,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [lockID, positionID];

  @override
  Map<String, dynamic> toJson() {
    return {'lockID': lockID?.toString(), 'positionID': positionID?.toString()};
  }

  factory MsgCreateFullRangePositionAndSuperfluidDelegateResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateFullRangePositionAndSuperfluidDelegateResponse(
      lockID: json.valueAsBigInt<BigInt?>('lockID', acceptCamelCase: true),
      positionID: json.valueAsBigInt<BigInt?>(
        'positionID',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateFullRangePositionAndSuperfluidDelegateResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateFullRangePositionAndSuperfluidDelegateResponse(
      lockID: decode.getBigInt<BigInt?>(1),
      positionID: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidMsgCreateFullRangePositionAndSuperfluidDelegateResponse;
}

/// MsgUnPoolWhitelistedPool Unpools every lock the sender has, that is
/// associated with pool pool_id. If pool_id is not approved for unpooling by
/// governance, this is a no-op. Unpooling takes the locked gamm shares, and runs
/// "ExitPool" on it, to get the constituent tokens. e.g. z gamm/pool/1 tokens
/// ExitPools into constituent tokens x uatom, y uosmo. Then it creates a new
/// lock for every constituent token, with the duration associated with the lock.
/// If the lock was unbonding, the new lockup durations should be the time left
/// until unbond completion.
class MsgUnPoolWhitelistedPool extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUnPoolWhitelistedPoolResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final BigInt? poolId;

  const MsgUnPoolWhitelistedPool({this.sender, this.poolId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/unpool-whitelisted-pool",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, poolId];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'pool_id': poolId?.toString()};
  }

  factory MsgUnPoolWhitelistedPool.fromJson(Map<String, dynamic> json) {
    return MsgUnPoolWhitelistedPool(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
    );
  }

  factory MsgUnPoolWhitelistedPool.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUnPoolWhitelistedPool(
      sender: decode.getString<String?>(1),
      poolId: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidMsgUnPoolWhitelistedPool;
  @override
  MsgUnPoolWhitelistedPoolResponse onServiceResponse(List<int> bytes) {
    return MsgUnPoolWhitelistedPoolResponse.deserialize(bytes);
  }

  @override
  MsgUnPoolWhitelistedPoolResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUnPoolWhitelistedPoolResponse.fromJson(json);
  }
}

class MsgUnPoolWhitelistedPoolResponse extends CosmosProtoMessage {
  final List<BigInt> exitedLockIds;

  const MsgUnPoolWhitelistedPoolResponse({this.exitedLockIds = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.uint64,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [exitedLockIds];

  @override
  Map<String, dynamic> toJson() {
    return {'exited_lock_ids': exitedLockIds.map((e) => e.toString()).toList()};
  }

  factory MsgUnPoolWhitelistedPoolResponse.fromJson(Map<String, dynamic> json) {
    return MsgUnPoolWhitelistedPoolResponse(
      exitedLockIds:
          (json.valueEnsureAsList<dynamic>(
            'exited_lock_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
    );
  }

  factory MsgUnPoolWhitelistedPoolResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUnPoolWhitelistedPoolResponse(
      exitedLockIds: decode.getListOrEmpty<BigInt>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidMsgUnPoolWhitelistedPoolResponse;
}

/// =====================
/// MsgUnlockAndMigrateSharesToFullRangeConcentratedPosition
class MsgUnlockAndMigrateSharesToFullRangeConcentratedPosition
    extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<
          MsgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse
        >,
        ICosmosProtoAminoMessage {
  final String? sender;

  final BigInt? lockId;

  final cosmos_base_v1beta1_coin.Coin? sharesToMigrate;

  /// token_out_mins indicates minimum token to exit Balancer pool with.
  final List<cosmos_base_v1beta1_coin.Coin> tokenOutMins;

  const MsgUnlockAndMigrateSharesToFullRangeConcentratedPosition({
    this.sender,
    this.lockId,
    this.sharesToMigrate,
    this.tokenOutMins = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/unlock-and-migrate",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.int64(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    lockId,
    sharesToMigrate,
    tokenOutMins,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'lock_id': lockId?.toString(),
      'shares_to_migrate': sharesToMigrate?.toJson(),
      'token_out_mins': tokenOutMins.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgUnlockAndMigrateSharesToFullRangeConcentratedPosition.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgUnlockAndMigrateSharesToFullRangeConcentratedPosition(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      lockId: json.valueAsBigInt<BigInt?>('lock_id', acceptCamelCase: true),
      sharesToMigrate: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'shares_to_migrate',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      tokenOutMins:
          (json.valueEnsureAsList<dynamic>(
                'token_out_mins',
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

  factory MsgUnlockAndMigrateSharesToFullRangeConcentratedPosition.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUnlockAndMigrateSharesToFullRangeConcentratedPosition(
      sender: decode.getString<String?>(1),
      lockId: decode.getBigInt<BigInt?>(2),
      sharesToMigrate: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      tokenOutMins:
          decode
              .getListOfBytes(4)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidMsgUnlockAndMigrateSharesToFullRangeConcentratedPosition;
  @override
  MsgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse
  onServiceResponse(List<int> bytes) {
    return MsgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse.deserialize(
      bytes,
    );
  }

  @override
  MsgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse
  onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse.fromJson(
      json,
    );
  }
}

class MsgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse
    extends CosmosProtoMessage {
  final String? amount0;

  final String? amount1;

  final String? liquidityCreated;

  final google_protobuf_timestamp.Timestamp? joinTime;

  const MsgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse({
    this.amount0,
    this.amount1,
    this.liquidityCreated,
    this.joinTime,
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
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    amount0,
    amount1,
    liquidityCreated,
    joinTime,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'amount0': amount0,
      'amount1': amount1,
      'liquidity_created': liquidityCreated,
      'join_time': joinTime?.toRfc3339(),
    };
  }

  factory MsgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse(
      amount0: json.valueAsString<String?>('amount0', acceptCamelCase: true),
      amount1: json.valueAsString<String?>('amount1', acceptCamelCase: true),
      liquidityCreated: json.valueAsString<String?>(
        'liquidity_created',
        acceptCamelCase: true,
      ),
      joinTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'join_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse(
      amount0: decode.getString<String?>(1),
      amount1: decode.getString<String?>(2),
      liquidityCreated: decode.getString<String?>(3),
      joinTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        4,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidMsgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse;
}

/// ===================== MsgAddToConcentratedLiquiditySuperfluidPosition
class MsgAddToConcentratedLiquiditySuperfluidPosition extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<
          MsgAddToConcentratedLiquiditySuperfluidPositionResponse
        >,
        ICosmosProtoAminoMessage {
  final BigInt? positionId;

  final String? sender;

  final cosmos_base_v1beta1_coin.Coin? tokenDesired0;

  final cosmos_base_v1beta1_coin.Coin? tokenDesired1;

  const MsgAddToConcentratedLiquiditySuperfluidPosition({
    this.positionId,
    this.sender,
    this.tokenDesired0,
    this.tokenDesired1,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/add-to-cl-superfluid-position",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    positionId,
    sender,
    tokenDesired0,
    tokenDesired1,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'position_id': positionId?.toString(),
      'sender': sender,
      'token_desired0': tokenDesired0?.toJson(),
      'token_desired1': tokenDesired1?.toJson(),
    };
  }

  factory MsgAddToConcentratedLiquiditySuperfluidPosition.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgAddToConcentratedLiquiditySuperfluidPosition(
      positionId: json.valueAsBigInt<BigInt?>(
        'position_id',
        acceptCamelCase: true,
      ),
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      tokenDesired0: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'token_desired0',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      tokenDesired1: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'token_desired1',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgAddToConcentratedLiquiditySuperfluidPosition.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAddToConcentratedLiquiditySuperfluidPosition(
      positionId: decode.getBigInt<BigInt?>(1),
      sender: decode.getString<String?>(2),
      tokenDesired0: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      tokenDesired1: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        4,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidMsgAddToConcentratedLiquiditySuperfluidPosition;
  @override
  MsgAddToConcentratedLiquiditySuperfluidPositionResponse onServiceResponse(
    List<int> bytes,
  ) {
    return MsgAddToConcentratedLiquiditySuperfluidPositionResponse.deserialize(
      bytes,
    );
  }

  @override
  MsgAddToConcentratedLiquiditySuperfluidPositionResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgAddToConcentratedLiquiditySuperfluidPositionResponse.fromJson(
      json,
    );
  }
}

class MsgAddToConcentratedLiquiditySuperfluidPositionResponse
    extends CosmosProtoMessage {
  final BigInt? positionId;

  final String? amount0;

  final String? amount1;

  /// new_liquidity is the final liquidity after the add.
  /// It includes the liquidity that existed before in the position
  /// and the new liquidity that was added to the position.
  final String? newLiquidity;

  final BigInt? lockId;

  const MsgAddToConcentratedLiquiditySuperfluidPositionResponse({
    this.positionId,
    this.amount0,
    this.amount1,
    this.newLiquidity,
    this.lockId,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.uint64(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    positionId,
    amount0,
    amount1,
    newLiquidity,
    lockId,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'position_id': positionId?.toString(),
      'amount0': amount0,
      'amount1': amount1,
      'new_liquidity': newLiquidity,
      'lock_id': lockId?.toString(),
    };
  }

  factory MsgAddToConcentratedLiquiditySuperfluidPositionResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgAddToConcentratedLiquiditySuperfluidPositionResponse(
      positionId: json.valueAsBigInt<BigInt?>(
        'position_id',
        acceptCamelCase: true,
      ),
      amount0: json.valueAsString<String?>('amount0', acceptCamelCase: true),
      amount1: json.valueAsString<String?>('amount1', acceptCamelCase: true),
      newLiquidity: json.valueAsString<String?>(
        'new_liquidity',
        acceptCamelCase: true,
      ),
      lockId: json.valueAsBigInt<BigInt?>('lock_id', acceptCamelCase: true),
    );
  }

  factory MsgAddToConcentratedLiquiditySuperfluidPositionResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAddToConcentratedLiquiditySuperfluidPositionResponse(
      positionId: decode.getBigInt<BigInt?>(1),
      amount0: decode.getString<String?>(2),
      amount1: decode.getString<String?>(3),
      newLiquidity: decode.getString<String?>(5),
      lockId: decode.getBigInt<BigInt?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidMsgAddToConcentratedLiquiditySuperfluidPositionResponse;
}

/// ===================== MsgUnbondConvertAndStake
class MsgUnbondConvertAndStake extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUnbondConvertAndStakeResponse>,
        ICosmosProtoAminoMessage {
  /// lock ID to convert and stake.
  /// lock id with 0 should be provided if converting liquid gamm shares to stake
  final BigInt? lockId;

  final String? sender;

  /// validator address to delegate to.
  /// If provided empty string, we use the validators returned from
  /// valset-preference module.
  final String? valAddr;

  /// min_amt_to_stake indicates the minimum amount to stake after conversion
  final String? minAmtToStake;

  /// shares_to_convert indicates shares wanted to stake.
  /// Note that this field is only used for liquid(unlocked) gamm shares.
  /// For all other cases, this field would be disregarded.
  final cosmos_base_v1beta1_coin.Coin? sharesToConvert;

  const MsgUnbondConvertAndStake({
    this.lockId,
    this.sender,
    this.valAddr,
    this.minAmtToStake,
    this.sharesToConvert,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/unbond-convert-and-stake",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.message(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    lockId,
    sender,
    valAddr,
    minAmtToStake,
    sharesToConvert,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'lock_id': lockId?.toString(),
      'sender': sender,
      'val_addr': valAddr,
      'min_amt_to_stake': minAmtToStake,
      'shares_to_convert': sharesToConvert?.toJson(),
    };
  }

  factory MsgUnbondConvertAndStake.fromJson(Map<String, dynamic> json) {
    return MsgUnbondConvertAndStake(
      lockId: json.valueAsBigInt<BigInt?>('lock_id', acceptCamelCase: true),
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      valAddr: json.valueAsString<String?>('val_addr', acceptCamelCase: true),
      minAmtToStake: json.valueAsString<String?>(
        'min_amt_to_stake',
        acceptCamelCase: true,
      ),
      sharesToConvert: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'shares_to_convert',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgUnbondConvertAndStake.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUnbondConvertAndStake(
      lockId: decode.getBigInt<BigInt?>(1),
      sender: decode.getString<String?>(2),
      valAddr: decode.getString<String?>(3),
      minAmtToStake: decode.getString<String?>(4),
      sharesToConvert: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        5,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidMsgUnbondConvertAndStake;
  @override
  MsgUnbondConvertAndStakeResponse onServiceResponse(List<int> bytes) {
    return MsgUnbondConvertAndStakeResponse.deserialize(bytes);
  }

  @override
  MsgUnbondConvertAndStakeResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUnbondConvertAndStakeResponse.fromJson(json);
  }
}

class MsgUnbondConvertAndStakeResponse extends CosmosProtoMessage {
  final String? totalAmtStaked;

  const MsgUnbondConvertAndStakeResponse({this.totalAmtStaked});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [totalAmtStaked];

  @override
  Map<String, dynamic> toJson() {
    return {'total_amt_staked': totalAmtStaked};
  }

  factory MsgUnbondConvertAndStakeResponse.fromJson(Map<String, dynamic> json) {
    return MsgUnbondConvertAndStakeResponse(
      totalAmtStaked: json.valueAsString<String?>(
        'total_amt_staked',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUnbondConvertAndStakeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUnbondConvertAndStakeResponse(
      totalAmtStaked: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidMsgUnbondConvertAndStakeResponse;
}
