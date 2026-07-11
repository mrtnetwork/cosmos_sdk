import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/wasmx/v1/src/wasmx.dart"
    as injective_wasmx_v1_wasmx;
import "package:cosmos_sdk/proto_messages/injective/wasmx/v1/src/proposal.dart"
    as injective_wasmx_v1_proposal;

/// MsgExecuteContractCompat submits the given message data to a smart contract,
/// compatible with EIP712
class MsgExecuteContractCompat extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgExecuteContractCompatResponse>,
        ICosmosProtoAminoMessage {
  /// Sender is the that actor that signed the messages
  final String? sender;

  /// Contract is the address of the smart contract
  final String? contract;

  /// Msg json encoded message to be passed to the contract
  final String? msg;

  /// Funds coins that are transferred to the contract on execution
  final String? funds;

  const MsgExecuteContractCompat({
    this.sender,
    this.contract,
    this.msg,
    this.funds,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "wasmx/MsgExecuteContractCompat",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, contract, msg, funds];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'contract': contract, 'msg': msg, 'funds': funds};
  }

  factory MsgExecuteContractCompat.fromJson(Map<String, dynamic> json) {
    return MsgExecuteContractCompat(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      contract: json.valueAsString<String?>('contract', acceptCamelCase: true),
      msg: json.valueAsString<String?>('msg', acceptCamelCase: true),
      funds: json.valueAsString<String?>('funds', acceptCamelCase: true),
    );
  }

  factory MsgExecuteContractCompat.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExecuteContractCompat(
      sender: decode.getString<String?>(1),
      contract: decode.getString<String?>(2),
      msg: decode.getString<String?>(3),
      funds: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveWasmxV1MsgExecuteContractCompat;
  @override
  MsgExecuteContractCompatResponse onServiceResponse(List<int> bytes) {
    return MsgExecuteContractCompatResponse.deserialize(bytes);
  }

  @override
  MsgExecuteContractCompatResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgExecuteContractCompatResponse.fromJson(json);
  }
}

/// MsgExecuteContractCompatResponse returns execution result data.
class MsgExecuteContractCompatResponse extends CosmosProtoMessage {
  /// Data contains bytes to returned from the contract
  final List<int>? data;

