import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/cosmos/vesting/v1beta1/src/vesting.dart"
    as cosmos_vesting_v1beta1_vesting;

/// MsgCreateVestingAccount defines a message that enables creating a vesting
/// account.
class MsgCreateVestingAccount extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateVestingAccountResponse>,
        ICosmosProtoAminoMessage {
  final String? fromAddress;

  final String? toAddress;

  final List<cosmos_base_v1beta1_coin.Coin> amount;

  /// end of vesting as unix time (in seconds).
  final BigInt? endTime;

  final bool? delayed;

  const MsgCreateVestingAccount({
    this.fromAddress,
    this.toAddress,
    this.amount = const [],
    this.endTime,
    this.delayed,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from_address"),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/MsgCreateVestingAccount",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.bool(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    fromAddress,
    toAddress,
    amount,
    endTime,
    delayed,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'from_address': fromAddress,
      'to_address': toAddress,
      'amount': amount.map((e) => e.toJson()).toList(),
      'end_time': endTime?.toString(),
      'delayed': delayed,
    };
  }

  factory MsgCreateVestingAccount.fromJson(Map<String, dynamic> json) {
    return MsgCreateVestingAccount(
      fromAddress: json.valueAsString<String?>(
        'from_address',
        acceptCamelCase: true,
      ),
      toAddress: json.valueAsString<String?>(
        'to_address',
        acceptCamelCase: true,
      ),
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
      endTime: json.valueAsBigInt<BigInt?>('end_time', acceptCamelCase: true),
      delayed: json.valueAsBool<bool?>('delayed', acceptCamelCase: true),
    );
  }

  factory MsgCreateVestingAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateVestingAccount(
      fromAddress: decode.getString<String?>(1),
      toAddress: decode.getString<String?>(2),
      amount:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      endTime: decode.getBigInt<BigInt?>(4),
      delayed: decode.getBool<bool?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosVestingV1beta1MsgCreateVestingAccount;
  @override
  MsgCreateVestingAccountResponse onServiceResponse(List<int> bytes) {
    return MsgCreateVestingAccountResponse.deserialize(bytes);
  }

  @override
  MsgCreateVestingAccountResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateVestingAccountResponse.fromJson(json);
  }
}

/// MsgCreateVestingAccountResponse defines the Msg/CreateVestingAccount response type.
class MsgCreateVestingAccountResponse extends CosmosProtoMessage {
  const MsgCreateVestingAccountResponse();

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

  factory MsgCreateVestingAccountResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateVestingAccountResponse();
  }

  factory MsgCreateVestingAccountResponse.deserialize(List<int> bytes) {
    return MsgCreateVestingAccountResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosVestingV1beta1MsgCreateVestingAccountResponse;
}

/// MsgCreatePermanentLockedAccount defines a message that enables creating a permanent
/// locked account.
class MsgCreatePermanentLockedAccount extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreatePermanentLockedAccountResponse>,
        ICosmosProtoAminoMessage {
  final String? fromAddress;

  final String? toAddress;

  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const MsgCreatePermanentLockedAccount({
    this.fromAddress,
    this.toAddress,
    this.amount = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from_address"),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/MsgCreatePermLockedAccount",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [fromAddress, toAddress, amount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'from_address': fromAddress,
      'to_address': toAddress,
      'amount': amount.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgCreatePermanentLockedAccount.fromJson(Map<String, dynamic> json) {
    return MsgCreatePermanentLockedAccount(
      fromAddress: json.valueAsString<String?>(
        'from_address',
        acceptCamelCase: true,
      ),
      toAddress: json.valueAsString<String?>(
        'to_address',
        acceptCamelCase: true,
      ),
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
    );
  }

  factory MsgCreatePermanentLockedAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreatePermanentLockedAccount(
      fromAddress: decode.getString<String?>(1),
      toAddress: decode.getString<String?>(2),
      amount:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosVestingV1beta1MsgCreatePermanentLockedAccount;
  @override
  MsgCreatePermanentLockedAccountResponse onServiceResponse(List<int> bytes) {
    return MsgCreatePermanentLockedAccountResponse.deserialize(bytes);
  }

  @override
  MsgCreatePermanentLockedAccountResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreatePermanentLockedAccountResponse.fromJson(json);
  }
}

/// MsgCreatePermanentLockedAccountResponse defines the Msg/CreatePermanentLockedAccount response type.
class MsgCreatePermanentLockedAccountResponse extends CosmosProtoMessage {
  const MsgCreatePermanentLockedAccountResponse();

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

  factory MsgCreatePermanentLockedAccountResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreatePermanentLockedAccountResponse();
  }

  factory MsgCreatePermanentLockedAccountResponse.deserialize(List<int> bytes) {
    return MsgCreatePermanentLockedAccountResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosVestingV1beta1MsgCreatePermanentLockedAccountResponse;
}

/// MsgCreateVestingAccount defines a message that enables creating a vesting
/// account.
class MsgCreatePeriodicVestingAccount extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreatePeriodicVestingAccountResponse>,
        ICosmosProtoAminoMessage {
  final String? fromAddress;

  final String? toAddress;

  /// start of vesting as unix time (in seconds).
  final BigInt? startTime;

  final List<cosmos_vesting_v1beta1_vesting.Period> vestingPeriods;

  const MsgCreatePeriodicVestingAccount({
    this.fromAddress,
    this.toAddress,
    this.startTime,
    this.vestingPeriods = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from_address"),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/MsgCreatePeriodVestAccount",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    fromAddress,
    toAddress,
    startTime,
    vestingPeriods,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'from_address': fromAddress,
      'to_address': toAddress,
      'start_time': startTime?.toString(),
      'vesting_periods': vestingPeriods.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgCreatePeriodicVestingAccount.fromJson(Map<String, dynamic> json) {
    return MsgCreatePeriodicVestingAccount(
      fromAddress: json.valueAsString<String?>(
        'from_address',
        acceptCamelCase: true,
      ),
      toAddress: json.valueAsString<String?>(
        'to_address',
        acceptCamelCase: true,
      ),
      startTime: json.valueAsBigInt<BigInt?>(
        'start_time',
        acceptCamelCase: true,
      ),
      vestingPeriods:
          (json.valueEnsureAsList<dynamic>(
                'vesting_periods',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_vesting_v1beta1_vesting.Period,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => cosmos_vesting_v1beta1_vesting.Period.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgCreatePeriodicVestingAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreatePeriodicVestingAccount(
      fromAddress: decode.getString<String?>(1),
      toAddress: decode.getString<String?>(2),
      startTime: decode.getBigInt<BigInt?>(3),
      vestingPeriods:
          decode
              .getListOfBytes(4)
              .map((b) => cosmos_vesting_v1beta1_vesting.Period.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosVestingV1beta1MsgCreatePeriodicVestingAccount;
  @override
  MsgCreatePeriodicVestingAccountResponse onServiceResponse(List<int> bytes) {
    return MsgCreatePeriodicVestingAccountResponse.deserialize(bytes);
  }

  @override
  MsgCreatePeriodicVestingAccountResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreatePeriodicVestingAccountResponse.fromJson(json);
  }
}

/// MsgCreateVestingAccountResponse defines the Msg/CreatePeriodicVestingAccount
/// response type.
class MsgCreatePeriodicVestingAccountResponse extends CosmosProtoMessage {
  const MsgCreatePeriodicVestingAccountResponse();

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

  factory MsgCreatePeriodicVestingAccountResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreatePeriodicVestingAccountResponse();
  }

  factory MsgCreatePeriodicVestingAccountResponse.deserialize(List<int> bytes) {
    return MsgCreatePeriodicVestingAccountResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosVestingV1beta1MsgCreatePeriodicVestingAccountResponse;
}
