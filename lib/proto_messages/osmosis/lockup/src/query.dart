import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/osmosis/lockup/src/lock.dart"
    as osmosis_lockup_lock;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;
import "package:cosmos_sdk/proto_messages/osmosis/lockup/src/params.dart"
    as osmosis_lockup_params;

class ModuleBalanceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ModuleBalanceResponse> {
  const ModuleBalanceRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/lockup/v1beta1/module_balance",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory ModuleBalanceRequest.fromJson(Map<String, dynamic> json) {
    return ModuleBalanceRequest();
  }

  factory ModuleBalanceRequest.deserialize(List<int> bytes) {
    return ModuleBalanceRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupModuleBalanceRequest;
  @override
  ModuleBalanceResponse onQueryResponse(List<int> bytes) {
    return ModuleBalanceResponse.deserialize(bytes);
  }

  @override
  ModuleBalanceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return ModuleBalanceResponse.fromJson(json);
  }
}

class ModuleBalanceResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> coins;

  const ModuleBalanceResponse({this.coins = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [coins];

  @override
  Map<String, dynamic> toJson() {
    return {'coins': coins.map((e) => e.toJson()).toList()};
  }

  factory ModuleBalanceResponse.fromJson(Map<String, dynamic> json) {
    return ModuleBalanceResponse(
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
    );
  }

  factory ModuleBalanceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ModuleBalanceResponse(
      coins:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupModuleBalanceResponse;
}

class ModuleLockedAmountRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ModuleLockedAmountResponse> {
  const ModuleLockedAmountRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/lockup/v1beta1/module_locked_amount",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory ModuleLockedAmountRequest.fromJson(Map<String, dynamic> json) {
    return ModuleLockedAmountRequest();
  }

  factory ModuleLockedAmountRequest.deserialize(List<int> bytes) {
    return ModuleLockedAmountRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupModuleLockedAmountRequest;
  @override
  ModuleLockedAmountResponse onQueryResponse(List<int> bytes) {
    return ModuleLockedAmountResponse.deserialize(bytes);
  }

  @override
  ModuleLockedAmountResponse onQueryResponseJson(Map<String, dynamic> json) {
    return ModuleLockedAmountResponse.fromJson(json);
  }
}

class ModuleLockedAmountResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> coins;

  const ModuleLockedAmountResponse({this.coins = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [coins];

  @override
  Map<String, dynamic> toJson() {
    return {'coins': coins.map((e) => e.toJson()).toList()};
  }

  factory ModuleLockedAmountResponse.fromJson(Map<String, dynamic> json) {
    return ModuleLockedAmountResponse(
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
    );
  }

  factory ModuleLockedAmountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ModuleLockedAmountResponse(
      coins:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupModuleLockedAmountResponse;
}

class AccountUnlockableCoinsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<AccountUnlockableCoinsResponse> {
  final String? owner;

  const AccountUnlockableCoinsRequest({this.owner});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/lockup/v1beta1/account_unlockable_coins/{owner}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [owner];

  @override
  Map<String, dynamic> toJson() {
    return {'owner': owner};
  }

  factory AccountUnlockableCoinsRequest.fromJson(Map<String, dynamic> json) {
    return AccountUnlockableCoinsRequest(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
    );
  }

  factory AccountUnlockableCoinsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountUnlockableCoinsRequest(owner: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupAccountUnlockableCoinsRequest;
  @override
  AccountUnlockableCoinsResponse onQueryResponse(List<int> bytes) {
    return AccountUnlockableCoinsResponse.deserialize(bytes);
  }

  @override
  AccountUnlockableCoinsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return AccountUnlockableCoinsResponse.fromJson(json);
  }
}

class AccountUnlockableCoinsResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> coins;

  const AccountUnlockableCoinsResponse({this.coins = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [coins];

  @override
  Map<String, dynamic> toJson() {
    return {'coins': coins.map((e) => e.toJson()).toList()};
  }

  factory AccountUnlockableCoinsResponse.fromJson(Map<String, dynamic> json) {
    return AccountUnlockableCoinsResponse(
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
    );
  }

  factory AccountUnlockableCoinsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountUnlockableCoinsResponse(
      coins:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupAccountUnlockableCoinsResponse;
}

class AccountUnlockingCoinsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<AccountUnlockingCoinsResponse> {
  final String? owner;

  const AccountUnlockingCoinsRequest({this.owner});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/lockup/v1beta1/account_unlocking_coins/{owner}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [owner];

  @override
  Map<String, dynamic> toJson() {
    return {'owner': owner};
  }

  factory AccountUnlockingCoinsRequest.fromJson(Map<String, dynamic> json) {
    return AccountUnlockingCoinsRequest(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
    );
  }

  factory AccountUnlockingCoinsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountUnlockingCoinsRequest(owner: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupAccountUnlockingCoinsRequest;
  @override
  AccountUnlockingCoinsResponse onQueryResponse(List<int> bytes) {
    return AccountUnlockingCoinsResponse.deserialize(bytes);
  }

  @override
  AccountUnlockingCoinsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return AccountUnlockingCoinsResponse.fromJson(json);
  }
}

class AccountUnlockingCoinsResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> coins;

  const AccountUnlockingCoinsResponse({this.coins = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [coins];

  @override
  Map<String, dynamic> toJson() {
    return {'coins': coins.map((e) => e.toJson()).toList()};
  }

  factory AccountUnlockingCoinsResponse.fromJson(Map<String, dynamic> json) {
    return AccountUnlockingCoinsResponse(
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
    );
  }

  factory AccountUnlockingCoinsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountUnlockingCoinsResponse(
      coins:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupAccountUnlockingCoinsResponse;
}

class AccountLockedCoinsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<AccountLockedCoinsResponse> {
  final String? owner;

  const AccountLockedCoinsRequest({this.owner});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/lockup/v1beta1/account_locked_coins/{owner}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [owner];

  @override
  Map<String, dynamic> toJson() {
    return {'owner': owner};
  }

  factory AccountLockedCoinsRequest.fromJson(Map<String, dynamic> json) {
    return AccountLockedCoinsRequest(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
    );
  }

  factory AccountLockedCoinsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountLockedCoinsRequest(owner: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupAccountLockedCoinsRequest;
  @override
  AccountLockedCoinsResponse onQueryResponse(List<int> bytes) {
    return AccountLockedCoinsResponse.deserialize(bytes);
  }

  @override
  AccountLockedCoinsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return AccountLockedCoinsResponse.fromJson(json);
  }
}

class AccountLockedCoinsResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> coins;

  const AccountLockedCoinsResponse({this.coins = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [coins];

  @override
  Map<String, dynamic> toJson() {
    return {'coins': coins.map((e) => e.toJson()).toList()};
  }

  factory AccountLockedCoinsResponse.fromJson(Map<String, dynamic> json) {
    return AccountLockedCoinsResponse(
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
    );
  }

  factory AccountLockedCoinsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountLockedCoinsResponse(
      coins:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupAccountLockedCoinsResponse;
}

class AccountLockedPastTimeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<AccountLockedPastTimeResponse> {
  final String? owner;

  final google_protobuf_timestamp.Timestamp? timestamp;

  const AccountLockedPastTimeRequest({this.owner, this.timestamp});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/lockup/v1beta1/account_locked_pasttime/{owner}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [owner, timestamp];

  @override
  Map<String, dynamic> toJson() {
    return {'owner': owner, 'timestamp': timestamp?.toRfc3339()};
  }

  factory AccountLockedPastTimeRequest.fromJson(Map<String, dynamic> json) {
    return AccountLockedPastTimeRequest(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      timestamp: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'timestamp',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory AccountLockedPastTimeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountLockedPastTimeRequest(
      owner: decode.getString<String?>(1),
      timestamp: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        2,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupAccountLockedPastTimeRequest;
  @override
  AccountLockedPastTimeResponse onQueryResponse(List<int> bytes) {
    return AccountLockedPastTimeResponse.deserialize(bytes);
  }

  @override
  AccountLockedPastTimeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return AccountLockedPastTimeResponse.fromJson(json);
  }
}

class AccountLockedPastTimeResponse extends CosmosProtoMessage {
  final List<osmosis_lockup_lock.PeriodLock> locks;

  const AccountLockedPastTimeResponse({this.locks = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [locks];

  @override
  Map<String, dynamic> toJson() {
    return {'locks': locks.map((e) => e.toJson()).toList()};
  }

  factory AccountLockedPastTimeResponse.fromJson(Map<String, dynamic> json) {
    return AccountLockedPastTimeResponse(
      locks:
          (json.valueEnsureAsList<dynamic>('locks', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_lockup_lock.PeriodLock,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => osmosis_lockup_lock.PeriodLock.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory AccountLockedPastTimeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountLockedPastTimeResponse(
      locks:
          decode
              .getListOfBytes(1)
              .map((b) => osmosis_lockup_lock.PeriodLock.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupAccountLockedPastTimeResponse;
}

class AccountLockedPastTimeNotUnlockingOnlyRequest extends CosmosProtoMessage
    with
        ICosmosProtoQueryMessage<
          AccountLockedPastTimeNotUnlockingOnlyResponse
        > {
  final String? owner;

  final google_protobuf_timestamp.Timestamp? timestamp;

  const AccountLockedPastTimeNotUnlockingOnlyRequest({
    this.owner,
    this.timestamp,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/lockup/v1beta1/account_locked_pasttime_not_unlocking_only/{owner}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [owner, timestamp];

  @override
  Map<String, dynamic> toJson() {
    return {'owner': owner, 'timestamp': timestamp?.toRfc3339()};
  }

  factory AccountLockedPastTimeNotUnlockingOnlyRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return AccountLockedPastTimeNotUnlockingOnlyRequest(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      timestamp: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'timestamp',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory AccountLockedPastTimeNotUnlockingOnlyRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountLockedPastTimeNotUnlockingOnlyRequest(
      owner: decode.getString<String?>(1),
      timestamp: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        2,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisLockupAccountLockedPastTimeNotUnlockingOnlyRequest;
  @override
  AccountLockedPastTimeNotUnlockingOnlyResponse onQueryResponse(
    List<int> bytes,
  ) {
    return AccountLockedPastTimeNotUnlockingOnlyResponse.deserialize(bytes);
  }

  @override
  AccountLockedPastTimeNotUnlockingOnlyResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return AccountLockedPastTimeNotUnlockingOnlyResponse.fromJson(json);
  }
}

class AccountLockedPastTimeNotUnlockingOnlyResponse extends CosmosProtoMessage {
  final List<osmosis_lockup_lock.PeriodLock> locks;

  const AccountLockedPastTimeNotUnlockingOnlyResponse({this.locks = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [locks];

  @override
  Map<String, dynamic> toJson() {
    return {'locks': locks.map((e) => e.toJson()).toList()};
  }

  factory AccountLockedPastTimeNotUnlockingOnlyResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return AccountLockedPastTimeNotUnlockingOnlyResponse(
      locks:
          (json.valueEnsureAsList<dynamic>('locks', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_lockup_lock.PeriodLock,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => osmosis_lockup_lock.PeriodLock.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory AccountLockedPastTimeNotUnlockingOnlyResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountLockedPastTimeNotUnlockingOnlyResponse(
      locks:
          decode
              .getListOfBytes(1)
              .map((b) => osmosis_lockup_lock.PeriodLock.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisLockupAccountLockedPastTimeNotUnlockingOnlyResponse;
}

class AccountUnlockedBeforeTimeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<AccountUnlockedBeforeTimeResponse> {
  final String? owner;

  final google_protobuf_timestamp.Timestamp? timestamp;

  const AccountUnlockedBeforeTimeRequest({this.owner, this.timestamp});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/lockup/v1beta1/account_unlocked_before_time/{owner}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [owner, timestamp];

  @override
  Map<String, dynamic> toJson() {
    return {'owner': owner, 'timestamp': timestamp?.toRfc3339()};
  }

  factory AccountUnlockedBeforeTimeRequest.fromJson(Map<String, dynamic> json) {
    return AccountUnlockedBeforeTimeRequest(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      timestamp: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'timestamp',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory AccountUnlockedBeforeTimeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountUnlockedBeforeTimeRequest(
      owner: decode.getString<String?>(1),
      timestamp: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        2,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupAccountUnlockedBeforeTimeRequest;
  @override
  AccountUnlockedBeforeTimeResponse onQueryResponse(List<int> bytes) {
    return AccountUnlockedBeforeTimeResponse.deserialize(bytes);
  }

  @override
  AccountUnlockedBeforeTimeResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return AccountUnlockedBeforeTimeResponse.fromJson(json);
  }
}

class AccountUnlockedBeforeTimeResponse extends CosmosProtoMessage {
  final List<osmosis_lockup_lock.PeriodLock> locks;

  const AccountUnlockedBeforeTimeResponse({this.locks = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [locks];

  @override
  Map<String, dynamic> toJson() {
    return {'locks': locks.map((e) => e.toJson()).toList()};
  }

  factory AccountUnlockedBeforeTimeResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return AccountUnlockedBeforeTimeResponse(
      locks:
          (json.valueEnsureAsList<dynamic>('locks', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_lockup_lock.PeriodLock,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => osmosis_lockup_lock.PeriodLock.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory AccountUnlockedBeforeTimeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountUnlockedBeforeTimeResponse(
      locks:
          decode
              .getListOfBytes(1)
              .map((b) => osmosis_lockup_lock.PeriodLock.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupAccountUnlockedBeforeTimeResponse;
}

class AccountLockedPastTimeDenomRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<AccountLockedPastTimeDenomResponse> {
  final String? owner;

  final google_protobuf_timestamp.Timestamp? timestamp;

  final String? denom;

  const AccountLockedPastTimeDenomRequest({
    this.owner,
    this.timestamp,
    this.denom,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/lockup/v1beta1/account_locked_pasttime_denom/{owner}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [owner, timestamp, denom];

  @override
  Map<String, dynamic> toJson() {
    return {
      'owner': owner,
      'timestamp': timestamp?.toRfc3339(),
      'denom': denom,
    };
  }

  factory AccountLockedPastTimeDenomRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return AccountLockedPastTimeDenomRequest(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      timestamp: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'timestamp',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory AccountLockedPastTimeDenomRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountLockedPastTimeDenomRequest(
      owner: decode.getString<String?>(1),
      timestamp: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        2,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      denom: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupAccountLockedPastTimeDenomRequest;
  @override
  AccountLockedPastTimeDenomResponse onQueryResponse(List<int> bytes) {
    return AccountLockedPastTimeDenomResponse.deserialize(bytes);
  }

  @override
  AccountLockedPastTimeDenomResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return AccountLockedPastTimeDenomResponse.fromJson(json);
  }
}

class AccountLockedPastTimeDenomResponse extends CosmosProtoMessage {
  final List<osmosis_lockup_lock.PeriodLock> locks;

  const AccountLockedPastTimeDenomResponse({this.locks = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [locks];

  @override
  Map<String, dynamic> toJson() {
    return {'locks': locks.map((e) => e.toJson()).toList()};
  }

  factory AccountLockedPastTimeDenomResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return AccountLockedPastTimeDenomResponse(
      locks:
          (json.valueEnsureAsList<dynamic>('locks', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_lockup_lock.PeriodLock,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => osmosis_lockup_lock.PeriodLock.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory AccountLockedPastTimeDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountLockedPastTimeDenomResponse(
      locks:
          decode
              .getListOfBytes(1)
              .map((b) => osmosis_lockup_lock.PeriodLock.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupAccountLockedPastTimeDenomResponse;
}

class LockedDenomRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<LockedDenomResponse> {
  final String? denom;

  final google_protobuf_duration.Duration? duration;

  const LockedDenomRequest({this.denom, this.duration});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/lockup/v1beta1/locked_denom",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [denom, duration];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom, 'duration': duration?.encodeString(asNanos: true)};
  }

  factory LockedDenomRequest.fromJson(Map<String, dynamic> json) {
    return LockedDenomRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      duration: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'duration',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory LockedDenomRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return LockedDenomRequest(
      denom: decode.getString<String?>(1),
      duration: decode.messageTo<google_protobuf_duration.Duration?>(
        2,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupLockedDenomRequest;
  @override
  LockedDenomResponse onQueryResponse(List<int> bytes) {
    return LockedDenomResponse.deserialize(bytes);
  }

  @override
  LockedDenomResponse onQueryResponseJson(Map<String, dynamic> json) {
    return LockedDenomResponse.fromJson(json);
  }
}

class LockedDenomResponse extends CosmosProtoMessage {
  final String? amount;

  const LockedDenomResponse({this.amount});

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
  List<Object?> get protoValues => [amount];

  @override
  Map<String, dynamic> toJson() {
    return {'amount': amount};
  }

  factory LockedDenomResponse.fromJson(Map<String, dynamic> json) {
    return LockedDenomResponse(
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
    );
  }

  factory LockedDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return LockedDenomResponse(amount: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupLockedDenomResponse;
}

class LockedRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<LockedResponse> {
  final BigInt? lockId;

  const LockedRequest({this.lockId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/lockup/v1beta1/locked_by_id/{lock_id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [lockId];

  @override
  Map<String, dynamic> toJson() {
    return {'lock_id': lockId?.toString()};
  }

  factory LockedRequest.fromJson(Map<String, dynamic> json) {
    return LockedRequest(
      lockId: json.valueAsBigInt<BigInt?>('lock_id', acceptCamelCase: true),
    );
  }

  factory LockedRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return LockedRequest(lockId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupLockedRequest;
  @override
  LockedResponse onQueryResponse(List<int> bytes) {
    return LockedResponse.deserialize(bytes);
  }

  @override
  LockedResponse onQueryResponseJson(Map<String, dynamic> json) {
    return LockedResponse.fromJson(json);
  }
}

class LockedResponse extends CosmosProtoMessage {
  final osmosis_lockup_lock.PeriodLock? lock;

  const LockedResponse({this.lock});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [lock];

  @override
  Map<String, dynamic> toJson() {
    return {'lock': lock?.toJson()};
  }

  factory LockedResponse.fromJson(Map<String, dynamic> json) {
    return LockedResponse(
      lock: json.valueTo<osmosis_lockup_lock.PeriodLock?, Map<String, dynamic>>(
        key: 'lock',
        parse: (v) => osmosis_lockup_lock.PeriodLock.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory LockedResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return LockedResponse(
      lock: decode.messageTo<osmosis_lockup_lock.PeriodLock?>(
        1,
        (b) => osmosis_lockup_lock.PeriodLock.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupLockedResponse;
}

class LockRewardReceiverRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<LockRewardReceiverResponse> {
  final BigInt? lockId;

  const LockRewardReceiverRequest({this.lockId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/lockup/v1beta1/lock_reward_receiver/{lock_id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [lockId];

  @override
  Map<String, dynamic> toJson() {
    return {'lock_id': lockId?.toString()};
  }

  factory LockRewardReceiverRequest.fromJson(Map<String, dynamic> json) {
    return LockRewardReceiverRequest(
      lockId: json.valueAsBigInt<BigInt?>('lock_id', acceptCamelCase: true),
    );
  }

  factory LockRewardReceiverRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return LockRewardReceiverRequest(lockId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupLockRewardReceiverRequest;
  @override
  LockRewardReceiverResponse onQueryResponse(List<int> bytes) {
    return LockRewardReceiverResponse.deserialize(bytes);
  }

  @override
  LockRewardReceiverResponse onQueryResponseJson(Map<String, dynamic> json) {
    return LockRewardReceiverResponse.fromJson(json);
  }
}

class LockRewardReceiverResponse extends CosmosProtoMessage {
  final String? rewardReceiver;

  const LockRewardReceiverResponse({this.rewardReceiver});

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
  List<Object?> get protoValues => [rewardReceiver];

  @override
  Map<String, dynamic> toJson() {
    return {'reward_receiver': rewardReceiver};
  }

  factory LockRewardReceiverResponse.fromJson(Map<String, dynamic> json) {
    return LockRewardReceiverResponse(
      rewardReceiver: json.valueAsString<String?>(
        'reward_receiver',
        acceptCamelCase: true,
      ),
    );
  }

  factory LockRewardReceiverResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return LockRewardReceiverResponse(
      rewardReceiver: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupLockRewardReceiverResponse;
}

class NextLockIDRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<NextLockIDResponse> {
  const NextLockIDRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/lockup/v1beta1/next_lock_id",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory NextLockIDRequest.fromJson(Map<String, dynamic> json) {
    return NextLockIDRequest();
  }

  factory NextLockIDRequest.deserialize(List<int> bytes) {
    return NextLockIDRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupNextLockIDRequest;
  @override
  NextLockIDResponse onQueryResponse(List<int> bytes) {
    return NextLockIDResponse.deserialize(bytes);
  }

  @override
  NextLockIDResponse onQueryResponseJson(Map<String, dynamic> json) {
    return NextLockIDResponse.fromJson(json);
  }
}

class NextLockIDResponse extends CosmosProtoMessage {
  final BigInt? lockId;

  const NextLockIDResponse({this.lockId});

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

  factory NextLockIDResponse.fromJson(Map<String, dynamic> json) {
    return NextLockIDResponse(
      lockId: json.valueAsBigInt<BigInt?>('lock_id', acceptCamelCase: true),
    );
  }

  factory NextLockIDResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return NextLockIDResponse(lockId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupNextLockIDResponse;
}

class SyntheticLockupsByLockupIDRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<SyntheticLockupsByLockupIDResponse> {
  final BigInt? lockId;

  const SyntheticLockupsByLockupIDRequest({this.lockId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "deprecated", value: true),
        ProtoOptionBool(name: "deprecated", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/lockup/v1beta1/synthetic_lockups_by_lock_id/{lock_id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [lockId];

  @override
  Map<String, dynamic> toJson() {
    return {'lock_id': lockId?.toString()};
  }

  factory SyntheticLockupsByLockupIDRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return SyntheticLockupsByLockupIDRequest(
      lockId: json.valueAsBigInt<BigInt?>('lock_id', acceptCamelCase: true),
    );
  }

  factory SyntheticLockupsByLockupIDRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SyntheticLockupsByLockupIDRequest(
      lockId: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupSyntheticLockupsByLockupIDRequest;
  @override
  SyntheticLockupsByLockupIDResponse onQueryResponse(List<int> bytes) {
    return SyntheticLockupsByLockupIDResponse.deserialize(bytes);
  }

  @override
  SyntheticLockupsByLockupIDResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return SyntheticLockupsByLockupIDResponse.fromJson(json);
  }
}

class SyntheticLockupsByLockupIDResponse extends CosmosProtoMessage {
  final List<osmosis_lockup_lock.SyntheticLock> syntheticLocks;

  const SyntheticLockupsByLockupIDResponse({this.syntheticLocks = const []});

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
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [syntheticLocks];

  @override
  Map<String, dynamic> toJson() {
    return {'synthetic_locks': syntheticLocks.map((e) => e.toJson()).toList()};
  }

  factory SyntheticLockupsByLockupIDResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return SyntheticLockupsByLockupIDResponse(
      syntheticLocks:
          (json.valueEnsureAsList<dynamic>(
                'synthetic_locks',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_lockup_lock.SyntheticLock,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => osmosis_lockup_lock.SyntheticLock.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory SyntheticLockupsByLockupIDResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SyntheticLockupsByLockupIDResponse(
      syntheticLocks:
          decode
              .getListOfBytes(1)
              .map((b) => osmosis_lockup_lock.SyntheticLock.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupSyntheticLockupsByLockupIDResponse;
}

class SyntheticLockupByLockupIDRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<SyntheticLockupByLockupIDResponse> {
  final BigInt? lockId;

  const SyntheticLockupByLockupIDRequest({this.lockId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/lockup/v1beta1/synthetic_lockup_by_lock_id/{lock_id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [lockId];

  @override
  Map<String, dynamic> toJson() {
    return {'lock_id': lockId?.toString()};
  }

  factory SyntheticLockupByLockupIDRequest.fromJson(Map<String, dynamic> json) {
    return SyntheticLockupByLockupIDRequest(
      lockId: json.valueAsBigInt<BigInt?>('lock_id', acceptCamelCase: true),
    );
  }

  factory SyntheticLockupByLockupIDRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SyntheticLockupByLockupIDRequest(
      lockId: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupSyntheticLockupByLockupIDRequest;
  @override
  SyntheticLockupByLockupIDResponse onQueryResponse(List<int> bytes) {
    return SyntheticLockupByLockupIDResponse.deserialize(bytes);
  }

  @override
  SyntheticLockupByLockupIDResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return SyntheticLockupByLockupIDResponse.fromJson(json);
  }
}

class SyntheticLockupByLockupIDResponse extends CosmosProtoMessage {
  final osmosis_lockup_lock.SyntheticLock? syntheticLock;

  const SyntheticLockupByLockupIDResponse({this.syntheticLock});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [syntheticLock];

  @override
  Map<String, dynamic> toJson() {
    return {'synthetic_lock': syntheticLock?.toJson()};
  }

  factory SyntheticLockupByLockupIDResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return SyntheticLockupByLockupIDResponse(
      syntheticLock: json
          .valueTo<osmosis_lockup_lock.SyntheticLock?, Map<String, dynamic>>(
            key: 'synthetic_lock',
            parse: (v) => osmosis_lockup_lock.SyntheticLock.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory SyntheticLockupByLockupIDResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SyntheticLockupByLockupIDResponse(
      syntheticLock: decode.messageTo<osmosis_lockup_lock.SyntheticLock?>(
        1,
        (b) => osmosis_lockup_lock.SyntheticLock.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupSyntheticLockupByLockupIDResponse;
}

class AccountLockedLongerDurationRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<AccountLockedLongerDurationResponse> {
  final String? owner;

  final google_protobuf_duration.Duration? duration;

  const AccountLockedLongerDurationRequest({this.owner, this.duration});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/lockup/v1beta1/account_locked_longer_duration/{owner}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [owner, duration];

  @override
  Map<String, dynamic> toJson() {
    return {'owner': owner, 'duration': duration?.encodeString(asNanos: true)};
  }

  factory AccountLockedLongerDurationRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return AccountLockedLongerDurationRequest(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      duration: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'duration',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory AccountLockedLongerDurationRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountLockedLongerDurationRequest(
      owner: decode.getString<String?>(1),
      duration: decode.messageTo<google_protobuf_duration.Duration?>(
        2,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupAccountLockedLongerDurationRequest;
  @override
  AccountLockedLongerDurationResponse onQueryResponse(List<int> bytes) {
    return AccountLockedLongerDurationResponse.deserialize(bytes);
  }

  @override
  AccountLockedLongerDurationResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return AccountLockedLongerDurationResponse.fromJson(json);
  }
}

class AccountLockedLongerDurationResponse extends CosmosProtoMessage {
  final List<osmosis_lockup_lock.PeriodLock> locks;

  const AccountLockedLongerDurationResponse({this.locks = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [locks];

  @override
  Map<String, dynamic> toJson() {
    return {'locks': locks.map((e) => e.toJson()).toList()};
  }

  factory AccountLockedLongerDurationResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return AccountLockedLongerDurationResponse(
      locks:
          (json.valueEnsureAsList<dynamic>('locks', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_lockup_lock.PeriodLock,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => osmosis_lockup_lock.PeriodLock.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory AccountLockedLongerDurationResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountLockedLongerDurationResponse(
      locks:
          decode
              .getListOfBytes(1)
              .map((b) => osmosis_lockup_lock.PeriodLock.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisLockupAccountLockedLongerDurationResponse;
}

class AccountLockedDurationRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<AccountLockedDurationResponse> {
  final String? owner;

  final google_protobuf_duration.Duration? duration;

  const AccountLockedDurationRequest({this.owner, this.duration});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/lockup/v1beta1/account_locked_duration/{owner}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [owner, duration];

  @override
  Map<String, dynamic> toJson() {
    return {'owner': owner, 'duration': duration?.encodeString(asNanos: true)};
  }

  factory AccountLockedDurationRequest.fromJson(Map<String, dynamic> json) {
    return AccountLockedDurationRequest(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      duration: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'duration',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory AccountLockedDurationRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountLockedDurationRequest(
      owner: decode.getString<String?>(1),
      duration: decode.messageTo<google_protobuf_duration.Duration?>(
        2,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupAccountLockedDurationRequest;
  @override
  AccountLockedDurationResponse onQueryResponse(List<int> bytes) {
    return AccountLockedDurationResponse.deserialize(bytes);
  }

  @override
  AccountLockedDurationResponse onQueryResponseJson(Map<String, dynamic> json) {
    return AccountLockedDurationResponse.fromJson(json);
  }
}

class AccountLockedDurationResponse extends CosmosProtoMessage {
  final List<osmosis_lockup_lock.PeriodLock> locks;

  const AccountLockedDurationResponse({this.locks = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [locks];

  @override
  Map<String, dynamic> toJson() {
    return {'locks': locks.map((e) => e.toJson()).toList()};
  }

  factory AccountLockedDurationResponse.fromJson(Map<String, dynamic> json) {
    return AccountLockedDurationResponse(
      locks:
          (json.valueEnsureAsList<dynamic>('locks', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_lockup_lock.PeriodLock,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => osmosis_lockup_lock.PeriodLock.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory AccountLockedDurationResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountLockedDurationResponse(
      locks:
          decode
              .getListOfBytes(1)
              .map((b) => osmosis_lockup_lock.PeriodLock.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupAccountLockedDurationResponse;
}

class AccountLockedLongerDurationNotUnlockingOnlyRequest
    extends CosmosProtoMessage
    with
        ICosmosProtoQueryMessage<
          AccountLockedLongerDurationNotUnlockingOnlyResponse
        > {
  final String? owner;

  final google_protobuf_duration.Duration? duration;

  const AccountLockedLongerDurationNotUnlockingOnlyRequest({
    this.owner,
    this.duration,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/lockup/v1beta1/account_locked_longer_duration_not_unlocking_only/{owner}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [owner, duration];

  @override
  Map<String, dynamic> toJson() {
    return {'owner': owner, 'duration': duration?.encodeString(asNanos: true)};
  }

  factory AccountLockedLongerDurationNotUnlockingOnlyRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return AccountLockedLongerDurationNotUnlockingOnlyRequest(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      duration: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'duration',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory AccountLockedLongerDurationNotUnlockingOnlyRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountLockedLongerDurationNotUnlockingOnlyRequest(
      owner: decode.getString<String?>(1),
      duration: decode.messageTo<google_protobuf_duration.Duration?>(
        2,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisLockupAccountLockedLongerDurationNotUnlockingOnlyRequest;
  @override
  AccountLockedLongerDurationNotUnlockingOnlyResponse onQueryResponse(
    List<int> bytes,
  ) {
    return AccountLockedLongerDurationNotUnlockingOnlyResponse.deserialize(
      bytes,
    );
  }

  @override
  AccountLockedLongerDurationNotUnlockingOnlyResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return AccountLockedLongerDurationNotUnlockingOnlyResponse.fromJson(json);
  }
}

class AccountLockedLongerDurationNotUnlockingOnlyResponse
    extends CosmosProtoMessage {
  final List<osmosis_lockup_lock.PeriodLock> locks;

  const AccountLockedLongerDurationNotUnlockingOnlyResponse({
    this.locks = const [],
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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [locks];

  @override
  Map<String, dynamic> toJson() {
    return {'locks': locks.map((e) => e.toJson()).toList()};
  }

  factory AccountLockedLongerDurationNotUnlockingOnlyResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return AccountLockedLongerDurationNotUnlockingOnlyResponse(
      locks:
          (json.valueEnsureAsList<dynamic>('locks', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_lockup_lock.PeriodLock,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => osmosis_lockup_lock.PeriodLock.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory AccountLockedLongerDurationNotUnlockingOnlyResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountLockedLongerDurationNotUnlockingOnlyResponse(
      locks:
          decode
              .getListOfBytes(1)
              .map((b) => osmosis_lockup_lock.PeriodLock.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisLockupAccountLockedLongerDurationNotUnlockingOnlyResponse;
}

class AccountLockedLongerDurationDenomRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<AccountLockedLongerDurationDenomResponse> {
  final String? owner;

  final google_protobuf_duration.Duration? duration;

  final String? denom;

  const AccountLockedLongerDurationDenomRequest({
    this.owner,
    this.duration,
    this.denom,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/lockup/v1beta1/account_locked_longer_duration_denom/{owner}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [owner, duration, denom];

  @override
  Map<String, dynamic> toJson() {
    return {
      'owner': owner,
      'duration': duration?.encodeString(asNanos: true),
      'denom': denom,
    };
  }

  factory AccountLockedLongerDurationDenomRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return AccountLockedLongerDurationDenomRequest(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      duration: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'duration',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
      ),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory AccountLockedLongerDurationDenomRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountLockedLongerDurationDenomRequest(
      owner: decode.getString<String?>(1),
      duration: decode.messageTo<google_protobuf_duration.Duration?>(
        2,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
      denom: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisLockupAccountLockedLongerDurationDenomRequest;
  @override
  AccountLockedLongerDurationDenomResponse onQueryResponse(List<int> bytes) {
    return AccountLockedLongerDurationDenomResponse.deserialize(bytes);
  }

  @override
  AccountLockedLongerDurationDenomResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return AccountLockedLongerDurationDenomResponse.fromJson(json);
  }
}

class AccountLockedLongerDurationDenomResponse extends CosmosProtoMessage {
  final List<osmosis_lockup_lock.PeriodLock> locks;

  const AccountLockedLongerDurationDenomResponse({this.locks = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [locks];

  @override
  Map<String, dynamic> toJson() {
    return {'locks': locks.map((e) => e.toJson()).toList()};
  }

  factory AccountLockedLongerDurationDenomResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return AccountLockedLongerDurationDenomResponse(
      locks:
          (json.valueEnsureAsList<dynamic>('locks', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_lockup_lock.PeriodLock,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => osmosis_lockup_lock.PeriodLock.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory AccountLockedLongerDurationDenomResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountLockedLongerDurationDenomResponse(
      locks:
          decode
              .getListOfBytes(1)
              .map((b) => osmosis_lockup_lock.PeriodLock.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisLockupAccountLockedLongerDurationDenomResponse;
}

class QueryParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryParamsResponse> {
  const QueryParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/lockup/v1beta1/params",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryParamsRequest.fromJson(Map<String, dynamic> json) {
    return QueryParamsRequest();
  }

  factory QueryParamsRequest.deserialize(List<int> bytes) {
    return QueryParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupQueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

class QueryParamsResponse extends CosmosProtoMessage {
  final osmosis_lockup_params.Params? params;

  const QueryParamsResponse({this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [params];

  @override
  Map<String, dynamic> toJson() {
    return {'params': params?.toJson()};
  }

  factory QueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryParamsResponse(
      params: json.valueTo<osmosis_lockup_params.Params?, Map<String, dynamic>>(
        key: 'params',
        parse: (v) => osmosis_lockup_params.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<osmosis_lockup_params.Params?>(
        1,
        (b) => osmosis_lockup_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupQueryParamsResponse;
}
