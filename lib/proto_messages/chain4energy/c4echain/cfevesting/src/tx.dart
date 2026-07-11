import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// this line is used by starport scaffolding # proto/tx/rpc
class MsgCreateVestingPool extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgCreateVestingPoolResponse> {
  final String? owner;

  final String? name;

  final String? amount;

  final google_protobuf_duration.Duration? duration;

  final String? vestingType;

  const MsgCreateVestingPool({
    this.owner,
    this.name,
    this.amount,
    this.duration,
    this.vestingType,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.message(5, options: const []),
        ProtoFieldConfig.string(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [owner, name, amount, duration, vestingType];

  @override
  Map<String, dynamic> toJson() {
    return {
      'owner': owner,
      'name': name,
      'amount': amount,
      'duration': duration?.encodeString(asNanos: true),
      'vesting_type': vestingType,
    };
  }

  factory MsgCreateVestingPool.fromJson(Map<String, dynamic> json) {
    return MsgCreateVestingPool(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
      duration: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'duration',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
      ),
      vestingType: json.valueAsString<String?>(
        'vesting_type',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateVestingPool.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateVestingPool(
      owner: decode.getString<String?>(1),
      name: decode.getString<String?>(3),
      amount: decode.getString<String?>(4),
      duration: decode.messageTo<google_protobuf_duration.Duration?>(
        5,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
      vestingType: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingMsgCreateVestingPool;
  @override
  MsgCreateVestingPoolResponse onServiceResponse(List<int> bytes) {
    return MsgCreateVestingPoolResponse.deserialize(bytes);
  }

  @override
  MsgCreateVestingPoolResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateVestingPoolResponse.fromJson(json);
  }
}

class MsgCreateVestingPoolResponse extends CosmosProtoMessage {
  const MsgCreateVestingPoolResponse();

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

  factory MsgCreateVestingPoolResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateVestingPoolResponse();
  }

  factory MsgCreateVestingPoolResponse.deserialize(List<int> bytes) {
    return MsgCreateVestingPoolResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingMsgCreateVestingPoolResponse;
}

class MsgWithdrawAllAvailable extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgWithdrawAllAvailableResponse> {
  final String? owner;

  const MsgWithdrawAllAvailable({this.owner});

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
  List<Object?> get protoValues => [owner];

  @override
  Map<String, dynamic> toJson() {
    return {'owner': owner};
  }

  factory MsgWithdrawAllAvailable.fromJson(Map<String, dynamic> json) {
    return MsgWithdrawAllAvailable(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
    );
  }

  factory MsgWithdrawAllAvailable.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgWithdrawAllAvailable(owner: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingMsgWithdrawAllAvailable;
  @override
  MsgWithdrawAllAvailableResponse onServiceResponse(List<int> bytes) {
    return MsgWithdrawAllAvailableResponse.deserialize(bytes);
  }

  @override
  MsgWithdrawAllAvailableResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgWithdrawAllAvailableResponse.fromJson(json);
  }
}

class MsgWithdrawAllAvailableResponse extends CosmosProtoMessage {
  final String? withdrawn;

  const MsgWithdrawAllAvailableResponse({this.withdrawn});

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
  List<Object?> get protoValues => [withdrawn];

  @override
  Map<String, dynamic> toJson() {
    return {'withdrawn': withdrawn};
  }

  factory MsgWithdrawAllAvailableResponse.fromJson(Map<String, dynamic> json) {
    return MsgWithdrawAllAvailableResponse(
      withdrawn: json.valueAsString<String?>(
        'withdrawn',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgWithdrawAllAvailableResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgWithdrawAllAvailableResponse(
      withdrawn: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingMsgWithdrawAllAvailableResponse;
}

class MsgCreateVestingAccount extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgCreateVestingAccountResponse> {
  final String? fromAddress;

  final String? toAddress;

  final List<cosmos_base_v1beta1_coin.Coin> amount;

  final BigInt? startTime;

  final BigInt? endTime;

  const MsgCreateVestingAccount({
    this.fromAddress,
    this.toAddress,
    this.amount = const [],
    this.startTime,
    this.endTime,
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
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.int64(4, options: const []),
        ProtoFieldConfig.int64(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    fromAddress,
    toAddress,
    amount,
    startTime,
    endTime,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'from_address': fromAddress,
      'to_address': toAddress,
      'amount': amount.map((e) => e.toJson()).toList(),
      'start_time': startTime?.toString(),
      'end_time': endTime?.toString(),
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
      startTime: json.valueAsBigInt<BigInt?>(
        'start_time',
        acceptCamelCase: true,
      ),
      endTime: json.valueAsBigInt<BigInt?>('end_time', acceptCamelCase: true),
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
      startTime: decode.getBigInt<BigInt?>(4),
      endTime: decode.getBigInt<BigInt?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingMsgCreateVestingAccount;
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
          .chain4energyC4echainCfevestingMsgCreateVestingAccountResponse;
}

class MsgSendToVestingAccount extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgSendToVestingAccountResponse> {
  final String? owner;

  final String? toAddress;

  final String? vestingPoolName;

  final String? amount;

  final bool? restartVesting;

  const MsgSendToVestingAccount({
    this.owner,
    this.toAddress,
    this.vestingPoolName,
    this.amount,
    this.restartVesting,
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
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.bool(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    owner,
    toAddress,
    vestingPoolName,
    amount,
    restartVesting,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'owner': owner,
      'to_address': toAddress,
      'vesting_pool_name': vestingPoolName,
      'amount': amount,
      'restart_vesting': restartVesting,
    };
  }

  factory MsgSendToVestingAccount.fromJson(Map<String, dynamic> json) {
    return MsgSendToVestingAccount(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      toAddress: json.valueAsString<String?>(
        'to_address',
        acceptCamelCase: true,
      ),
      vestingPoolName: json.valueAsString<String?>(
        'vesting_pool_name',
        acceptCamelCase: true,
      ),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
      restartVesting: json.valueAsBool<bool?>(
        'restart_vesting',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgSendToVestingAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSendToVestingAccount(
      owner: decode.getString<String?>(1),
      toAddress: decode.getString<String?>(2),
      vestingPoolName: decode.getString<String?>(3),
      amount: decode.getString<String?>(4),
      restartVesting: decode.getBool<bool?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingMsgSendToVestingAccount;
  @override
  MsgSendToVestingAccountResponse onServiceResponse(List<int> bytes) {
    return MsgSendToVestingAccountResponse.deserialize(bytes);
  }

  @override
  MsgSendToVestingAccountResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSendToVestingAccountResponse.fromJson(json);
  }
}

class MsgSendToVestingAccountResponse extends CosmosProtoMessage {
  const MsgSendToVestingAccountResponse();

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

  factory MsgSendToVestingAccountResponse.fromJson(Map<String, dynamic> json) {
    return MsgSendToVestingAccountResponse();
  }

  factory MsgSendToVestingAccountResponse.deserialize(List<int> bytes) {
    return MsgSendToVestingAccountResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingMsgSendToVestingAccountResponse;
}

class MsgSplitVesting extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgSplitVestingResponse> {
  final String? fromAddress;

  final String? toAddress;

  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const MsgSplitVesting({
    this.fromAddress,
    this.toAddress,
    this.amount = const [],
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
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
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

  factory MsgSplitVesting.fromJson(Map<String, dynamic> json) {
    return MsgSplitVesting(
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

  factory MsgSplitVesting.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSplitVesting(
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
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfevestingMsgSplitVesting;
  @override
  MsgSplitVestingResponse onServiceResponse(List<int> bytes) {
    return MsgSplitVestingResponse.deserialize(bytes);
  }

  @override
  MsgSplitVestingResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgSplitVestingResponse.fromJson(json);
  }
}

class MsgSplitVestingResponse extends CosmosProtoMessage {
  const MsgSplitVestingResponse();

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

  factory MsgSplitVestingResponse.fromJson(Map<String, dynamic> json) {
    return MsgSplitVestingResponse();
  }

  factory MsgSplitVestingResponse.deserialize(List<int> bytes) {
    return MsgSplitVestingResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingMsgSplitVestingResponse;
}

class MsgMoveAvailableVesting extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgMoveAvailableVestingResponse> {
  final String? fromAddress;

  final String? toAddress;

  const MsgMoveAvailableVesting({this.fromAddress, this.toAddress});

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
  List<Object?> get protoValues => [fromAddress, toAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'from_address': fromAddress, 'to_address': toAddress};
  }

  factory MsgMoveAvailableVesting.fromJson(Map<String, dynamic> json) {
    return MsgMoveAvailableVesting(
      fromAddress: json.valueAsString<String?>(
        'from_address',
        acceptCamelCase: true,
      ),
      toAddress: json.valueAsString<String?>(
        'to_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgMoveAvailableVesting.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgMoveAvailableVesting(
      fromAddress: decode.getString<String?>(1),
      toAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingMsgMoveAvailableVesting;
  @override
  MsgMoveAvailableVestingResponse onServiceResponse(List<int> bytes) {
    return MsgMoveAvailableVestingResponse.deserialize(bytes);
  }

  @override
  MsgMoveAvailableVestingResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgMoveAvailableVestingResponse.fromJson(json);
  }
}

class MsgMoveAvailableVestingResponse extends CosmosProtoMessage {
  const MsgMoveAvailableVestingResponse();

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

  factory MsgMoveAvailableVestingResponse.fromJson(Map<String, dynamic> json) {
    return MsgMoveAvailableVestingResponse();
  }

  factory MsgMoveAvailableVestingResponse.deserialize(List<int> bytes) {
    return MsgMoveAvailableVestingResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingMsgMoveAvailableVestingResponse;
}

class MsgMoveAvailableVestingByDenoms extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgMoveAvailableVestingByDenomsResponse> {
  final String? fromAddress;

  final String? toAddress;

  final List<String> denoms;

  const MsgMoveAvailableVestingByDenoms({
    this.fromAddress,
    this.toAddress,
    this.denoms = const [],
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
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [fromAddress, toAddress, denoms];

  @override
  Map<String, dynamic> toJson() {
    return {
      'from_address': fromAddress,
      'to_address': toAddress,
      'denoms': denoms.map((e) => e).toList(),
    };
  }

  factory MsgMoveAvailableVestingByDenoms.fromJson(Map<String, dynamic> json) {
    return MsgMoveAvailableVestingByDenoms(
      fromAddress: json.valueAsString<String?>(
        'from_address',
        acceptCamelCase: true,
      ),
      toAddress: json.valueAsString<String?>(
        'to_address',
        acceptCamelCase: true,
      ),
      denoms:
          (json.valueEnsureAsList<dynamic>(
            'denoms',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgMoveAvailableVestingByDenoms.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgMoveAvailableVestingByDenoms(
      fromAddress: decode.getString<String?>(1),
      toAddress: decode.getString<String?>(2),
      denoms: decode.getListOrEmpty<String>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingMsgMoveAvailableVestingByDenoms;
  @override
  MsgMoveAvailableVestingByDenomsResponse onServiceResponse(List<int> bytes) {
    return MsgMoveAvailableVestingByDenomsResponse.deserialize(bytes);
  }

  @override
  MsgMoveAvailableVestingByDenomsResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgMoveAvailableVestingByDenomsResponse.fromJson(json);
  }
}

class MsgMoveAvailableVestingByDenomsResponse extends CosmosProtoMessage {
  const MsgMoveAvailableVestingByDenomsResponse();

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

  factory MsgMoveAvailableVestingByDenomsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgMoveAvailableVestingByDenomsResponse();
  }

  factory MsgMoveAvailableVestingByDenomsResponse.deserialize(List<int> bytes) {
    return MsgMoveAvailableVestingByDenomsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingMsgMoveAvailableVestingByDenomsResponse;
}

/// this line is used by starport scaffolding # proto/tx/message
class MsgUpdateDenomParam extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgUpdateDenomParamResponse> {
  /// authority is the address of the governance account.
  final String? authority;

  final String? denom;

  const MsgUpdateDenomParam({this.authority, this.denom});

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
  List<Object?> get protoValues => [authority, denom];

  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'denom': denom};
  }

  factory MsgUpdateDenomParam.fromJson(Map<String, dynamic> json) {
    return MsgUpdateDenomParam(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory MsgUpdateDenomParam.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateDenomParam(
      authority: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingMsgUpdateDenomParam;
  @override
  MsgUpdateDenomParamResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateDenomParamResponse.deserialize(bytes);
  }

  @override
  MsgUpdateDenomParamResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateDenomParamResponse.fromJson(json);
  }
}

class MsgUpdateDenomParamResponse extends CosmosProtoMessage {
  const MsgUpdateDenomParamResponse();

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

  factory MsgUpdateDenomParamResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateDenomParamResponse();
  }

  factory MsgUpdateDenomParamResponse.deserialize(List<int> bytes) {
    return MsgUpdateDenomParamResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingMsgUpdateDenomParamResponse;
}
