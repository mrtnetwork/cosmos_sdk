import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/initia/distribution/v1/src/distribution.dart"
    as initia_distribution_v1_distribution;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// MsgUpdateParams is the Msg/UpdateParams request type.
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final String? authority;

  /// params defines the x/distribution parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final initia_distribution_v1_distribution.Params? params;

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
          value: "distribution/MsgUpdateParams",
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'authority': authority, 'params': config.encodeMessage(params)};
  }

  factory MsgUpdateParams.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateParams(
      authority: json.valueAsString<String?>(
        'authority',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      params: json.valueTo<initia_distribution_v1_distribution.Params?, Object>(
        key: 'params',
        parse:
            (v) => initia_distribution_v1_distribution.Params.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<initia_distribution_v1_distribution.Params?>(
        2,
        (b) => initia_distribution_v1_distribution.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaDistributionV1MsgUpdateParams;
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory MsgUpdateParamsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateParamsResponse();
  }

  factory MsgUpdateParamsResponse.deserialize(List<int> bytes) {
    return MsgUpdateParamsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaDistributionV1MsgUpdateParamsResponse;
}

/// DepositValidatorRewardsPool defines the request structure to provide
/// additional rewards to delegators from a specific validator.
///
/// Since: cosmos-sdk 0.50
class MsgDepositValidatorRewardsPool extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDepositValidatorRewardsPoolResponse>,
        ICosmosProtoAminoMessage {
  final String? depositor;

  final String? validatorAddress;

  final String? denom;

  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const MsgDepositValidatorRewardsPool({
    this.depositor,
    this.validatorAddress,
    this.denom,
    this.amount = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "distr/MsgDepositValidatorRewardsPool",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "depositor"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [depositor, validatorAddress, denom, amount];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'depositor': depositor,
      'validator_address': validatorAddress,
      'denom': denom,
      'amount': amount.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory MsgDepositValidatorRewardsPool.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgDepositValidatorRewardsPool(
      depositor: json.valueAsString<String?>(
        'depositor',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      amount:
          (json.valueEnsureAsList<dynamic>(
                'amount',
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

  factory MsgDepositValidatorRewardsPool.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDepositValidatorRewardsPool(
      depositor: decode.getString<String?>(1),
      validatorAddress: decode.getString<String?>(2),
      denom: decode.getString<String?>(3),
      amount:
          decode
              .getListOfBytes(4)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .initiaDistributionV1MsgDepositValidatorRewardsPool;
  @override
  MsgDepositValidatorRewardsPoolResponse onServiceResponse(List<int> bytes) {
    return MsgDepositValidatorRewardsPoolResponse.deserialize(bytes);
  }

  @override
  MsgDepositValidatorRewardsPoolResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgDepositValidatorRewardsPoolResponse.fromJson(json);
  }
}

/// MsgDepositValidatorRewardsPoolResponse defines the response to executing a
/// MsgDepositValidatorRewardsPool message.
///
/// Since: cosmos-sdk 0.50
class MsgDepositValidatorRewardsPoolResponse extends CosmosProtoMessage {
  const MsgDepositValidatorRewardsPoolResponse();

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory MsgDepositValidatorRewardsPoolResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgDepositValidatorRewardsPoolResponse();
  }

  factory MsgDepositValidatorRewardsPoolResponse.deserialize(List<int> bytes) {
    return MsgDepositValidatorRewardsPoolResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .initiaDistributionV1MsgDepositValidatorRewardsPoolResponse;
}
