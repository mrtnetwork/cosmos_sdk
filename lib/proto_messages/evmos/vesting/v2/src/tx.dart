import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/cosmos/vesting/v1beta1/src/vesting.dart"
    as cosmos_vesting_v1beta1_vesting;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// MsgCreateClawbackVestingAccount defines a message that enables creating a
/// ClawbackVestingAccount.
class MsgCreateClawbackVestingAccount extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateClawbackVestingAccountResponse>,
        ICosmosProtoAminoMessage {
  /// funder_address specifies the account that will be able to fund the vesting account
  final String? funderAddress;

  /// vesting_address specifies the address that will receive the vesting tokens
  final String? vestingAddress;

  /// enable_gov_clawback specifies whether the governance module can clawback this account
  final bool? enableGovClawback;

  const MsgCreateClawbackVestingAccount({
    this.funderAddress,
    this.vestingAddress,
    this.enableGovClawback,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "evmos/MsgCreateClawbackVestingAccount",
        ),
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "vesting_address",
        ),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/evmos/vesting/v2/tx/create_clawback_vesting_account",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.bool(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    funderAddress,
    vestingAddress,
    enableGovClawback,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'funder_address': funderAddress,
      'vesting_address': vestingAddress,
      'enable_gov_clawback': enableGovClawback,
    };
  }

  factory MsgCreateClawbackVestingAccount.fromJson(Map<String, dynamic> json) {
    return MsgCreateClawbackVestingAccount(
      funderAddress: json.valueAsString<String?>(
        'funder_address',
        acceptCamelCase: true,
      ),
      vestingAddress: json.valueAsString<String?>(
        'vesting_address',
        acceptCamelCase: true,
      ),
      enableGovClawback: json.valueAsBool<bool?>(
        'enable_gov_clawback',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateClawbackVestingAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateClawbackVestingAccount(
      funderAddress: decode.getString<String?>(1),
      vestingAddress: decode.getString<String?>(2),
      enableGovClawback: decode.getBool<bool?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosVestingV2MsgCreateClawbackVestingAccount;
  @override
  MsgCreateClawbackVestingAccountResponse onServiceResponse(List<int> bytes) {
    return MsgCreateClawbackVestingAccountResponse.deserialize(bytes);
  }

  @override
  MsgCreateClawbackVestingAccountResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateClawbackVestingAccountResponse.fromJson(json);
  }
}

/// MsgCreateClawbackVestingAccountResponse defines the
/// MsgCreateClawbackVestingAccount response type.
class MsgCreateClawbackVestingAccountResponse extends CosmosProtoMessage {
  const MsgCreateClawbackVestingAccountResponse();

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

  factory MsgCreateClawbackVestingAccountResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateClawbackVestingAccountResponse();
  }

  factory MsgCreateClawbackVestingAccountResponse.deserialize(List<int> bytes) {
    return MsgCreateClawbackVestingAccountResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .evmosVestingV2MsgCreateClawbackVestingAccountResponse;
}

/// MsgFundVestingAccount defines a message that enables funding an existing clawback
/// vesting account.
class MsgFundVestingAccount extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgFundVestingAccountResponse>,
        ICosmosProtoAminoMessage {
  /// funder_address specifies the account that funds the vesting account
  final String? funderAddress;

  /// vesting_address specifies the account that receives the funds
  final String? vestingAddress;

  /// start_time defines the time at which the vesting period begins
  final google_protobuf_timestamp.Timestamp? startTime;

  /// lockup_periods defines the unlocking schedule relative to the start_time
  final List<cosmos_vesting_v1beta1_vesting.Period> lockupPeriods;

  /// vesting_periods defines the vesting schedule relative to the start_time
  final List<cosmos_vesting_v1beta1_vesting.Period> vestingPeriods;

  const MsgFundVestingAccount({
    this.funderAddress,
    this.vestingAddress,
    this.startTime,
    this.lockupPeriods = const [],
    this.vestingPeriods = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "evmos/MsgFundVestingAccount",
        ),
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "funder_address",
        ),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/evmos/vesting/v2/tx/fund_vesting_account",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    funderAddress,
    vestingAddress,
    startTime,
    lockupPeriods,
    vestingPeriods,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'funder_address': funderAddress,
      'vesting_address': vestingAddress,
      'start_time': startTime?.toRfc3339(),
      'lockup_periods': lockupPeriods.map((e) => e.toJson()).toList(),
      'vesting_periods': vestingPeriods.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgFundVestingAccount.fromJson(Map<String, dynamic> json) {
    return MsgFundVestingAccount(
      funderAddress: json.valueAsString<String?>(
        'funder_address',
        acceptCamelCase: true,
      ),
      vestingAddress: json.valueAsString<String?>(
        'vesting_address',
        acceptCamelCase: true,
      ),
      startTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'start_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      lockupPeriods:
          (json.valueEnsureAsList<dynamic>(
                'lockup_periods',
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

  factory MsgFundVestingAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgFundVestingAccount(
      funderAddress: decode.getString<String?>(1),
      vestingAddress: decode.getString<String?>(2),
      startTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        3,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      lockupPeriods:
          decode
              .getListOfBytes(4)
              .map((b) => cosmos_vesting_v1beta1_vesting.Period.deserialize(b))
              .toList(),
      vestingPeriods:
          decode
              .getListOfBytes(5)
              .map((b) => cosmos_vesting_v1beta1_vesting.Period.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosVestingV2MsgFundVestingAccount;
  @override
  MsgFundVestingAccountResponse onServiceResponse(List<int> bytes) {
    return MsgFundVestingAccountResponse.deserialize(bytes);
  }

  @override
  MsgFundVestingAccountResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgFundVestingAccountResponse.fromJson(json);
  }
}

/// MsgFundVestingAccountResponse defines the
/// MsgFundVestingAccount response type.
class MsgFundVestingAccountResponse extends CosmosProtoMessage {
  const MsgFundVestingAccountResponse();

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

  factory MsgFundVestingAccountResponse.fromJson(Map<String, dynamic> json) {
    return MsgFundVestingAccountResponse();
  }

  factory MsgFundVestingAccountResponse.deserialize(List<int> bytes) {
    return MsgFundVestingAccountResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosVestingV2MsgFundVestingAccountResponse;
}

/// MsgClawback defines a message that removes unvested tokens from a
/// ClawbackVestingAccount.
class MsgClawback extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgClawbackResponse>,
        ICosmosProtoAminoMessage {
  /// funder_address is the address which funded the account
  final String? funderAddress;

  /// account_address is the address of the ClawbackVestingAccount to claw back
  /// from.
  final String? accountAddress;

  /// dest_address specifies where the clawed-back tokens should be transferred
  /// to. If empty, the tokens will be transferred back to the original funder of
  /// the account.
  final String? destAddress;

  const MsgClawback({
    this.funderAddress,
    this.accountAddress,
    this.destAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "evmos/MsgClawback"),
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "funder_address",
        ),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/evmos/vesting/v2/tx/clawback",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [funderAddress, accountAddress, destAddress];

  @override
  Map<String, dynamic> toJson() {
    return {
      'funder_address': funderAddress,
      'account_address': accountAddress,
      'dest_address': destAddress,
    };
  }

  factory MsgClawback.fromJson(Map<String, dynamic> json) {
    return MsgClawback(
      funderAddress: json.valueAsString<String?>(
        'funder_address',
        acceptCamelCase: true,
      ),
      accountAddress: json.valueAsString<String?>(
        'account_address',
        acceptCamelCase: true,
      ),
      destAddress: json.valueAsString<String?>(
        'dest_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgClawback.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgClawback(
      funderAddress: decode.getString<String?>(1),
      accountAddress: decode.getString<String?>(2),
      destAddress: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosVestingV2MsgClawback;
  @override
  MsgClawbackResponse onServiceResponse(List<int> bytes) {
    return MsgClawbackResponse.deserialize(bytes);
  }

  @override
  MsgClawbackResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgClawbackResponse.fromJson(json);
  }
}

/// MsgClawbackResponse defines the MsgClawback response type.
class MsgClawbackResponse extends CosmosProtoMessage {
  /// coins is the slice of clawed back coins
  final List<cosmos_base_v1beta1_coin.Coin> coins;

  const MsgClawbackResponse({this.coins = const []});

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
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
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

  factory MsgClawbackResponse.fromJson(Map<String, dynamic> json) {
    return MsgClawbackResponse(
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

  factory MsgClawbackResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgClawbackResponse(
      coins:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosVestingV2MsgClawbackResponse;
}

/// MsgUpdateVestingFunder defines a message that updates the funder account of a
/// ClawbackVestingAccount.
class MsgUpdateVestingFunder extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateVestingFunderResponse>,
        ICosmosProtoAminoMessage {
  /// funder_address is the current funder address of the ClawbackVestingAccount
  final String? funderAddress;

  /// new_funder_address is the new address to replace the existing funder_address
  final String? newFunderAddress;

  /// vesting_address is the address of the ClawbackVestingAccount being updated
  final String? vestingAddress;

  const MsgUpdateVestingFunder({
    this.funderAddress,
    this.newFunderAddress,
    this.vestingAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "evmos/MsgUpdateVestingFunder",
        ),
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "funder_address",
        ),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/evmos/vesting/v2/tx/update_vesting_funder",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    funderAddress,
    newFunderAddress,
    vestingAddress,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'funder_address': funderAddress,
      'new_funder_address': newFunderAddress,
      'vesting_address': vestingAddress,
    };
  }

  factory MsgUpdateVestingFunder.fromJson(Map<String, dynamic> json) {
    return MsgUpdateVestingFunder(
      funderAddress: json.valueAsString<String?>(
        'funder_address',
        acceptCamelCase: true,
      ),
      newFunderAddress: json.valueAsString<String?>(
        'new_funder_address',
        acceptCamelCase: true,
      ),
      vestingAddress: json.valueAsString<String?>(
        'vesting_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateVestingFunder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateVestingFunder(
      funderAddress: decode.getString<String?>(1),
      newFunderAddress: decode.getString<String?>(2),
      vestingAddress: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosVestingV2MsgUpdateVestingFunder;
  @override
  MsgUpdateVestingFunderResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateVestingFunderResponse.deserialize(bytes);
  }

  @override
  MsgUpdateVestingFunderResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateVestingFunderResponse.fromJson(json);
  }
}

/// MsgUpdateVestingFunderResponse defines the MsgUpdateVestingFunder response
/// type.
class MsgUpdateVestingFunderResponse extends CosmosProtoMessage {
  const MsgUpdateVestingFunderResponse();

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

  factory MsgUpdateVestingFunderResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateVestingFunderResponse();
  }

  factory MsgUpdateVestingFunderResponse.deserialize(List<int> bytes) {
    return MsgUpdateVestingFunderResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosVestingV2MsgUpdateVestingFunderResponse;
}

/// MsgConvertVestingAccount defines a message that enables converting a vesting account to an eth account
class MsgConvertVestingAccount extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgConvertVestingAccountResponse>,
        ICosmosProtoAminoMessage {
  /// vesting_address is the address of the vesting account to convert
  final String? vestingAddress;

  const MsgConvertVestingAccount({this.vestingAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "evmos/MsgConvertVestingAccount",
        ),
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "vesting_address",
        ),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/evmos/vesting/v2/tx/convert_vesting_account",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [vestingAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'vesting_address': vestingAddress};
  }

  factory MsgConvertVestingAccount.fromJson(Map<String, dynamic> json) {
    return MsgConvertVestingAccount(
      vestingAddress: json.valueAsString<String?>(
        'vesting_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgConvertVestingAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgConvertVestingAccount(
      vestingAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosVestingV2MsgConvertVestingAccount;
  @override
  MsgConvertVestingAccountResponse onServiceResponse(List<int> bytes) {
    return MsgConvertVestingAccountResponse.deserialize(bytes);
  }

  @override
  MsgConvertVestingAccountResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgConvertVestingAccountResponse.fromJson(json);
  }
}

/// MsgConvertVestingAccountResponse defines the MsgConvertVestingAccount response type.
class MsgConvertVestingAccountResponse extends CosmosProtoMessage {
  const MsgConvertVestingAccountResponse();

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

  factory MsgConvertVestingAccountResponse.fromJson(Map<String, dynamic> json) {
    return MsgConvertVestingAccountResponse();
  }

  factory MsgConvertVestingAccountResponse.deserialize(List<int> bytes) {
    return MsgConvertVestingAccountResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosVestingV2MsgConvertVestingAccountResponse;
}
