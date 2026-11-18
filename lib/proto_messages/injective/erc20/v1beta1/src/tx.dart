import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/erc20/v1beta1/src/params.dart"
    as injective_erc20_v1beta1_params;
import "package:cosmos_sdk/proto_messages/injective/erc20/v1beta1/src/erc20.dart"
    as injective_erc20_v1beta1_erc20;

class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address of the governance account.
  final String? authority;

  /// params defines the erc20 parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final injective_erc20_v1beta1_params.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "erc20/MsgUpdateParams"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
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
      params: json.valueTo<injective_erc20_v1beta1_params.Params?, Object>(
        key: 'params',
        parse:
            (v) => injective_erc20_v1beta1_params.Params.fromJson(
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
      params: decode.messageTo<injective_erc20_v1beta1_params.Params?>(
        2,
        (b) => injective_erc20_v1beta1_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveErc20V1beta1MsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

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
      DefaultCosmosProtoTypeUrl.injectiveErc20V1beta1MsgUpdateParamsResponse;
}

class MsgCreateTokenPair extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateTokenPairResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final injective_erc20_v1beta1_erc20.TokenPair? tokenPair;

  const MsgCreateTokenPair({this.sender, this.tokenPair});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "erc20/MsgCreateTokenPair",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, tokenPair];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'sender': sender, 'token_pair': config.encodeMessage(tokenPair)};
  }

  factory MsgCreateTokenPair.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgCreateTokenPair(
      sender: json.valueAsString<String?>(
        'sender',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tokenPair: json.valueTo<injective_erc20_v1beta1_erc20.TokenPair?, Object>(
        key: 'token_pair',
        parse:
            (v) => injective_erc20_v1beta1_erc20.TokenPair.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgCreateTokenPair.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateTokenPair(
      sender: decode.getString<String?>(1),
      tokenPair: decode.messageTo<injective_erc20_v1beta1_erc20.TokenPair?>(
        2,
        (b) => injective_erc20_v1beta1_erc20.TokenPair.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveErc20V1beta1MsgCreateTokenPair;
  @override
  MsgCreateTokenPairResponse onServiceResponse(List<int> bytes) {
    return MsgCreateTokenPairResponse.deserialize(bytes);
  }

  @override
  MsgCreateTokenPairResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgCreateTokenPairResponse.fromJson(json);
  }
}

class MsgCreateTokenPairResponse extends CosmosProtoMessage {
  final injective_erc20_v1beta1_erc20.TokenPair? tokenPair;

  const MsgCreateTokenPairResponse({this.tokenPair});

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
  List<Object?> get protoValues => [tokenPair];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'token_pair': config.encodeMessage(tokenPair)};
  }

  factory MsgCreateTokenPairResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgCreateTokenPairResponse(
      tokenPair: json.valueTo<injective_erc20_v1beta1_erc20.TokenPair?, Object>(
        key: 'token_pair',
        parse:
            (v) => injective_erc20_v1beta1_erc20.TokenPair.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgCreateTokenPairResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateTokenPairResponse(
      tokenPair: decode.messageTo<injective_erc20_v1beta1_erc20.TokenPair?>(
        1,
        (b) => injective_erc20_v1beta1_erc20.TokenPair.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveErc20V1beta1MsgCreateTokenPairResponse;
}

class MsgDeleteTokenPair extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDeleteTokenPairResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final String? bankDenom;

  const MsgDeleteTokenPair({this.sender, this.bankDenom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "erc20/MsgDeleteTokenPair",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, bankDenom];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'sender': sender, 'bank_denom': bankDenom};
  }

  factory MsgDeleteTokenPair.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgDeleteTokenPair(
      sender: json.valueAsString<String?>(
        'sender',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      bankDenom: json.valueAsString<String?>(
        'bank_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgDeleteTokenPair.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDeleteTokenPair(
      sender: decode.getString<String?>(1),
      bankDenom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveErc20V1beta1MsgDeleteTokenPair;
  @override
  MsgDeleteTokenPairResponse onServiceResponse(List<int> bytes) {
    return MsgDeleteTokenPairResponse.deserialize(bytes);
  }

  @override
  MsgDeleteTokenPairResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgDeleteTokenPairResponse.fromJson(json);
  }
}

/// bank denom of the pair to be deleted
class MsgDeleteTokenPairResponse extends CosmosProtoMessage {
  const MsgDeleteTokenPairResponse();

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

  factory MsgDeleteTokenPairResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgDeleteTokenPairResponse();
  }

  factory MsgDeleteTokenPairResponse.deserialize(List<int> bytes) {
    return MsgDeleteTokenPairResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveErc20V1beta1MsgDeleteTokenPairResponse;
}
