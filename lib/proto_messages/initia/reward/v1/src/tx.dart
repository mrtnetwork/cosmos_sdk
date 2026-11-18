import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/initia/reward/v1/src/types.dart"
    as initia_reward_v1_types;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// MsgUpdateParams is the Msg/UpdateParams request type.
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final String? authority;

  /// params defines the x/reward parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final initia_reward_v1_types.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(name: "amino.name", value: "reward/MsgUpdateParams"),
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
      params: json.valueTo<initia_reward_v1_types.Params?, Object>(
        key: 'params',
        parse:
            (v) => initia_reward_v1_types.Params.fromJson(
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
      params: decode.messageTo<initia_reward_v1_types.Params?>(
        2,
        (b) => initia_reward_v1_types.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaRewardV1MsgUpdateParams;
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
      DefaultCosmosProtoTypeUrl.initiaRewardV1MsgUpdateParamsResponse;
}

/// MsgFundCommunityPool is the Msg/FundCommunityPool request type.
class MsgFundCommunityPool extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgFundCommunityPoolResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final String? authority;

  /// amount is the amount to fund the community pool.
  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const MsgFundCommunityPool({this.authority, this.amount = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "reward/MsgFundCommunityPool",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, amount];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'authority': authority,
      'amount': amount.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory MsgFundCommunityPool.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgFundCommunityPool(
      authority: json.valueAsString<String?>(
        'authority',
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

  factory MsgFundCommunityPool.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgFundCommunityPool(
      authority: decode.getString<String?>(1),
      amount:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaRewardV1MsgFundCommunityPool;
  @override
  MsgFundCommunityPoolResponse onServiceResponse(List<int> bytes) {
    return MsgFundCommunityPoolResponse.deserialize(bytes);
  }

  @override
  MsgFundCommunityPoolResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgFundCommunityPoolResponse.fromJson(json);
  }
}

/// MsgFundCommunityPoolResponse defines the response structure for executing a
/// MsgFundCommunityPool message.
class MsgFundCommunityPoolResponse extends CosmosProtoMessage {
  const MsgFundCommunityPoolResponse();

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

  factory MsgFundCommunityPoolResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgFundCommunityPoolResponse();
  }

  factory MsgFundCommunityPoolResponse.deserialize(List<int> bytes) {
    return MsgFundCommunityPoolResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaRewardV1MsgFundCommunityPoolResponse;
}
