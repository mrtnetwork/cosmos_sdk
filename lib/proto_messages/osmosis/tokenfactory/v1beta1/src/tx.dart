import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/cosmos/bank/v1beta1/src/bank.dart"
    as cosmos_bank_v1beta1_bank;

/// MsgCreateDenom defines the message structure for the CreateDenom gRPC service
/// method. It allows an account to create a new denom. It requires a sender
/// address and a sub denomination. The (sender_address, sub_denomination) tuple
/// must be unique and cannot be reused.
///
/// The resulting denom created is defined as
/// &lt;factory/{creatorAddress}/{subdenom}&gt;. The resulting denom's admin is
/// originally set to be the creator, but this can be changed later. The token
/// denom does not indicate the current admin.
class MsgCreateDenom extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateDenomResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  /// subdenom can be up to 44 "alphanumeric" characters long.
  final String? subdenom;

  const MsgCreateDenom({this.sender, this.subdenom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/tokenfactory/create-denom",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, subdenom];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'subdenom': subdenom};
  }

  factory MsgCreateDenom.fromJson(Map<String, dynamic> json) {
    return MsgCreateDenom(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      subdenom: json.valueAsString<String?>('subdenom', acceptCamelCase: true),
    );
  }

  factory MsgCreateDenom.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateDenom(
      sender: decode.getString<String?>(1),
      subdenom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTokenfactoryV1beta1MsgCreateDenom;
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
          .osmosisTokenfactoryV1beta1MsgCreateDenomResponse;
}

/// MsgMint is the sdk.Msg type for allowing an admin account to mint
/// more of a token.
/// Only the admin of the token factory denom has permission to mint unless
/// the denom does not have any admin.
class MsgMint extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgMintResponse>, ICosmosProtoAminoMessage {
  final String? sender;

  final cosmos_base_v1beta1_coin.Coin? amount;

  final String? mintToAddress;

  const MsgMint({this.sender, this.amount, this.mintToAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/tokenfactory/mint",
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
  List<Object?> get protoValues => [sender, amount, mintToAddress];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'amount': amount?.toJson(),
      'mintToAddress': mintToAddress,
    };
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
      mintToAddress: json.valueAsString<String?>(
        'mintToAddress',
        acceptCamelCase: true,
      ),
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
      mintToAddress: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTokenfactoryV1beta1MsgMint;
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
      DefaultCosmosProtoTypeUrl.osmosisTokenfactoryV1beta1MsgMintResponse;
}

/// MsgBurn is the sdk.Msg type for allowing an admin account to burn
/// a token.
/// Only the admin of the token factory denom has permission to burn unless
/// the denom does not have any admin.
class MsgBurn extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgBurnResponse>, ICosmosProtoAminoMessage {
  final String? sender;

  final cosmos_base_v1beta1_coin.Coin? amount;

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
          value: "osmosis/tokenfactory/burn",
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
      DefaultCosmosProtoTypeUrl.osmosisTokenfactoryV1beta1MsgBurn;
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
      DefaultCosmosProtoTypeUrl.osmosisTokenfactoryV1beta1MsgBurnResponse;
}

/// MsgChangeAdmin is the sdk.Msg type for allowing an admin account to reassign
/// adminship of a denom to a new account
class MsgChangeAdmin extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgChangeAdminResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final String? denom;

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
          value: "osmosis/tokenfactory/change-admin",
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
      DefaultCosmosProtoTypeUrl.osmosisTokenfactoryV1beta1MsgChangeAdmin;
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
          .osmosisTokenfactoryV1beta1MsgChangeAdminResponse;
}

/// MsgSetBeforeSendHook is the sdk.Msg type for allowing an admin account to
/// assign a CosmWasm contract to call with a BeforeSend hook
class MsgSetBeforeSendHook extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetBeforeSendHookResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final String? denom;

  final String? cosmwasmAddress;

  const MsgSetBeforeSendHook({this.sender, this.denom, this.cosmwasmAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/tokenfactory/set-bef-send-hook",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, denom, cosmwasmAddress];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'denom': denom,
      'cosmwasm_address': cosmwasmAddress,
    };
  }

  factory MsgSetBeforeSendHook.fromJson(Map<String, dynamic> json) {
    return MsgSetBeforeSendHook(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      cosmwasmAddress: json.valueAsString<String?>(
        'cosmwasm_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgSetBeforeSendHook.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetBeforeSendHook(
      sender: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
      cosmwasmAddress: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTokenfactoryV1beta1MsgSetBeforeSendHook;
  @override
  MsgSetBeforeSendHookResponse onServiceResponse(List<int> bytes) {
    return MsgSetBeforeSendHookResponse.deserialize(bytes);
  }

  @override
  MsgSetBeforeSendHookResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetBeforeSendHookResponse.fromJson(json);
  }
}

/// MsgSetBeforeSendHookResponse defines the response structure for an executed
/// MsgSetBeforeSendHook message.
class MsgSetBeforeSendHookResponse extends CosmosProtoMessage {
  const MsgSetBeforeSendHookResponse();

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

  factory MsgSetBeforeSendHookResponse.fromJson(Map<String, dynamic> json) {
    return MsgSetBeforeSendHookResponse();
  }

  factory MsgSetBeforeSendHookResponse.deserialize(List<int> bytes) {
    return MsgSetBeforeSendHookResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisTokenfactoryV1beta1MsgSetBeforeSendHookResponse;
}

/// MsgSetDenomMetadata is the sdk.Msg type for allowing an admin account to set
/// the denom's bank metadata
class MsgSetDenomMetadata extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetDenomMetadataResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final cosmos_bank_v1beta1_bank.Metadata? metadata;

  const MsgSetDenomMetadata({this.sender, this.metadata});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/tokenfactory/set-denom-metadata",
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
  List<Object?> get protoValues => [sender, metadata];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'metadata': metadata?.toJson()};
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
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTokenfactoryV1beta1MsgSetDenomMetadata;
  @override
  MsgSetDenomMetadataResponse onServiceResponse(List<int> bytes) {
    return MsgSetDenomMetadataResponse.deserialize(bytes);
  }

  @override
  MsgSetDenomMetadataResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgSetDenomMetadataResponse.fromJson(json);
  }
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
          .osmosisTokenfactoryV1beta1MsgSetDenomMetadataResponse;
}

