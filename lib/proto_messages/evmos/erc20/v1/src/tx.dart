import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/evmos/erc20/v1/src/genesis.dart"
    as evmos_erc20_v1_genesis;

/// MsgConvertERC20 defines a Msg to convert a ERC20 token to a native Cosmos
/// coin.
class MsgConvertERC20 extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgConvertERC20Response>,
        ICosmosProtoAminoMessage {
  /// contract_address of an ERC20 token contract, that is registered in a token pair
  final String? contractAddress;

  /// amount of ERC20 tokens to convert
  final String? amount;

  /// receiver is the bech32 address to receive native Cosmos coins
  final String? receiver;

  /// sender is the hex address from the owner of the given ERC20 tokens
  final String? sender;

  const MsgConvertERC20({
    this.contractAddress,
    this.amount,
    this.receiver,
    this.sender,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "evmos/MsgConvertERC20"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/evmos/erc20/v1/tx/convert_erc20",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [contractAddress, amount, receiver, sender];

  @override
  Map<String, dynamic> toJson() {
    return {
      'contract_address': contractAddress,
      'amount': amount,
      'receiver': receiver,
      'sender': sender,
    };
  }

  factory MsgConvertERC20.fromJson(Map<String, dynamic> json) {
    return MsgConvertERC20(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        acceptCamelCase: true,
      ),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
      receiver: json.valueAsString<String?>('receiver', acceptCamelCase: true),
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
    );
  }

  factory MsgConvertERC20.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgConvertERC20(
      contractAddress: decode.getString<String?>(1),
      amount: decode.getString<String?>(2),
      receiver: decode.getString<String?>(3),
      sender: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosErc20V1MsgConvertERC20;
  @override
  MsgConvertERC20Response onServiceResponse(List<int> bytes) {
    return MsgConvertERC20Response.deserialize(bytes);
  }

  @override
  MsgConvertERC20Response onServiceResponseJson(Map<String, dynamic> json) {
    return MsgConvertERC20Response.fromJson(json);
  }
}

/// MsgConvertERC20Response returns no fields
class MsgConvertERC20Response extends CosmosProtoMessage {
  const MsgConvertERC20Response();

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

  factory MsgConvertERC20Response.fromJson(Map<String, dynamic> json) {
    return MsgConvertERC20Response();
  }

  factory MsgConvertERC20Response.deserialize(List<int> bytes) {
    return MsgConvertERC20Response();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosErc20V1MsgConvertERC20Response;
}

/// MsgUpdateParams is the Msg/UpdateParams request type for Erc20 parameters.
/// Since: cosmos-sdk 0.47
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address of the governance account.
  final String? authority;

  /// params defines the x/evm parameters to update.
  /// NOTE: All parameters must be supplied.
  final evmos_erc20_v1_genesis.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "evmos/x/erc20/MsgUpdateParams",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
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
      params: json
          .valueTo<evmos_erc20_v1_genesis.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => evmos_erc20_v1_genesis.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<evmos_erc20_v1_genesis.Params?>(
        2,
        (b) => evmos_erc20_v1_genesis.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosErc20V1MsgUpdateParams;
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
/// Since: cosmos-sdk 0.47
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
      DefaultCosmosProtoTypeUrl.evmosErc20V1MsgUpdateParamsResponse;
}

/// MsgRegisterERC20 is the Msg/RegisterERC20 request type for registering
/// an Erc20 contract token pair.
class MsgRegisterERC20 extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRegisterERC20Response>,
        ICosmosProtoAminoMessage {
  /// authority is the address of the governance account.
  final String? authority;

  /// erc20addresses is a slice of ERC20 token contract hex addresses
  final List<String> erc20addresses;

  const MsgRegisterERC20({this.authority, this.erc20addresses = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "evmos/x/erc20/MsgRegisterERC20",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, erc20addresses];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'erc20addresses': erc20addresses.map((e) => e).toList(),
    };
  }

  factory MsgRegisterERC20.fromJson(Map<String, dynamic> json) {
    return MsgRegisterERC20(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      erc20addresses:
          (json.valueEnsureAsList<dynamic>(
            'erc20addresses',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgRegisterERC20.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRegisterERC20(
      authority: decode.getString<String?>(1),
      erc20addresses: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosErc20V1MsgRegisterERC20;
  @override
  MsgRegisterERC20Response onServiceResponse(List<int> bytes) {
    return MsgRegisterERC20Response.deserialize(bytes);
  }

  @override
  MsgRegisterERC20Response onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRegisterERC20Response.fromJson(json);
  }
}

/// MsgRegisterERC20Response defines the response structure for executing a
/// MsgRegisterERC20 message.
class MsgRegisterERC20Response extends CosmosProtoMessage {
  const MsgRegisterERC20Response();

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

  factory MsgRegisterERC20Response.fromJson(Map<String, dynamic> json) {
    return MsgRegisterERC20Response();
  }

  factory MsgRegisterERC20Response.deserialize(List<int> bytes) {
    return MsgRegisterERC20Response();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosErc20V1MsgRegisterERC20Response;
}

/// MsgToggleConversion is the Msg/MsgToggleConversion request type for toggling
/// an Erc20 contract conversion capability.
class MsgToggleConversion extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgToggleConversionResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address of the governance account.
  final String? authority;

  /// token identifier can be either the hex contract address of the ERC20 or the
  /// Cosmos base denomination
  final String? token;

  const MsgToggleConversion({this.authority, this.token});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "evmos/x/erc20/MsgToggleConversion",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, token];

  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'token': token};
  }

  factory MsgToggleConversion.fromJson(Map<String, dynamic> json) {
    return MsgToggleConversion(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      token: json.valueAsString<String?>('token', acceptCamelCase: true),
    );
  }

  factory MsgToggleConversion.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgToggleConversion(
      authority: decode.getString<String?>(1),
      token: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosErc20V1MsgToggleConversion;
  @override
  MsgToggleConversionResponse onServiceResponse(List<int> bytes) {
    return MsgToggleConversionResponse.deserialize(bytes);
  }

  @override
  MsgToggleConversionResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgToggleConversionResponse.fromJson(json);
  }
}

/// MsgToggleConversionResponse defines the response structure for executing a
/// ToggleConversion message.
class MsgToggleConversionResponse extends CosmosProtoMessage {
  const MsgToggleConversionResponse();

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

  factory MsgToggleConversionResponse.fromJson(Map<String, dynamic> json) {
    return MsgToggleConversionResponse();
  }

  factory MsgToggleConversionResponse.deserialize(List<int> bytes) {
    return MsgToggleConversionResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosErc20V1MsgToggleConversionResponse;
}
