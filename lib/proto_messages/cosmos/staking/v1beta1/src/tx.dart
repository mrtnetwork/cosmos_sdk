import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/staking/v1beta1/src/staking.dart"
    as cosmos_staking_v1beta1_staking;
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;

/// MsgCreateValidator defines a SDK message for creating a new validator.
class MsgCreateValidator extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateValidatorResponse>,
        ICosmosProtoAminoMessage {
  final cosmos_staking_v1beta1_staking.Description? description;

  final cosmos_staking_v1beta1_staking.CommissionRates? commission;

  final String? minSelfDelegation;

  /// Deprecated: Use of Delegator Address in MsgCreateValidator is deprecated.
  /// The validator address bytes and delegator address bytes refer to the same account while creating validator (defer
  /// only in bech32 notation).
  final String? delegatorAddress;

  final String? validatorAddress;

  final google_protobuf_any.Any? pubkey;

  final cosmos_base_v1beta1_coin.Coin? value;

  const MsgCreateValidator({
    this.description,
    this.commission,
    this.minSelfDelegation,
    this.delegatorAddress,
    this.validatorAddress,
    this.pubkey,
    this.value,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "validator_address",
        ),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/MsgCreateValidator",
        ),
      ],
      fields: [
        ProtoFieldConfig.message(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          4,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.message(6, options: const []),
        ProtoFieldConfig.message(
          7,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    description,
    commission,
    minSelfDelegation,
    delegatorAddress,
    validatorAddress,
    pubkey,
    value,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'description': description?.toJson(),
      'commission': commission?.toJson(),
      'min_self_delegation': minSelfDelegation,
      'delegator_address': delegatorAddress,
      'validator_address': validatorAddress,
      'pubkey': pubkey?.toJson(),
      'value': value?.toJson(),
    };
  }

  factory MsgCreateValidator.fromJson(Map<String, dynamic> json) {
    return MsgCreateValidator(
      description: json.valueTo<
        cosmos_staking_v1beta1_staking.Description?,
        Map<String, dynamic>
      >(
        key: 'description',
        parse: (v) => cosmos_staking_v1beta1_staking.Description.fromJson(v),
        acceptCamelCase: true,
      ),
      commission: json.valueTo<
        cosmos_staking_v1beta1_staking.CommissionRates?,
        Map<String, dynamic>
      >(
        key: 'commission',
        parse:
            (v) => cosmos_staking_v1beta1_staking.CommissionRates.fromJson(v),
        acceptCamelCase: true,
      ),
      minSelfDelegation: json.valueAsString<String?>(
        'min_self_delegation',
        acceptCamelCase: true,
      ),
      delegatorAddress: json.valueAsString<String?>(
        'delegator_address',
        acceptCamelCase: true,
      ),
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
      pubkey: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'pubkey',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
      value: json.valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
        key: 'value',
        parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateValidator.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateValidator(
      description: decode
          .messageTo<cosmos_staking_v1beta1_staking.Description?>(
            1,
            (b) => cosmos_staking_v1beta1_staking.Description.deserialize(b),
          ),
      commission: decode
          .messageTo<cosmos_staking_v1beta1_staking.CommissionRates?>(
            2,
            (b) =>
                cosmos_staking_v1beta1_staking.CommissionRates.deserialize(b),
          ),
      minSelfDelegation: decode.getString<String?>(3),
      delegatorAddress: decode.getString<String?>(4),
      validatorAddress: decode.getString<String?>(5),
      pubkey: decode.messageTo<google_protobuf_any.Any?>(
        6,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      value: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        7,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosStakingV1beta1MsgCreateValidator;
  @override
  MsgCreateValidatorResponse onServiceResponse(List<int> bytes) {
    return MsgCreateValidatorResponse.deserialize(bytes);
  }

  @override
  MsgCreateValidatorResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgCreateValidatorResponse.fromJson(json);
  }
}

/// MsgCreateValidatorResponse defines the Msg/CreateValidator response type.
class MsgCreateValidatorResponse extends CosmosProtoMessage {
  const MsgCreateValidatorResponse();

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

  factory MsgCreateValidatorResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateValidatorResponse();
  }

  factory MsgCreateValidatorResponse.deserialize(List<int> bytes) {
    return MsgCreateValidatorResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosStakingV1beta1MsgCreateValidatorResponse;
}

/// MsgEditValidator defines a SDK message for editing an existing validator.
class MsgEditValidator extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgEditValidatorResponse>,
        ICosmosProtoAminoMessage {
  final cosmos_staking_v1beta1_staking.Description? description;

  final String? validatorAddress;

  /// We pass a reference to the new commission rate and min self delegation as
  /// it's not mandatory to update. If not updated, the deserialized rate will be
  /// zero with no way to distinguish if an update was intended.
  /// REF: #2373
  final String? commissionRate;

  final String? minSelfDelegation;

  const MsgEditValidator({
    this.description,
    this.validatorAddress,
    this.commissionRate,
    this.minSelfDelegation,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "validator_address",
        ),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/MsgEditValidator",
        ),
      ],
      fields: [
        ProtoFieldConfig.message(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    description,
    validatorAddress,
    commissionRate,
    minSelfDelegation,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'description': description?.toJson(),
      'validator_address': validatorAddress,
      'commission_rate': commissionRate,
      'min_self_delegation': minSelfDelegation,
    };
  }

  factory MsgEditValidator.fromJson(Map<String, dynamic> json) {
    return MsgEditValidator(
      description: json.valueTo<
        cosmos_staking_v1beta1_staking.Description?,
        Map<String, dynamic>
      >(
        key: 'description',
        parse: (v) => cosmos_staking_v1beta1_staking.Description.fromJson(v),
        acceptCamelCase: true,
      ),
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
      commissionRate: json.valueAsString<String?>(
        'commission_rate',
        acceptCamelCase: true,
      ),
      minSelfDelegation: json.valueAsString<String?>(
        'min_self_delegation',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgEditValidator.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgEditValidator(
      description: decode
          .messageTo<cosmos_staking_v1beta1_staking.Description?>(
            1,
            (b) => cosmos_staking_v1beta1_staking.Description.deserialize(b),
          ),
      validatorAddress: decode.getString<String?>(2),
      commissionRate: decode.getString<String?>(3),
      minSelfDelegation: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosStakingV1beta1MsgEditValidator;
  @override
  MsgEditValidatorResponse onServiceResponse(List<int> bytes) {
    return MsgEditValidatorResponse.deserialize(bytes);
  }

  @override
  MsgEditValidatorResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgEditValidatorResponse.fromJson(json);
  }
}

/// MsgEditValidatorResponse defines the Msg/EditValidator response type.
class MsgEditValidatorResponse extends CosmosProtoMessage {
  const MsgEditValidatorResponse();

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

  factory MsgEditValidatorResponse.fromJson(Map<String, dynamic> json) {
    return MsgEditValidatorResponse();
  }

  factory MsgEditValidatorResponse.deserialize(List<int> bytes) {
    return MsgEditValidatorResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosStakingV1beta1MsgEditValidatorResponse;
}

/// MsgDelegate defines a SDK message for performing a delegation of coins
/// from a delegator to a validator.
class MsgDelegate extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDelegateResponse>,
        ICosmosProtoAminoMessage {
  final String? delegatorAddress;

  final String? validatorAddress;

  final cosmos_base_v1beta1_coin.Coin? amount;

  const MsgDelegate({
    this.delegatorAddress,
    this.validatorAddress,
    this.amount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "delegator_address",
        ),
        ProtoOptionString(name: "amino.name", value: "cosmos-sdk/MsgDelegate"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddress, validatorAddress, amount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_address': delegatorAddress,
      'validator_address': validatorAddress,
      'amount': amount?.toJson(),
    };
  }

  factory MsgDelegate.fromJson(Map<String, dynamic> json) {
    return MsgDelegate(
      delegatorAddress: json.valueAsString<String?>(
        'delegator_address',
        acceptCamelCase: true,
      ),
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgDelegate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDelegate(
      delegatorAddress: decode.getString<String?>(1),
      validatorAddress: decode.getString<String?>(2),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosStakingV1beta1MsgDelegate;
  @override
  MsgDelegateResponse onServiceResponse(List<int> bytes) {
    return MsgDelegateResponse.deserialize(bytes);
  }

  @override
  MsgDelegateResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgDelegateResponse.fromJson(json);
  }
}

/// MsgDelegateResponse defines the Msg/Delegate response type.
class MsgDelegateResponse extends CosmosProtoMessage {
  const MsgDelegateResponse();

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

  factory MsgDelegateResponse.fromJson(Map<String, dynamic> json) {
    return MsgDelegateResponse();
  }

  factory MsgDelegateResponse.deserialize(List<int> bytes) {
    return MsgDelegateResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosStakingV1beta1MsgDelegateResponse;
}

/// MsgBeginRedelegate defines a SDK message for performing a redelegation
/// of coins from a delegator and source validator to a destination validator.
class MsgBeginRedelegate extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgBeginRedelegateResponse>,
        ICosmosProtoAminoMessage {
  final String? delegatorAddress;

  final String? validatorSrcAddress;

  final String? validatorDstAddress;

  final cosmos_base_v1beta1_coin.Coin? amount;

  const MsgBeginRedelegate({
    this.delegatorAddress,
    this.validatorSrcAddress,
    this.validatorDstAddress,
    this.amount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "delegator_address",
        ),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/MsgBeginRedelegate",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.message(
          4,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    delegatorAddress,
    validatorSrcAddress,
    validatorDstAddress,
    amount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_address': delegatorAddress,
      'validator_src_address': validatorSrcAddress,
      'validator_dst_address': validatorDstAddress,
      'amount': amount?.toJson(),
    };
  }

  factory MsgBeginRedelegate.fromJson(Map<String, dynamic> json) {
    return MsgBeginRedelegate(
      delegatorAddress: json.valueAsString<String?>(
        'delegator_address',
        acceptCamelCase: true,
      ),
      validatorSrcAddress: json.valueAsString<String?>(
        'validator_src_address',
        acceptCamelCase: true,
      ),
      validatorDstAddress: json.valueAsString<String?>(
        'validator_dst_address',
        acceptCamelCase: true,
      ),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgBeginRedelegate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBeginRedelegate(
      delegatorAddress: decode.getString<String?>(1),
      validatorSrcAddress: decode.getString<String?>(2),
      validatorDstAddress: decode.getString<String?>(3),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        4,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosStakingV1beta1MsgBeginRedelegate;
  @override
  MsgBeginRedelegateResponse onServiceResponse(List<int> bytes) {
    return MsgBeginRedelegateResponse.deserialize(bytes);
  }

  @override
  MsgBeginRedelegateResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgBeginRedelegateResponse.fromJson(json);
  }
}

/// MsgBeginRedelegateResponse defines the Msg/BeginRedelegate response type.
class MsgBeginRedelegateResponse extends CosmosProtoMessage {
  final google_protobuf_timestamp.Timestamp? completionTime;

  const MsgBeginRedelegateResponse({this.completionTime});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [completionTime];

  @override
  Map<String, dynamic> toJson() {
    return {'completion_time': completionTime?.toRfc3339()};
  }

  factory MsgBeginRedelegateResponse.fromJson(Map<String, dynamic> json) {
    return MsgBeginRedelegateResponse(
      completionTime: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'completion_time',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgBeginRedelegateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBeginRedelegateResponse(
      completionTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        1,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosStakingV1beta1MsgBeginRedelegateResponse;
}

/// MsgUndelegate defines a SDK message for performing an undelegation from a
/// delegate and a validator.
class MsgUndelegate extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUndelegateResponse>,
        ICosmosProtoAminoMessage {
  final String? delegatorAddress;

  final String? validatorAddress;

  final cosmos_base_v1beta1_coin.Coin? amount;

  const MsgUndelegate({
    this.delegatorAddress,
    this.validatorAddress,
    this.amount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "delegator_address",
        ),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/MsgUndelegate",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddress, validatorAddress, amount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_address': delegatorAddress,
      'validator_address': validatorAddress,
      'amount': amount?.toJson(),
    };
  }

  factory MsgUndelegate.fromJson(Map<String, dynamic> json) {
    return MsgUndelegate(
      delegatorAddress: json.valueAsString<String?>(
        'delegator_address',
        acceptCamelCase: true,
      ),
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgUndelegate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUndelegate(
      delegatorAddress: decode.getString<String?>(1),
      validatorAddress: decode.getString<String?>(2),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosStakingV1beta1MsgUndelegate;
  @override
  MsgUndelegateResponse onServiceResponse(List<int> bytes) {
    return MsgUndelegateResponse.deserialize(bytes);
  }

  @override
  MsgUndelegateResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUndelegateResponse.fromJson(json);
  }
}

/// MsgUndelegateResponse defines the Msg/Undelegate response type.
class MsgUndelegateResponse extends CosmosProtoMessage {
  final google_protobuf_timestamp.Timestamp? completionTime;

  /// amount returns the amount of undelegated coins
  final cosmos_base_v1beta1_coin.Coin? amount;

  const MsgUndelegateResponse({this.completionTime, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          2,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.50",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [completionTime, amount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'completion_time': completionTime?.toRfc3339(),
      'amount': amount?.toJson(),
    };
  }

  factory MsgUndelegateResponse.fromJson(Map<String, dynamic> json) {
    return MsgUndelegateResponse(
      completionTime: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'completion_time',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgUndelegateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUndelegateResponse(
      completionTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        1,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        2,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosStakingV1beta1MsgUndelegateResponse;
}

/// MsgCancelUnbondingDelegation defines the SDK message for performing a cancel unbonding delegation for delegator
class MsgCancelUnbondingDelegation extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCancelUnbondingDelegationResponse>,
        ICosmosProtoAminoMessage {
  final String? delegatorAddress;

  final String? validatorAddress;

  /// amount is always less than or equal to unbonding delegation entry balance
  final cosmos_base_v1beta1_coin.Coin? amount;

  /// creation_height is the height which the unbonding took place.
  final BigInt? creationHeight;

  const MsgCancelUnbondingDelegation({
    this.delegatorAddress,
    this.validatorAddress,
    this.amount,
    this.creationHeight,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "delegator_address",
        ),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/MsgCancelUnbondingDelegation",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.int64(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    delegatorAddress,
    validatorAddress,
    amount,
    creationHeight,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_address': delegatorAddress,
      'validator_address': validatorAddress,
      'amount': amount?.toJson(),
      'creation_height': creationHeight?.toString(),
    };
  }

  factory MsgCancelUnbondingDelegation.fromJson(Map<String, dynamic> json) {
    return MsgCancelUnbondingDelegation(
      delegatorAddress: json.valueAsString<String?>(
        'delegator_address',
        acceptCamelCase: true,
      ),
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      creationHeight: json.valueAsBigInt<BigInt?>(
        'creation_height',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCancelUnbondingDelegation.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCancelUnbondingDelegation(
      delegatorAddress: decode.getString<String?>(1),
      validatorAddress: decode.getString<String?>(2),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      creationHeight: decode.getBigInt<BigInt?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosStakingV1beta1MsgCancelUnbondingDelegation;
  @override
  MsgCancelUnbondingDelegationResponse onServiceResponse(List<int> bytes) {
    return MsgCancelUnbondingDelegationResponse.deserialize(bytes);
  }

  @override
  MsgCancelUnbondingDelegationResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCancelUnbondingDelegationResponse.fromJson(json);
  }
}

/// MsgCancelUnbondingDelegationResponse
class MsgCancelUnbondingDelegationResponse extends CosmosProtoMessage {
  const MsgCancelUnbondingDelegationResponse();

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

  factory MsgCancelUnbondingDelegationResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgCancelUnbondingDelegationResponse();
  }

  factory MsgCancelUnbondingDelegationResponse.deserialize(List<int> bytes) {
    return MsgCancelUnbondingDelegationResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosStakingV1beta1MsgCancelUnbondingDelegationResponse;
}

/// MsgUpdateParams is the Msg/UpdateParams request type.
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final String? authority;

  /// params defines the x/staking parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final cosmos_staking_v1beta1_staking.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/x/staking/MsgUpdateParams",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, params];

  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'params': params?.toJson()};
  }

  factory MsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParams(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      params: json.valueTo<
        cosmos_staking_v1beta1_staking.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => cosmos_staking_v1beta1_staking.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<cosmos_staking_v1beta1_staking.Params?>(
        2,
        (b) => cosmos_staking_v1beta1_staking.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosStakingV1beta1MsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

/// MsgUpdateParamsResponse defines the response structure for executing a
/// MsgUpdateParams message.
class MsgUpdateParamsResponse extends CosmosProtoMessage {
  const MsgUpdateParamsResponse();

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

  factory MsgUpdateParamsResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse();
  }

  factory MsgUpdateParamsResponse.deserialize(List<int> bytes) {
    return MsgUpdateParamsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosStakingV1beta1MsgUpdateParamsResponse;
}