class MsgForceTransfer extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgForceTransferResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final cosmos_base_v1beta1_coin.Coin? amount;

  final String? transferFromAddress;

  final String? transferToAddress;

  const MsgForceTransfer({
    this.sender,
    this.amount,
    this.transferFromAddress,
    this.transferToAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/tokenfactory/force-transfer",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    amount,
    transferFromAddress,
    transferToAddress,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'amount': amount?.toJson(),
      'transferFromAddress': transferFromAddress,
      'transferToAddress': transferToAddress,
    };
  }

  factory MsgForceTransfer.fromJson(Map<String, dynamic> json) {
    return MsgForceTransfer(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      transferFromAddress: json.valueAsString<String?>(
        'transferFromAddress',
        acceptCamelCase: true,
      ),
      transferToAddress: json.valueAsString<String?>(
        'transferToAddress',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgForceTransfer.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgForceTransfer(
      sender: decode.getString<String?>(1),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        2,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      transferFromAddress: decode.getString<String?>(3),
      transferToAddress: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTokenfactoryV1beta1MsgForceTransfer;
  @override
  MsgForceTransferResponse onServiceResponse(List<int> bytes) {
    return MsgForceTransferResponse.deserialize(bytes);
  }

  @override
  MsgForceTransferResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgForceTransferResponse.fromJson(json);
  }
}

class MsgForceTransferResponse extends CosmosProtoMessage {
  const MsgForceTransferResponse();

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

  factory MsgForceTransferResponse.fromJson(Map<String, dynamic> json) {
    return MsgForceTransferResponse();
  }

  factory MsgForceTransferResponse.deserialize(List<int> bytes) {
    return MsgForceTransferResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisTokenfactoryV1beta1MsgForceTransferResponse;
}
