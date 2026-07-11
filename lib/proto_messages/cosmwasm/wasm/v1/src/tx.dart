import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmwasm/wasm/v1/src/types.dart"
    as cosmwasm_wasm_v1_types;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// MsgStoreCode submit Wasm code to the system
class MsgStoreCode extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgStoreCodeResponse>,
        ICosmosProtoAminoMessage {
  /// Sender is the actor that signed the messages
  final String? sender;

  /// WASMByteCode can be raw or gzip compressed
  final List<int>? wasmByteCode;

  /// Used in v1beta1
  /// InstantiatePermission access control to apply on contract creation,
  /// optional
  final cosmwasm_wasm_v1_types.AccessConfig? instantiatePermission;

  const MsgStoreCode({
    this.sender,
    this.wasmByteCode,
    this.instantiatePermission,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "wasm/MsgStoreCode"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.bytes(2, options: const []),
        ProtoFieldConfig.message(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    wasmByteCode,
    instantiatePermission,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'wasm_byte_code': switch (wasmByteCode) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'instantiate_permission': instantiatePermission?.toJson(),
    };
  }

  factory MsgStoreCode.fromJson(Map<String, dynamic> json) {
    return MsgStoreCode(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      wasmByteCode: json.valueAsBytes<List<int>?>(
        'wasm_byte_code',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      instantiatePermission: json
          .valueTo<cosmwasm_wasm_v1_types.AccessConfig?, Map<String, dynamic>>(
            key: 'instantiate_permission',
            parse: (v) => cosmwasm_wasm_v1_types.AccessConfig.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgStoreCode.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgStoreCode(
      sender: decode.getString<String?>(1),
      wasmByteCode: decode.getBytes<List<int>?>(2),
      instantiatePermission: decode
          .messageTo<cosmwasm_wasm_v1_types.AccessConfig?>(
            5,
            (b) => cosmwasm_wasm_v1_types.AccessConfig.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgStoreCode;
  @override
  MsgStoreCodeResponse onServiceResponse(List<int> bytes) {
    return MsgStoreCodeResponse.deserialize(bytes);
  }

  @override
  MsgStoreCodeResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgStoreCodeResponse.fromJson(json);
  }
}

/// MsgStoreCodeResponse returns store result data.
class MsgStoreCodeResponse extends CosmosProtoMessage {
  /// CodeID is the reference to the stored WASM code
  final BigInt? codeId;

  /// Checksum is the sha256 hash of the stored code
  final List<int>? checksum;

  const MsgStoreCodeResponse({this.codeId, this.checksum});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.bytes(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [codeId, checksum];

  @override
  Map<String, dynamic> toJson() {
    return {
      'code_id': codeId?.toString(),
      'checksum': switch (checksum) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgStoreCodeResponse.fromJson(Map<String, dynamic> json) {
    return MsgStoreCodeResponse(
      codeId: json.valueAsBigInt<BigInt?>('code_id', acceptCamelCase: true),
      checksum: json.valueAsBytes<List<int>?>(
        'checksum',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgStoreCodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgStoreCodeResponse(
      codeId: decode.getBigInt<BigInt?>(1),
      checksum: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgStoreCodeResponse;
}

/// MsgInstantiateContract create a new smart contract instance for the given
/// code id.
class MsgInstantiateContract extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgInstantiateContractResponse>,
        ICosmosProtoAminoMessage {
  /// Sender is the that actor that signed the messages
  final String? sender;

  /// Admin is an optional address that can execute migrations
  final String? admin;

  /// CodeID is the reference to the stored WASM code
  final BigInt? codeId;

  /// Label is optional metadata to be stored with a contract instance.
  final String? label;

  /// Msg json encoded message to be passed to the contract on instantiation
  final List<int>? msg;

  /// Funds coins that are transferred to the contract on instantiation
  final List<cosmos_base_v1beta1_coin.Coin> funds;

  const MsgInstantiateContract({
    this.sender,
    this.admin,
    this.codeId,
    this.label,
    this.msg,
    this.funds = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "wasm/MsgInstantiateContract",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.uint64(3, options: const []),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.bytes(
          5,
          options: [
            ProtoOptionString(name: "amino.encoding", value: "inline_json"),
          ],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, admin, codeId, label, msg, funds];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'admin': admin,
      'code_id': codeId?.toString(),
      'label': label,
      'msg': switch (msg) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'funds': funds.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgInstantiateContract.fromJson(Map<String, dynamic> json) {
    return MsgInstantiateContract(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      codeId: json.valueAsBigInt<BigInt?>('code_id', acceptCamelCase: true),
      label: json.valueAsString<String?>('label', acceptCamelCase: true),
      msg: json.valueAsBytes<List<int>?>(
        'msg',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      funds:
          (json.valueEnsureAsList<dynamic>('funds', acceptCamelCase: true))
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

  factory MsgInstantiateContract.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgInstantiateContract(
      sender: decode.getString<String?>(1),
      admin: decode.getString<String?>(2),
      codeId: decode.getBigInt<BigInt?>(3),
      label: decode.getString<String?>(4),
      msg: decode.getBytes<List<int>?>(5),
      funds:
          decode
              .getListOfBytes(6)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgInstantiateContract;
  @override
  MsgInstantiateContractResponse onServiceResponse(List<int> bytes) {
    return MsgInstantiateContractResponse.deserialize(bytes);
  }

  @override
  MsgInstantiateContractResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgInstantiateContractResponse.fromJson(json);
  }
}

/// MsgInstantiateContractResponse return instantiation result data
class MsgInstantiateContractResponse extends CosmosProtoMessage {
  /// Address is the bech32 address of the new contract instance.
  final String? address;

  /// Data contains bytes to returned from the contract
  final List<int>? data;

  const MsgInstantiateContractResponse({this.address, this.data});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.bytes(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, data];

  @override
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'data': switch (data) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgInstantiateContractResponse.fromJson(Map<String, dynamic> json) {
    return MsgInstantiateContractResponse(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgInstantiateContractResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgInstantiateContractResponse(
      address: decode.getString<String?>(1),
      data: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgInstantiateContractResponse;
}

/// MsgInstantiateContract2 create a new smart contract instance for the given
/// code id with a predictable address.
class MsgInstantiateContract2 extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgInstantiateContract2Response>,
        ICosmosProtoAminoMessage {
  /// Sender is the that actor that signed the messages
  final String? sender;

  /// Admin is an optional address that can execute migrations
  final String? admin;

  /// CodeID is the reference to the stored WASM code
  final BigInt? codeId;

  /// Label is optional metadata to be stored with a contract instance.
  final String? label;

  /// Msg json encoded message to be passed to the contract on instantiation
  final List<int>? msg;

  /// Funds coins that are transferred to the contract on instantiation
  final List<cosmos_base_v1beta1_coin.Coin> funds;

  /// Salt is an arbitrary value provided by the sender. Size can be 1 to 64.
  final List<int>? salt;

  /// FixMsg include the msg value into the hash for the predictable address.
  /// Default is false
  final bool? fixMsg;

  const MsgInstantiateContract2({
    this.sender,
    this.admin,
    this.codeId,
    this.label,
    this.msg,
    this.funds = const [],
    this.salt,
    this.fixMsg,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "wasm/MsgInstantiateContract2",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.uint64(3, options: const []),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.bytes(
          5,
          options: [
            ProtoOptionString(name: "amino.encoding", value: "inline_json"),
          ],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
        ProtoFieldConfig.bytes(7),
        ProtoFieldConfig.bool(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    admin,
    codeId,
    label,
    msg,
    funds,
    salt,
    fixMsg,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'admin': admin,
      'code_id': codeId?.toString(),
      'label': label,
      'msg': switch (msg) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'funds': funds.map((e) => e.toJson()).toList(),
      'salt': switch (salt) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'fix_msg': fixMsg,
    };
  }

  factory MsgInstantiateContract2.fromJson(Map<String, dynamic> json) {
    return MsgInstantiateContract2(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      codeId: json.valueAsBigInt<BigInt?>('code_id', acceptCamelCase: true),
      label: json.valueAsString<String?>('label', acceptCamelCase: true),
      msg: json.valueAsBytes<List<int>?>(
        'msg',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      funds:
          (json.valueEnsureAsList<dynamic>('funds', acceptCamelCase: true))
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
      salt: json.valueAsBytes<List<int>?>(
        'salt',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      fixMsg: json.valueAsBool<bool?>('fix_msg', acceptCamelCase: true),
    );
  }

  factory MsgInstantiateContract2.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgInstantiateContract2(
      sender: decode.getString<String?>(1),
      admin: decode.getString<String?>(2),
      codeId: decode.getBigInt<BigInt?>(3),
      label: decode.getString<String?>(4),
      msg: decode.getBytes<List<int>?>(5),
      funds:
          decode
              .getListOfBytes(6)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      salt: decode.getBytes<List<int>?>(7),
      fixMsg: decode.getBool<bool?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgInstantiateContract2;
  @override
  MsgInstantiateContract2Response onServiceResponse(List<int> bytes) {
    return MsgInstantiateContract2Response.deserialize(bytes);
  }

  @override
  MsgInstantiateContract2Response onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgInstantiateContract2Response.fromJson(json);
  }
}

/// MsgInstantiateContract2Response return instantiation result data
class MsgInstantiateContract2Response extends CosmosProtoMessage {
  /// Address is the bech32 address of the new contract instance.
  final String? address;

  /// Data contains bytes to returned from the contract
  final List<int>? data;

  const MsgInstantiateContract2Response({this.address, this.data});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.bytes(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, data];

  @override
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'data': switch (data) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgInstantiateContract2Response.fromJson(Map<String, dynamic> json) {
    return MsgInstantiateContract2Response(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgInstantiateContract2Response.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgInstantiateContract2Response(
      address: decode.getString<String?>(1),
      data: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgInstantiateContract2Response;
}

/// MsgExecuteContract submits the given message data to a smart contract
class MsgExecuteContract extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgExecuteContractResponse>,
        ICosmosProtoAminoMessage {
  /// Sender is the that actor that signed the messages
  final String? sender;

  /// Contract is the address of the smart contract
  final String? contract;

  /// Msg json encoded message to be passed to the contract
  final List<int>? msg;

  /// Funds coins that are transferred to the contract on execution
  final List<cosmos_base_v1beta1_coin.Coin> funds;

  const MsgExecuteContract({
    this.sender,
    this.contract,
    this.msg,
    this.funds = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "wasm/MsgExecuteContract"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.bytes(
          3,
          options: [
            ProtoOptionString(name: "amino.encoding", value: "inline_json"),
          ],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, contract, msg, funds];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'contract': contract,
      'msg': switch (msg) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'funds': funds.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgExecuteContract.fromJson(Map<String, dynamic> json) {
    return MsgExecuteContract(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      contract: json.valueAsString<String?>('contract', acceptCamelCase: true),
      msg: json.valueAsBytes<List<int>?>(
        'msg',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      funds:
          (json.valueEnsureAsList<dynamic>('funds', acceptCamelCase: true))
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

  factory MsgExecuteContract.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExecuteContract(
      sender: decode.getString<String?>(1),
      contract: decode.getString<String?>(2),
      msg: decode.getBytes<List<int>?>(3),
      funds:
          decode
              .getListOfBytes(5)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgExecuteContract;
  @override
  MsgExecuteContractResponse onServiceResponse(List<int> bytes) {
    return MsgExecuteContractResponse.deserialize(bytes);
  }

  @override
  MsgExecuteContractResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgExecuteContractResponse.fromJson(json);
  }
}

/// MsgExecuteContractResponse returns execution result data.
class MsgExecuteContractResponse extends CosmosProtoMessage {
  /// Data contains bytes to returned from the contract
  final List<int>? data;

  const MsgExecuteContractResponse({this.data});

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

  factory MsgExecuteContractResponse.fromJson(Map<String, dynamic> json) {
    return MsgExecuteContractResponse(
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgExecuteContractResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExecuteContractResponse(data: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgExecuteContractResponse;
}

/// MsgMigrateContract runs a code upgrade/ downgrade for a smart contract
class MsgMigrateContract extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgMigrateContractResponse>,
        ICosmosProtoAminoMessage {
  /// Sender is the that actor that signed the messages
  final String? sender;

  /// Contract is the address of the smart contract
  final String? contract;

  /// CodeID references the new WASM code
  final BigInt? codeId;

  /// Msg json encoded message to be passed to the contract on migration
  final List<int>? msg;

  const MsgMigrateContract({this.sender, this.contract, this.codeId, this.msg});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "wasm/MsgMigrateContract"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.uint64(3, options: const []),
        ProtoFieldConfig.bytes(
          4,
          options: [
            ProtoOptionString(name: "amino.encoding", value: "inline_json"),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, contract, codeId, msg];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'contract': contract,
      'code_id': codeId?.toString(),
      'msg': switch (msg) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgMigrateContract.fromJson(Map<String, dynamic> json) {
    return MsgMigrateContract(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      contract: json.valueAsString<String?>('contract', acceptCamelCase: true),
      codeId: json.valueAsBigInt<BigInt?>('code_id', acceptCamelCase: true),
      msg: json.valueAsBytes<List<int>?>(
        'msg',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgMigrateContract.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgMigrateContract(
      sender: decode.getString<String?>(1),
      contract: decode.getString<String?>(2),
      codeId: decode.getBigInt<BigInt?>(3),
      msg: decode.getBytes<List<int>?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgMigrateContract;
  @override
  MsgMigrateContractResponse onServiceResponse(List<int> bytes) {
    return MsgMigrateContractResponse.deserialize(bytes);
  }

  @override
  MsgMigrateContractResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgMigrateContractResponse.fromJson(json);
  }
}

/// MsgMigrateContractResponse returns contract migration result data.
class MsgMigrateContractResponse extends CosmosProtoMessage {
  /// Data contains same raw bytes returned as data from the wasm contract.
  /// (May be empty)
  final List<int>? data;

  const MsgMigrateContractResponse({this.data});

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

  factory MsgMigrateContractResponse.fromJson(Map<String, dynamic> json) {
    return MsgMigrateContractResponse(
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgMigrateContractResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgMigrateContractResponse(data: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgMigrateContractResponse;
}

/// MsgUpdateAdmin sets a new admin for a smart contract
class MsgUpdateAdmin extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateAdminResponse>,
        ICosmosProtoAminoMessage {
  /// Sender is the that actor that signed the messages
  final String? sender;

  /// NewAdmin address to be set
  final String? newAdmin;

  /// Contract is the address of the smart contract
  final String? contract;

  const MsgUpdateAdmin({this.sender, this.newAdmin, this.contract});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "wasm/MsgUpdateAdmin"),
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
  List<Object?> get protoValues => [sender, newAdmin, contract];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'new_admin': newAdmin, 'contract': contract};
  }

  factory MsgUpdateAdmin.fromJson(Map<String, dynamic> json) {
    return MsgUpdateAdmin(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      newAdmin: json.valueAsString<String?>('new_admin', acceptCamelCase: true),
      contract: json.valueAsString<String?>('contract', acceptCamelCase: true),
    );
  }

  factory MsgUpdateAdmin.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateAdmin(
      sender: decode.getString<String?>(1),
      newAdmin: decode.getString<String?>(2),
      contract: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgUpdateAdmin;
  @override
  MsgUpdateAdminResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateAdminResponse.deserialize(bytes);
  }

  @override
  MsgUpdateAdminResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateAdminResponse.fromJson(json);
  }
}

/// MsgUpdateAdminResponse returns empty data
class MsgUpdateAdminResponse extends CosmosProtoMessage {
  const MsgUpdateAdminResponse();

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

  factory MsgUpdateAdminResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateAdminResponse();
  }

  factory MsgUpdateAdminResponse.deserialize(List<int> bytes) {
    return MsgUpdateAdminResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgUpdateAdminResponse;
}

/// MsgClearAdmin removes any admin stored for a smart contract
class MsgClearAdmin extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgClearAdminResponse>,
        ICosmosProtoAminoMessage {
  /// Sender is the actor that signed the messages
  final String? sender;

  /// Contract is the address of the smart contract
  final String? contract;

  const MsgClearAdmin({this.sender, this.contract});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "wasm/MsgClearAdmin"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, contract];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'contract': contract};
  }

  factory MsgClearAdmin.fromJson(Map<String, dynamic> json) {
    return MsgClearAdmin(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      contract: json.valueAsString<String?>('contract', acceptCamelCase: true),
    );
  }

  factory MsgClearAdmin.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgClearAdmin(
      sender: decode.getString<String?>(1),
      contract: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgClearAdmin;
  @override
  MsgClearAdminResponse onServiceResponse(List<int> bytes) {
    return MsgClearAdminResponse.deserialize(bytes);
  }

  @override
  MsgClearAdminResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgClearAdminResponse.fromJson(json);
  }
}

/// MsgClearAdminResponse returns empty data
class MsgClearAdminResponse extends CosmosProtoMessage {
  const MsgClearAdminResponse();

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

  factory MsgClearAdminResponse.fromJson(Map<String, dynamic> json) {
    return MsgClearAdminResponse();
  }

  factory MsgClearAdminResponse.deserialize(List<int> bytes) {
    return MsgClearAdminResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgClearAdminResponse;
}

/// MsgUpdateInstantiateConfig updates instantiate config for a smart contract
class MsgUpdateInstantiateConfig extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateInstantiateConfigResponse>,
        ICosmosProtoAminoMessage {
  /// Sender is the that actor that signed the messages
  final String? sender;

  /// CodeID references the stored WASM code
  final BigInt? codeId;

  /// NewInstantiatePermission is the new access control
  final cosmwasm_wasm_v1_types.AccessConfig? newInstantiatePermission;

  const MsgUpdateInstantiateConfig({
    this.sender,
    this.codeId,
    this.newInstantiatePermission,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "wasm/MsgUpdateInstantiateConfig",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.message(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, codeId, newInstantiatePermission];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'code_id': codeId?.toString(),
      'new_instantiate_permission': newInstantiatePermission?.toJson(),
    };
  }

  factory MsgUpdateInstantiateConfig.fromJson(Map<String, dynamic> json) {
    return MsgUpdateInstantiateConfig(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      codeId: json.valueAsBigInt<BigInt?>('code_id', acceptCamelCase: true),
      newInstantiatePermission: json
          .valueTo<cosmwasm_wasm_v1_types.AccessConfig?, Map<String, dynamic>>(
            key: 'new_instantiate_permission',
            parse: (v) => cosmwasm_wasm_v1_types.AccessConfig.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgUpdateInstantiateConfig.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateInstantiateConfig(
      sender: decode.getString<String?>(1),
      codeId: decode.getBigInt<BigInt?>(2),
      newInstantiatePermission: decode
          .messageTo<cosmwasm_wasm_v1_types.AccessConfig?>(
            3,
            (b) => cosmwasm_wasm_v1_types.AccessConfig.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgUpdateInstantiateConfig;
  @override
  MsgUpdateInstantiateConfigResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateInstantiateConfigResponse.deserialize(bytes);
  }

  @override
  MsgUpdateInstantiateConfigResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateInstantiateConfigResponse.fromJson(json);
  }
}

/// MsgUpdateInstantiateConfigResponse returns empty data
class MsgUpdateInstantiateConfigResponse extends CosmosProtoMessage {
  const MsgUpdateInstantiateConfigResponse();

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

  factory MsgUpdateInstantiateConfigResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateInstantiateConfigResponse();
  }

  factory MsgUpdateInstantiateConfigResponse.deserialize(List<int> bytes) {
    return MsgUpdateInstantiateConfigResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmwasmWasmV1MsgUpdateInstantiateConfigResponse;
}

/// MsgUpdateParams is the MsgUpdateParams request type.
///
/// Since: 0.40
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// Authority is the address of the governance account.
  final String? authority;

  /// params defines the x/wasm parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final cosmwasm_wasm_v1_types.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "wasm/MsgUpdateParams"),
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
          .valueTo<cosmwasm_wasm_v1_types.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => cosmwasm_wasm_v1_types.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<cosmwasm_wasm_v1_types.Params?>(
        2,
        (b) => cosmwasm_wasm_v1_types.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgUpdateParams;
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
///
/// Since: 0.40
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
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgUpdateParamsResponse;
}

/// MsgSudoContract is the MsgSudoContract request type.
///
/// Since: 0.40
class MsgSudoContract extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSudoContractResponse>,
        ICosmosProtoAminoMessage {
  /// Authority is the address of the governance account.
  final String? authority;

  /// Contract is the address of the smart contract
  final String? contract;

  /// Msg json encoded message to be passed to the contract as sudo
  final List<int>? msg;

  const MsgSudoContract({this.authority, this.contract, this.msg});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "wasm/MsgSudoContract"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.bytes(
          3,
          options: [
            ProtoOptionString(name: "amino.encoding", value: "inline_json"),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, contract, msg];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'contract': contract,
      'msg': switch (msg) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgSudoContract.fromJson(Map<String, dynamic> json) {
    return MsgSudoContract(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      contract: json.valueAsString<String?>('contract', acceptCamelCase: true),
      msg: json.valueAsBytes<List<int>?>(
        'msg',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgSudoContract.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSudoContract(
      authority: decode.getString<String?>(1),
      contract: decode.getString<String?>(2),
      msg: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgSudoContract;
  @override
  MsgSudoContractResponse onServiceResponse(List<int> bytes) {
    return MsgSudoContractResponse.deserialize(bytes);
  }

  @override
  MsgSudoContractResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgSudoContractResponse.fromJson(json);
  }
}

/// MsgSudoContractResponse defines the response structure for executing a
/// MsgSudoContract message.
///
/// Since: 0.40
class MsgSudoContractResponse extends CosmosProtoMessage {
  /// Data contains bytes to returned from the contract
  final List<int>? data;

  const MsgSudoContractResponse({this.data});

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

  factory MsgSudoContractResponse.fromJson(Map<String, dynamic> json) {
    return MsgSudoContractResponse(
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgSudoContractResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSudoContractResponse(data: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgSudoContractResponse;
}

/// MsgPinCodes is the MsgPinCodes request type.
///
/// Since: 0.40
class MsgPinCodes extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgPinCodesResponse>,
        ICosmosProtoAminoMessage {
  /// Authority is the address of the governance account.
  final String? authority;

  /// CodeIDs references the new WASM codes
  final List<BigInt> codeIds;

  const MsgPinCodes({this.authority, this.codeIds = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "wasm/MsgPinCodes"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.uint64,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, codeIds];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'code_ids': codeIds.map((e) => e.toString()).toList(),
    };
  }

  factory MsgPinCodes.fromJson(Map<String, dynamic> json) {
    return MsgPinCodes(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      codeIds:
          (json.valueEnsureAsList<dynamic>(
            'code_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
    );
  }

  factory MsgPinCodes.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgPinCodes(
      authority: decode.getString<String?>(1),
      codeIds: decode.getListOrEmpty<BigInt>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgPinCodes;
  @override
  MsgPinCodesResponse onServiceResponse(List<int> bytes) {
    return MsgPinCodesResponse.deserialize(bytes);
  }

  @override
  MsgPinCodesResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgPinCodesResponse.fromJson(json);
  }
}

/// MsgPinCodesResponse defines the response structure for executing a
/// MsgPinCodes message.
///
/// Since: 0.40
class MsgPinCodesResponse extends CosmosProtoMessage {
  const MsgPinCodesResponse();

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

  factory MsgPinCodesResponse.fromJson(Map<String, dynamic> json) {
    return MsgPinCodesResponse();
  }

  factory MsgPinCodesResponse.deserialize(List<int> bytes) {
    return MsgPinCodesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgPinCodesResponse;
}

/// MsgUnpinCodes is the MsgUnpinCodes request type.
///
/// Since: 0.40
class MsgUnpinCodes extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUnpinCodesResponse>,
        ICosmosProtoAminoMessage {
  /// Authority is the address of the governance account.
  final String? authority;

  /// CodeIDs references the WASM codes
  final List<BigInt> codeIds;

  const MsgUnpinCodes({this.authority, this.codeIds = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "wasm/MsgUnpinCodes"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.uint64,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, codeIds];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'code_ids': codeIds.map((e) => e.toString()).toList(),
    };
  }

  factory MsgUnpinCodes.fromJson(Map<String, dynamic> json) {
    return MsgUnpinCodes(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      codeIds:
          (json.valueEnsureAsList<dynamic>(
            'code_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
    );
  }

  factory MsgUnpinCodes.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUnpinCodes(
      authority: decode.getString<String?>(1),
      codeIds: decode.getListOrEmpty<BigInt>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgUnpinCodes;
  @override
  MsgUnpinCodesResponse onServiceResponse(List<int> bytes) {
    return MsgUnpinCodesResponse.deserialize(bytes);
  }

  @override
  MsgUnpinCodesResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUnpinCodesResponse.fromJson(json);
  }
}

/// MsgUnpinCodesResponse defines the response structure for executing a
/// MsgUnpinCodes message.
///
/// Since: 0.40
class MsgUnpinCodesResponse extends CosmosProtoMessage {
  const MsgUnpinCodesResponse();

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

  factory MsgUnpinCodesResponse.fromJson(Map<String, dynamic> json) {
    return MsgUnpinCodesResponse();
  }

  factory MsgUnpinCodesResponse.deserialize(List<int> bytes) {
    return MsgUnpinCodesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgUnpinCodesResponse;
}

/// MsgStoreAndInstantiateContract is the MsgStoreAndInstantiateContract
/// request type.
///
/// Since: 0.40
class MsgStoreAndInstantiateContract extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgStoreAndInstantiateContractResponse>,
        ICosmosProtoAminoMessage {
  /// Authority is the address of the governance account.
  final String? authority;

  /// WASMByteCode can be raw or gzip compressed
  final List<int>? wasmByteCode;

  /// InstantiatePermission to apply on contract creation, optional
  final cosmwasm_wasm_v1_types.AccessConfig? instantiatePermission;

  /// UnpinCode code on upload, optional. As default the uploaded contract is
  /// pinned to cache.
  final bool? unpinCode;

  /// Admin is an optional address that can execute migrations
  final String? admin;

  /// Label is optional metadata to be stored with a contract instance.
  final String? label;

  /// Msg json encoded message to be passed to the contract on instantiation
  final List<int>? msg;

  /// Funds coins that are transferred from the authority account to the contract
  /// on instantiation
  final List<cosmos_base_v1beta1_coin.Coin> funds;

  /// Source is the URL where the code is hosted
  final String? source;

  /// Builder is the docker image used to build the code deterministically, used
  /// for smart contract verification
  final String? builder;

  /// CodeHash is the SHA256 sum of the code outputted by builder, used for smart
  /// contract verification
  final List<int>? codeHash;

  const MsgStoreAndInstantiateContract({
    this.authority,
    this.wasmByteCode,
    this.instantiatePermission,
    this.unpinCode,
    this.admin,
    this.label,
    this.msg,
    this.funds = const [],
    this.source,
    this.builder,
    this.codeHash,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "wasm/MsgStoreAndInstantiateContract",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.bytes(3, options: const []),
        ProtoFieldConfig.message(4),
        ProtoFieldConfig.bool(5),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7),
        ProtoFieldConfig.bytes(
          8,
          options: [
            ProtoOptionString(name: "amino.encoding", value: "inline_json"),
          ],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 9,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
        ProtoFieldConfig.string(10),
        ProtoFieldConfig.string(11),
        ProtoFieldConfig.bytes(12),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    authority,
    wasmByteCode,
    instantiatePermission,
    unpinCode,
    admin,
    label,
    msg,
    funds,
    source,
    builder,
    codeHash,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'wasm_byte_code': switch (wasmByteCode) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'instantiate_permission': instantiatePermission?.toJson(),
      'unpin_code': unpinCode,
      'admin': admin,
      'label': label,
      'msg': switch (msg) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'funds': funds.map((e) => e.toJson()).toList(),
      'source': source,
      'builder': builder,
      'code_hash': switch (codeHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgStoreAndInstantiateContract.fromJson(Map<String, dynamic> json) {
    return MsgStoreAndInstantiateContract(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      wasmByteCode: json.valueAsBytes<List<int>?>(
        'wasm_byte_code',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      instantiatePermission: json
          .valueTo<cosmwasm_wasm_v1_types.AccessConfig?, Map<String, dynamic>>(
            key: 'instantiate_permission',
            parse: (v) => cosmwasm_wasm_v1_types.AccessConfig.fromJson(v),
            acceptCamelCase: true,
          ),
      unpinCode: json.valueAsBool<bool?>('unpin_code', acceptCamelCase: true),
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      label: json.valueAsString<String?>('label', acceptCamelCase: true),
      msg: json.valueAsBytes<List<int>?>(
        'msg',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      funds:
          (json.valueEnsureAsList<dynamic>('funds', acceptCamelCase: true))
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
      source: json.valueAsString<String?>('source', acceptCamelCase: true),
      builder: json.valueAsString<String?>('builder', acceptCamelCase: true),
      codeHash: json.valueAsBytes<List<int>?>(
        'code_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgStoreAndInstantiateContract.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgStoreAndInstantiateContract(
      authority: decode.getString<String?>(1),
      wasmByteCode: decode.getBytes<List<int>?>(3),
      instantiatePermission: decode
          .messageTo<cosmwasm_wasm_v1_types.AccessConfig?>(
            4,
            (b) => cosmwasm_wasm_v1_types.AccessConfig.deserialize(b),
          ),
      unpinCode: decode.getBool<bool?>(5),
      admin: decode.getString<String?>(6),
      label: decode.getString<String?>(7),
      msg: decode.getBytes<List<int>?>(8),
      funds:
          decode
              .getListOfBytes(9)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      source: decode.getString<String?>(10),
      builder: decode.getString<String?>(11),
      codeHash: decode.getBytes<List<int>?>(12),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgStoreAndInstantiateContract;
  @override
  MsgStoreAndInstantiateContractResponse onServiceResponse(List<int> bytes) {
    return MsgStoreAndInstantiateContractResponse.deserialize(bytes);
  }

  @override
  MsgStoreAndInstantiateContractResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgStoreAndInstantiateContractResponse.fromJson(json);
  }
}

/// MsgStoreAndInstantiateContractResponse defines the response structure
/// for executing a MsgStoreAndInstantiateContract message.
///
/// Since: 0.40
class MsgStoreAndInstantiateContractResponse extends CosmosProtoMessage {
  /// Address is the bech32 address of the new contract instance.
  final String? address;

  /// Data contains bytes to returned from the contract
  final List<int>? data;

  const MsgStoreAndInstantiateContractResponse({this.address, this.data});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.bytes(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, data];

  @override
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'data': switch (data) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgStoreAndInstantiateContractResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgStoreAndInstantiateContractResponse(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgStoreAndInstantiateContractResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgStoreAndInstantiateContractResponse(
      address: decode.getString<String?>(1),
      data: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmwasmWasmV1MsgStoreAndInstantiateContractResponse;
}

/// MsgAddCodeUploadParamsAddresses is the
/// MsgAddCodeUploadParamsAddresses request type.
class MsgAddCodeUploadParamsAddresses extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgAddCodeUploadParamsAddressesResponse>,
        ICosmosProtoAminoMessage {
  /// Authority is the address of the governance account.
  final String? authority;

  final List<String> addresses;

  const MsgAddCodeUploadParamsAddresses({
    this.authority,
    this.addresses = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "wasm/MsgAddCodeUploadParamsAddresses",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, addresses];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'addresses': addresses.map((e) => e).toList(),
    };
  }

  factory MsgAddCodeUploadParamsAddresses.fromJson(Map<String, dynamic> json) {
    return MsgAddCodeUploadParamsAddresses(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      addresses:
          (json.valueEnsureAsList<dynamic>(
            'addresses',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgAddCodeUploadParamsAddresses.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAddCodeUploadParamsAddresses(
      authority: decode.getString<String?>(1),
      addresses: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgAddCodeUploadParamsAddresses;
  @override
  MsgAddCodeUploadParamsAddressesResponse onServiceResponse(List<int> bytes) {
    return MsgAddCodeUploadParamsAddressesResponse.deserialize(bytes);
  }

  @override
  MsgAddCodeUploadParamsAddressesResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgAddCodeUploadParamsAddressesResponse.fromJson(json);
  }
}

/// MsgAddCodeUploadParamsAddressesResponse defines the response
/// structure for executing a MsgAddCodeUploadParamsAddresses message.
class MsgAddCodeUploadParamsAddressesResponse extends CosmosProtoMessage {
  const MsgAddCodeUploadParamsAddressesResponse();

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

  factory MsgAddCodeUploadParamsAddressesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgAddCodeUploadParamsAddressesResponse();
  }

  factory MsgAddCodeUploadParamsAddressesResponse.deserialize(List<int> bytes) {
    return MsgAddCodeUploadParamsAddressesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmwasmWasmV1MsgAddCodeUploadParamsAddressesResponse;
}

/// MsgRemoveCodeUploadParamsAddresses is the
/// MsgRemoveCodeUploadParamsAddresses request type.
class MsgRemoveCodeUploadParamsAddresses extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRemoveCodeUploadParamsAddressesResponse>,
        ICosmosProtoAminoMessage {
  /// Authority is the address of the governance account.
  final String? authority;

  final List<String> addresses;

  const MsgRemoveCodeUploadParamsAddresses({
    this.authority,
    this.addresses = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "wasm/MsgRemoveCodeUploadParamsAddresses",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, addresses];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'addresses': addresses.map((e) => e).toList(),
    };
  }

  factory MsgRemoveCodeUploadParamsAddresses.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgRemoveCodeUploadParamsAddresses(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      addresses:
          (json.valueEnsureAsList<dynamic>(
            'addresses',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgRemoveCodeUploadParamsAddresses.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRemoveCodeUploadParamsAddresses(
      authority: decode.getString<String?>(1),
      addresses: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmwasmWasmV1MsgRemoveCodeUploadParamsAddresses;
  @override
  MsgRemoveCodeUploadParamsAddressesResponse onServiceResponse(
    List<int> bytes,
  ) {
    return MsgRemoveCodeUploadParamsAddressesResponse.deserialize(bytes);
  }

  @override
  MsgRemoveCodeUploadParamsAddressesResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRemoveCodeUploadParamsAddressesResponse.fromJson(json);
  }
}

/// MsgRemoveCodeUploadParamsAddressesResponse defines the response
/// structure for executing a MsgRemoveCodeUploadParamsAddresses message.
class MsgRemoveCodeUploadParamsAddressesResponse extends CosmosProtoMessage {
  const MsgRemoveCodeUploadParamsAddressesResponse();

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

  factory MsgRemoveCodeUploadParamsAddressesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgRemoveCodeUploadParamsAddressesResponse();
  }

  factory MsgRemoveCodeUploadParamsAddressesResponse.deserialize(
    List<int> bytes,
  ) {
    return MsgRemoveCodeUploadParamsAddressesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmwasmWasmV1MsgRemoveCodeUploadParamsAddressesResponse;
}

/// MsgStoreAndMigrateContract is the MsgStoreAndMigrateContract
/// request type.
///
/// Since: 0.42
class MsgStoreAndMigrateContract extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgStoreAndMigrateContractResponse>,
        ICosmosProtoAminoMessage {
  /// Authority is the address of the governance account.
  final String? authority;

  /// WASMByteCode can be raw or gzip compressed
  final List<int>? wasmByteCode;

  /// InstantiatePermission to apply on contract creation, optional
  final cosmwasm_wasm_v1_types.AccessConfig? instantiatePermission;

  /// Contract is the address of the smart contract
  final String? contract;

  /// Msg json encoded message to be passed to the contract on migration
  final List<int>? msg;

  const MsgStoreAndMigrateContract({
    this.authority,
    this.wasmByteCode,
    this.instantiatePermission,
    this.contract,
    this.msg,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "wasm/MsgStoreAndMigrateContract",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.bytes(2, options: const []),
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.bytes(
          5,
          options: [
            ProtoOptionString(name: "amino.encoding", value: "inline_json"),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    authority,
    wasmByteCode,
    instantiatePermission,
    contract,
    msg,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'wasm_byte_code': switch (wasmByteCode) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'instantiate_permission': instantiatePermission?.toJson(),
      'contract': contract,
      'msg': switch (msg) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgStoreAndMigrateContract.fromJson(Map<String, dynamic> json) {
    return MsgStoreAndMigrateContract(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      wasmByteCode: json.valueAsBytes<List<int>?>(
        'wasm_byte_code',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      instantiatePermission: json
          .valueTo<cosmwasm_wasm_v1_types.AccessConfig?, Map<String, dynamic>>(
            key: 'instantiate_permission',
            parse: (v) => cosmwasm_wasm_v1_types.AccessConfig.fromJson(v),
            acceptCamelCase: true,
          ),
      contract: json.valueAsString<String?>('contract', acceptCamelCase: true),
      msg: json.valueAsBytes<List<int>?>(
        'msg',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgStoreAndMigrateContract.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgStoreAndMigrateContract(
      authority: decode.getString<String?>(1),
      wasmByteCode: decode.getBytes<List<int>?>(2),
      instantiatePermission: decode
          .messageTo<cosmwasm_wasm_v1_types.AccessConfig?>(
            3,
            (b) => cosmwasm_wasm_v1_types.AccessConfig.deserialize(b),
          ),
      contract: decode.getString<String?>(4),
      msg: decode.getBytes<List<int>?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgStoreAndMigrateContract;
  @override
  MsgStoreAndMigrateContractResponse onServiceResponse(List<int> bytes) {
    return MsgStoreAndMigrateContractResponse.deserialize(bytes);
  }

  @override
  MsgStoreAndMigrateContractResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgStoreAndMigrateContractResponse.fromJson(json);
  }
}

/// MsgStoreAndMigrateContractResponse defines the response structure
/// for executing a MsgStoreAndMigrateContract message.
///
/// Since: 0.42
class MsgStoreAndMigrateContractResponse extends CosmosProtoMessage {
  /// CodeID is the reference to the stored WASM code
  final BigInt? codeId;

  /// Checksum is the sha256 hash of the stored code
  final List<int>? checksum;

  /// Data contains bytes to returned from the contract
  final List<int>? data;

  const MsgStoreAndMigrateContractResponse({
    this.codeId,
    this.checksum,
    this.data,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.bytes(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [codeId, checksum, data];

  @override
  Map<String, dynamic> toJson() {
    return {
      'code_id': codeId?.toString(),
      'checksum': switch (checksum) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'data': switch (data) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgStoreAndMigrateContractResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgStoreAndMigrateContractResponse(
      codeId: json.valueAsBigInt<BigInt?>('code_id', acceptCamelCase: true),
      checksum: json.valueAsBytes<List<int>?>(
        'checksum',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgStoreAndMigrateContractResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgStoreAndMigrateContractResponse(
      codeId: decode.getBigInt<BigInt?>(1),
      checksum: decode.getBytes<List<int>?>(2),
      data: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmwasmWasmV1MsgStoreAndMigrateContractResponse;
}

/// MsgUpdateContractLabel sets a new label for a smart contract
class MsgUpdateContractLabel extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateContractLabelResponse>,
        ICosmosProtoAminoMessage {
  /// Sender is the that actor that signed the messages
  final String? sender;

  /// NewLabel string to be set
  final String? newLabel;

  /// Contract is the address of the smart contract
  final String? contract;

  const MsgUpdateContractLabel({this.sender, this.newLabel, this.contract});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "wasm/MsgUpdateContractLabel",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, newLabel, contract];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'new_label': newLabel, 'contract': contract};
  }

  factory MsgUpdateContractLabel.fromJson(Map<String, dynamic> json) {
    return MsgUpdateContractLabel(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      newLabel: json.valueAsString<String?>('new_label', acceptCamelCase: true),
      contract: json.valueAsString<String?>('contract', acceptCamelCase: true),
    );
  }

  factory MsgUpdateContractLabel.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateContractLabel(
      sender: decode.getString<String?>(1),
      newLabel: decode.getString<String?>(2),
      contract: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgUpdateContractLabel;
  @override
  MsgUpdateContractLabelResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateContractLabelResponse.deserialize(bytes);
  }

  @override
  MsgUpdateContractLabelResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateContractLabelResponse.fromJson(json);
  }
}

/// MsgUpdateContractLabelResponse returns empty data
class MsgUpdateContractLabelResponse extends CosmosProtoMessage {
  const MsgUpdateContractLabelResponse();

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

  factory MsgUpdateContractLabelResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateContractLabelResponse();
  }

  factory MsgUpdateContractLabelResponse.deserialize(List<int> bytes) {
    return MsgUpdateContractLabelResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1MsgUpdateContractLabelResponse;
}