  const MsgExecuteContractCompatResponse({this.data});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1)],
    );
  }

  @override
  List<Object?> get protoValues => [data];

  @override
  Map<String, dynamic> toJson() {
    return {
      'data': switch (data) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgExecuteContractCompatResponse.fromJson(Map<String, dynamic> json) {
    return MsgExecuteContractCompatResponse(
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgExecuteContractCompatResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExecuteContractCompatResponse(
      data: decode.getBytes<List<int>?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveWasmxV1MsgExecuteContractCompatResponse;
}

class MsgUpdateContract extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateContractResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  /// Unique Identifier for contract instance to be registered.
  final String? contractAddress;

  /// Maximum gas to be used for the smart contract execution.
  final BigInt? gasLimit;

  /// gas price to be used for the smart contract execution.
  final BigInt? gasPrice;

  /// optional - admin account that will be allowed to perform any changes
  final String? adminAddress;

  const MsgUpdateContract({
    this.sender,
    this.contractAddress,
    this.gasLimit,
    this.gasPrice,
    this.adminAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "wasmx/MsgUpdateContract"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    contractAddress,
    gasLimit,
    gasPrice,
    adminAddress,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'contract_address': contractAddress,
      'gas_limit': gasLimit?.toString(),
      'gas_price': gasPrice?.toString(),
      'admin_address': adminAddress,
    };
  }

  factory MsgUpdateContract.fromJson(Map<String, dynamic> json) {
    return MsgUpdateContract(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        acceptCamelCase: true,
      ),
      gasLimit: json.valueAsBigInt<BigInt?>('gas_limit', acceptCamelCase: true),
      gasPrice: json.valueAsBigInt<BigInt?>('gas_price', acceptCamelCase: true),
      adminAddress: json.valueAsString<String?>(
        'admin_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateContract.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateContract(
      sender: decode.getString<String?>(1),
      contractAddress: decode.getString<String?>(2),
      gasLimit: decode.getBigInt<BigInt?>(3),
      gasPrice: decode.getBigInt<BigInt?>(4),
      adminAddress: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveWasmxV1MsgUpdateContract;
  @override
  MsgUpdateContractResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateContractResponse.deserialize(bytes);
  }

  @override
  MsgUpdateContractResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateContractResponse.fromJson(json);
  }
}

class MsgUpdateContractResponse extends CosmosProtoMessage {
  const MsgUpdateContractResponse();

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

  factory MsgUpdateContractResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateContractResponse();
  }

  factory MsgUpdateContractResponse.deserialize(List<int> bytes) {
    return MsgUpdateContractResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveWasmxV1MsgUpdateContractResponse;
}

class MsgActivateContract extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgActivateContractResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  /// Unique Identifier for contract instance to be activated.
  final String? contractAddress;

  const MsgActivateContract({this.sender, this.contractAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "wasmx/MsgActivateContract",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, contractAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'contract_address': contractAddress};
  }

  factory MsgActivateContract.fromJson(Map<String, dynamic> json) {
    return MsgActivateContract(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgActivateContract.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgActivateContract(
      sender: decode.getString<String?>(1),
      contractAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveWasmxV1MsgActivateContract;
  @override
  MsgActivateContractResponse onServiceResponse(List<int> bytes) {
    return MsgActivateContractResponse.deserialize(bytes);
  }

  @override
  MsgActivateContractResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgActivateContractResponse.fromJson(json);
  }
}

class MsgActivateContractResponse extends CosmosProtoMessage {
  const MsgActivateContractResponse();

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

  factory MsgActivateContractResponse.fromJson(Map<String, dynamic> json) {
    return MsgActivateContractResponse();
  }

  factory MsgActivateContractResponse.deserialize(List<int> bytes) {
    return MsgActivateContractResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveWasmxV1MsgActivateContractResponse;
}

class MsgDeactivateContract extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDeactivateContractResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  /// Unique Identifier for contract instance to be deactivated.
  final String? contractAddress;

  const MsgDeactivateContract({this.sender, this.contractAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "wasmx/MsgDeactivateContract",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, contractAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'contract_address': contractAddress};
  }

  factory MsgDeactivateContract.fromJson(Map<String, dynamic> json) {
    return MsgDeactivateContract(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgDeactivateContract.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDeactivateContract(
      sender: decode.getString<String?>(1),
      contractAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveWasmxV1MsgDeactivateContract;
  @override
  MsgDeactivateContractResponse onServiceResponse(List<int> bytes) {
    return MsgDeactivateContractResponse.deserialize(bytes);
  }

  @override
  MsgDeactivateContractResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgDeactivateContractResponse.fromJson(json);
  }
}

class MsgDeactivateContractResponse extends CosmosProtoMessage {
  const MsgDeactivateContractResponse();

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

  factory MsgDeactivateContractResponse.fromJson(Map<String, dynamic> json) {
    return MsgDeactivateContractResponse();
  }

  factory MsgDeactivateContractResponse.deserialize(List<int> bytes) {
    return MsgDeactivateContractResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveWasmxV1MsgDeactivateContractResponse;
}

class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address of the governance account.
  final String? authority;

  /// params defines the wasmx parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final injective_wasmx_v1_wasmx.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "wasmx/MsgUpdateParams"),
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
      params: json
          .valueTo<injective_wasmx_v1_wasmx.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => injective_wasmx_v1_wasmx.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<injective_wasmx_v1_wasmx.Params?>(
        2,
        (b) => injective_wasmx_v1_wasmx.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveWasmxV1MsgUpdateParams;
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
      DefaultCosmosProtoTypeUrl.injectiveWasmxV1MsgUpdateParamsResponse;
}

class MsgRegisterContract extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRegisterContractResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final injective_wasmx_v1_proposal.ContractRegistrationRequest?
  contractRegistrationRequest;

  const MsgRegisterContract({this.sender, this.contractRegistrationRequest});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "wasmx/MsgRegisterContract",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, contractRegistrationRequest];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'contract_registration_request': contractRegistrationRequest?.toJson(),
    };
  }

  factory MsgRegisterContract.fromJson(Map<String, dynamic> json) {
    return MsgRegisterContract(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      contractRegistrationRequest: json.valueTo<
        injective_wasmx_v1_proposal.ContractRegistrationRequest?,
        Map<String, dynamic>
      >(
        key: 'contract_registration_request',
        parse:
            (v) => injective_wasmx_v1_proposal
                .ContractRegistrationRequest.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgRegisterContract.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRegisterContract(
      sender: decode.getString<String?>(1),
      contractRegistrationRequest: decode
          .messageTo<injective_wasmx_v1_proposal.ContractRegistrationRequest?>(
            2,
            (b) => injective_wasmx_v1_proposal
                .ContractRegistrationRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveWasmxV1MsgRegisterContract;
  @override
  MsgRegisterContractResponse onServiceResponse(List<int> bytes) {
    return MsgRegisterContractResponse.deserialize(bytes);
  }

  @override
  MsgRegisterContractResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRegisterContractResponse.fromJson(json);
  }
}

class MsgRegisterContractResponse extends CosmosProtoMessage {
  const MsgRegisterContractResponse();

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

  factory MsgRegisterContractResponse.fromJson(Map<String, dynamic> json) {
    return MsgRegisterContractResponse();
  }

  factory MsgRegisterContractResponse.deserialize(List<int> bytes) {
    return MsgRegisterContractResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveWasmxV1MsgRegisterContractResponse;
}
