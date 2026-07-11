import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/cosmos/bank/v1beta1/src/bank.dart"
    as cosmos_bank_v1beta1_bank;
import "package:cosmos_sdk/proto_messages/injective/tokenfactory/v1beta1/src/params.dart"
    as injective_tokenfactory_v1beta1_params;

/// MsgCreateDenom defines the message structure for the CreateDenom gRPC service
/// method. It allows an account to create a new denom. It requires a sender
/// address and a sub denomination. The (sender_address, sub_denomination) tuple
/// must be unique and cannot be re-used.
class MsgCreateDenom extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateDenomResponse>,
        ICosmosProtoAminoMessage {
  /// The sender's Injective address
  final String? sender;

  /// subdenom can be up to 44 "alphanumeric" characters long.
  final String? subdenom;

  /// The name
  final String? name;

  /// The symbol
  final String? symbol;

  /// The number of decimals
  final int? decimals;

  /// true if admins are allowed to burn tokens from other addresses
  final bool? allowAdminBurn;

  const MsgCreateDenom({
    this.sender,
    this.subdenom,
    this.name,
    this.symbol,
    this.decimals,
    this.allowAdminBurn,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "injective/tokenfactory/create-denom",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.uint32(5, options: const []),
        ProtoFieldConfig.bool(6, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    subdenom,
    name,
    symbol,
    decimals,
    allowAdminBurn,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'subdenom': subdenom,
      'name': name,
      'symbol': symbol,
      'decimals': decimals,
      'allow_admin_burn': allowAdminBurn,
    };
  }

  factory MsgCreateDenom.fromJson(Map<String, dynamic> json) {
    return MsgCreateDenom(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      subdenom: json.valueAsString<String?>('subdenom', acceptCamelCase: true),
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      symbol: json.valueAsString<String?>('symbol', acceptCamelCase: true),
      decimals: json.valueAsInt<int?>('decimals', acceptCamelCase: true),
      allowAdminBurn: json.valueAsBool<bool?>(
        'allow_admin_burn',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateDenom.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateDenom(
      sender: decode.getString<String?>(1),
      subdenom: decode.getString<String?>(2),
      name: decode.getString<String?>(3),
      symbol: decode.getString<String?>(4),
      decimals: decode.getInt<int?>(5),
      allowAdminBurn: decode.getBool<bool?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveTokenfactoryV1beta1MsgCreateDenom;
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
  Map<String, dynamic> toJson() {
    return {'new_token_denom': newTokenDenom};
  }

  factory MsgCreateDenomResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateDenomResponse(
      newTokenDenom: json.valueAsString<String?>(
        'new_token_denom',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateDenomResponse(newTokenDenom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveTokenfactoryV1beta1MsgCreateDenomResponse;
}

/// MsgMint is the sdk.Msg type for allowing an admin account or other permitted
/// accounts to mint more of a token.
class MsgMint extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgMintResponse>, ICosmosProtoAminoMessage {
  /// The sender's Injective address
  final String? sender;

  /// The amount of tokens to mint
  final cosmos_base_v1beta1_coin.Coin? amount;

  /// The Injective address to receive the tokens
  final String? receiver;

  const MsgMint({this.sender, this.amount, this.receiver});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "injective/tokenfactory/mint",
        ),
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
  List<Object?> get protoValues => [sender, amount, receiver];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'amount': amount?.toJson(), 'receiver': receiver};
  }

  factory MsgMint.fromJson(Map<String, dynamic> json) {
    return MsgMint(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      receiver: json.valueAsString<String?>('receiver', acceptCamelCase: true),
    );
  }

  factory MsgMint.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgMint(
      sender: decode.getString<String?>(1),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        2,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      receiver: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveTokenfactoryV1beta1MsgMint;
  @override
  MsgMintResponse onServiceResponse(List<int> bytes) {
    return MsgMintResponse.deserialize(bytes);
  }

  @override
  MsgMintResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgMintResponse.fromJson(json);
  }
}

class MsgMintResponse extends CosmosProtoMessage {
  const MsgMintResponse();

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

  factory MsgMintResponse.fromJson(Map<String, dynamic> json) {
    return MsgMintResponse();
  }

  factory MsgMintResponse.deserialize(List<int> bytes) {
    return MsgMintResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveTokenfactoryV1beta1MsgMintResponse;
}

/// MsgBurn is the sdk.Msg type for allowing an admin account to burn
/// a token.
class MsgBurn extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgBurnResponse>, ICosmosProtoAminoMessage {
  /// The sender's Injective address
  final String? sender;

  /// The amount of tokens to burn
  final cosmos_base_v1beta1_coin.Coin? amount;

  /// The Injective address to burn the tokens from
  final String? burnFromAddress;

  const MsgBurn({this.sender, this.amount, this.burnFromAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "injective/tokenfactory/burn",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.string(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, amount, burnFromAddress];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'amount': amount?.toJson(),
      'burnFromAddress': burnFromAddress,
    };
  }

  factory MsgBurn.fromJson(Map<String, dynamic> json) {
    return MsgBurn(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      burnFromAddress: json.valueAsString<String?>(
        'burnFromAddress',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgBurn.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBurn(
      sender: decode.getString<String?>(1),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        2,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      burnFromAddress: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveTokenfactoryV1beta1MsgBurn;
  @override
  MsgBurnResponse onServiceResponse(List<int> bytes) {
    return MsgBurnResponse.deserialize(bytes);
  }

  @override
  MsgBurnResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgBurnResponse.fromJson(json);
  }
}

class MsgBurnResponse extends CosmosProtoMessage {
  const MsgBurnResponse();

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

  factory MsgBurnResponse.fromJson(Map<String, dynamic> json) {
    return MsgBurnResponse();
  }

  factory MsgBurnResponse.deserialize(List<int> bytes) {
    return MsgBurnResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveTokenfactoryV1beta1MsgBurnResponse;
}

/// MsgChangeAdmin is the sdk.Msg type for allowing an admin account to reassign
/// adminship of a denom to a new account
class MsgChangeAdmin extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgChangeAdminResponse>,
        ICosmosProtoAminoMessage {
  /// The sender's Injective address
  final String? sender;

  /// The denom
  final String? denom;

  /// The new admin's Injective address
  final String? newAdmin;

  const MsgChangeAdmin({this.sender, this.denom, this.newAdmin});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "injective/tokenfactory/change-admin",
        ),
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
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'denom': denom, 'new_admin': newAdmin};
  }

  factory MsgChangeAdmin.fromJson(Map<String, dynamic> json) {
    return MsgChangeAdmin(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      newAdmin: json.valueAsString<String?>('new_admin', acceptCamelCase: true),
    );
  }

  factory MsgChangeAdmin.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgChangeAdmin(
      sender: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
      newAdmin: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveTokenfactoryV1beta1MsgChangeAdmin;
  @override
  MsgChangeAdminResponse onServiceResponse(List<int> bytes) {
    return MsgChangeAdminResponse.deserialize(bytes);
  }

  @override
  MsgChangeAdminResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgChangeAdminResponse.fromJson(json);
  }
}

/// MsgChangeAdminResponse defines the response structure for an executed
/// MsgChangeAdmin message.
class MsgChangeAdminResponse extends CosmosProtoMessage {
  const MsgChangeAdminResponse();

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

  factory MsgChangeAdminResponse.fromJson(Map<String, dynamic> json) {
    return MsgChangeAdminResponse();
  }

  factory MsgChangeAdminResponse.deserialize(List<int> bytes) {
    return MsgChangeAdminResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveTokenfactoryV1beta1MsgChangeAdminResponse;
}

/// MsgSetDenomMetadata is the sdk.Msg type for allowing an admin account to set
/// the denom's bank metadata
class MsgSetDenomMetadata extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetDenomMetadataResponse>,
        ICosmosProtoAminoMessage {
  /// The sender's Injective address
  final String? sender;

  /// The metadata
  final cosmos_bank_v1beta1_bank.Metadata? metadata;

  final MsgSetDenomMetadataAdminBurnDisabled? adminBurnDisabled;

  const MsgSetDenomMetadata({
    this.sender,
    this.metadata,
    this.adminBurnDisabled,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "injective/tokenfactory/set-denom-metadata",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, metadata, adminBurnDisabled];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'metadata': metadata?.toJson(),
      'admin_burn_disabled': adminBurnDisabled?.toJson(),
    };
  }

  factory MsgSetDenomMetadata.fromJson(Map<String, dynamic> json) {
    return MsgSetDenomMetadata(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      metadata: json
          .valueTo<cosmos_bank_v1beta1_bank.Metadata?, Map<String, dynamic>>(
            key: 'metadata',
            parse: (v) => cosmos_bank_v1beta1_bank.Metadata.fromJson(v),
            acceptCamelCase: true,
          ),
      adminBurnDisabled: json
          .valueTo<MsgSetDenomMetadataAdminBurnDisabled?, Map<String, dynamic>>(
            key: 'admin_burn_disabled',
            parse: (v) => MsgSetDenomMetadataAdminBurnDisabled.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgSetDenomMetadata.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetDenomMetadata(
      sender: decode.getString<String?>(1),
      metadata: decode.messageTo<cosmos_bank_v1beta1_bank.Metadata?>(
        2,
        (b) => cosmos_bank_v1beta1_bank.Metadata.deserialize(b),
      ),
      adminBurnDisabled: decode
          .messageTo<MsgSetDenomMetadataAdminBurnDisabled?>(
            3,
            (b) => MsgSetDenomMetadataAdminBurnDisabled.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveTokenfactoryV1beta1MsgSetDenomMetadata;
  @override
  MsgSetDenomMetadataResponse onServiceResponse(List<int> bytes) {
    return MsgSetDenomMetadataResponse.deserialize(bytes);
  }

  @override
  MsgSetDenomMetadataResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgSetDenomMetadataResponse.fromJson(json);
  }
}

class MsgSetDenomMetadataAdminBurnDisabled extends CosmosProtoMessage {
  /// true if the admin burn capability should be disabled
  final bool? shouldDisable;

  const MsgSetDenomMetadataAdminBurnDisabled({this.shouldDisable});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bool(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [shouldDisable];

  @override
  Map<String, dynamic> toJson() {
    return {'should_disable': shouldDisable};
  }

  factory MsgSetDenomMetadataAdminBurnDisabled.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetDenomMetadataAdminBurnDisabled(
      shouldDisable: json.valueAsBool<bool?>(
        'should_disable',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgSetDenomMetadataAdminBurnDisabled.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetDenomMetadataAdminBurnDisabled(
      shouldDisable: decode.getBool<bool?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveTokenfactoryV1beta1MsgSetDenomMetadataAdminBurnDisabled;
}

/// MsgSetDenomMetadataResponse defines the response structure for an executed
/// MsgSetDenomMetadata message.
class MsgSetDenomMetadataResponse extends CosmosProtoMessage {
  const MsgSetDenomMetadataResponse();

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

  factory MsgSetDenomMetadataResponse.fromJson(Map<String, dynamic> json) {
    return MsgSetDenomMetadataResponse();
  }

  factory MsgSetDenomMetadataResponse.deserialize(List<int> bytes) {
    return MsgSetDenomMetadataResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveTokenfactoryV1beta1MsgSetDenomMetadataResponse;
}

class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address of the governance account.
  final String? authority;

  /// params defines the tokenfactory parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final injective_tokenfactory_v1beta1_params.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "injective/tokenfactory/update-params",
        ),
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
        injective_tokenfactory_v1beta1_params.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => injective_tokenfactory_v1beta1_params.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<injective_tokenfactory_v1beta1_params.Params?>(
        2,
        (b) => injective_tokenfactory_v1beta1_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveTokenfactoryV1beta1MsgUpdateParams;
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
      DefaultCosmosProtoTypeUrl
          .injectiveTokenfactoryV1beta1MsgUpdateParamsResponse;
}
