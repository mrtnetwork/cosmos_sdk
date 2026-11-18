import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/bank/v1beta1/src/bank.dart"
    as cosmos_bank_v1beta1_bank;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// MsgCreateDenom is the sdk.Msg type for allowing an account to create
/// a new denom.  It requires a sender address and a unique ID
/// (to allow accounts to create multiple denoms)
class MsgCreateDenom extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgCreateDenomResponse> {
  final String? sender;

  final String? id;

  final cosmos_bank_v1beta1_bank.Metadata? metadata;

  const MsgCreateDenom({this.sender, this.id, this.metadata});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, id, metadata];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'sender': sender,
      'id': id,
      'metadata': config.encodeMessage(metadata),
    };
  }

  factory MsgCreateDenom.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgCreateDenom(
      sender: json.valueAsString<String?>(
        'sender',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      id: json.valueAsString<String?>(
        'id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      metadata: json.valueTo<cosmos_bank_v1beta1_bank.Metadata?, Object>(
        key: 'metadata',
        parse:
            (v) => cosmos_bank_v1beta1_bank.Metadata.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgCreateDenom.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateDenom(
      sender: decode.getString<String?>(1),
      id: decode.getString<String?>(2),
      metadata: decode.messageTo<cosmos_bank_v1beta1_bank.Metadata?>(
        3,
        (b) => cosmos_bank_v1beta1_bank.Metadata.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.thorchainDenomV1MsgCreateDenom;
  @override
  MsgCreateDenomResponse onServiceResponse(List<int> bytes) {
    return MsgCreateDenomResponse.deserialize(bytes);
  }

  @override
  MsgCreateDenomResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgCreateDenomResponse.fromJson(json);
  }
}

/// MsgCreateDenomResponse is the return value of MsgCreateDenom
/// It returns the full string of the newly created denom
class MsgCreateDenomResponse extends CosmosProtoMessage {
  final String? newTokenDenom;

  const MsgCreateDenomResponse({this.newTokenDenom});

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
  List<Object?> get protoValues => [newTokenDenom];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'new_token_denom': newTokenDenom};
  }

  factory MsgCreateDenomResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgCreateDenomResponse(
      newTokenDenom: json.valueAsString<String?>(
        'new_token_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgCreateDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateDenomResponse(newTokenDenom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.thorchainDenomV1MsgCreateDenomResponse;
}

/// MsgMint is the sdk.Msg type for allowing an admin account to mint
/// more of a token.
class MsgMintTokens extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgMintTokensResponse> {
  final String? sender;

  final cosmos_base_v1beta1_coin.Coin? amount;

  final String? recipient;

  const MsgMintTokens({this.sender, this.amount, this.recipient});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, amount, recipient];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'sender': sender,
      'amount': config.encodeMessage(amount),
      'recipient': recipient,
    };
  }

  factory MsgMintTokens.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgMintTokens(
      sender: json.valueAsString<String?>(
        'sender',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      amount: json.valueTo<cosmos_base_v1beta1_coin.Coin?, Object>(
        key: 'amount',
        parse:
            (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      recipient: json.valueAsString<String?>(
        'recipient',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgMintTokens.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgMintTokens(
      sender: decode.getString<String?>(1),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        2,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      recipient: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.thorchainDenomV1MsgMintTokens;
  @override
  MsgMintTokensResponse onServiceResponse(List<int> bytes) {
    return MsgMintTokensResponse.deserialize(bytes);
  }

  @override
  MsgMintTokensResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgMintTokensResponse.fromJson(json);
  }
}

class MsgMintTokensResponse extends CosmosProtoMessage {
  const MsgMintTokensResponse();

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

  factory MsgMintTokensResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgMintTokensResponse();
  }

  factory MsgMintTokensResponse.deserialize(List<int> bytes) {
    return MsgMintTokensResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.thorchainDenomV1MsgMintTokensResponse;
}

/// MsgBurn is the sdk.Msg type for allowing an admin account to burn
/// a token.  For now, we only support burning from the sender account.
class MsgBurnTokens extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgBurnTokensResponse> {
  final String? sender;

  final cosmos_base_v1beta1_coin.Coin? amount;

  const MsgBurnTokens({this.sender, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, amount];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'sender': sender, 'amount': config.encodeMessage(amount)};
  }

  factory MsgBurnTokens.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgBurnTokens(
      sender: json.valueAsString<String?>(
        'sender',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      amount: json.valueTo<cosmos_base_v1beta1_coin.Coin?, Object>(
        key: 'amount',
        parse:
            (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgBurnTokens.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBurnTokens(
      sender: decode.getString<String?>(1),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        2,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.thorchainDenomV1MsgBurnTokens;
  @override
  MsgBurnTokensResponse onServiceResponse(List<int> bytes) {
    return MsgBurnTokensResponse.deserialize(bytes);
  }

  @override
  MsgBurnTokensResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgBurnTokensResponse.fromJson(json);
  }
}

class MsgBurnTokensResponse extends CosmosProtoMessage {
  const MsgBurnTokensResponse();

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

  factory MsgBurnTokensResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgBurnTokensResponse();
  }

  factory MsgBurnTokensResponse.deserialize(List<int> bytes) {
    return MsgBurnTokensResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.thorchainDenomV1MsgBurnTokensResponse;
}

/// MsgChangeDenomAdmin is the sdk.Msg type for allowing an admin account to
/// reassign adminship of a denom to a new account
class MsgChangeDenomAdmin extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgChangeDenomAdminResponse> {
  final String? sender;

  final String? denom;

  final String? newAdmin;

  const MsgChangeDenomAdmin({this.sender, this.denom, this.newAdmin});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, denom, newAdmin];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'sender': sender, 'denom': denom, 'newAdmin': newAdmin};
  }

  factory MsgChangeDenomAdmin.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgChangeDenomAdmin(
      sender: json.valueAsString<String?>(
        'sender',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      newAdmin: json.valueAsString<String?>(
        'newAdmin',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgChangeDenomAdmin.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgChangeDenomAdmin(
      sender: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
      newAdmin: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.thorchainDenomV1MsgChangeDenomAdmin;
  @override
  MsgChangeDenomAdminResponse onServiceResponse(List<int> bytes) {
    return MsgChangeDenomAdminResponse.deserialize(bytes);
  }

  @override
  MsgChangeDenomAdminResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgChangeDenomAdminResponse.fromJson(json);
  }
}

class MsgChangeDenomAdminResponse extends CosmosProtoMessage {
  const MsgChangeDenomAdminResponse();

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

  factory MsgChangeDenomAdminResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgChangeDenomAdminResponse();
  }

  factory MsgChangeDenomAdminResponse.deserialize(List<int> bytes) {
    return MsgChangeDenomAdminResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.thorchainDenomV1MsgChangeDenomAdminResponse;
}
