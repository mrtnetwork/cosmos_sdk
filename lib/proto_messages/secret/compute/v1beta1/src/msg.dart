import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/secret/compute/v1beta1/src/params.dart"
    as secret_compute_v1beta1_params;

class MsgStoreCode extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgStoreCodeResponse>,
        ICosmosProtoAminoMessage {
  /// sender is the canonical address of the sender
  final List<int>? sender;

  /// WASMByteCode can be raw or gzip compressed
  final List<int>? wasmByteCode;

  /// Source is a valid absolute HTTPS URI to the contract's source code,
  /// optional
  final String? source;

  /// Builder is a valid docker image name with tag, optional
  final String? builder;

  const MsgStoreCode({
    this.sender,
    this.wasmByteCode,
    this.source,
    this.builder,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(name: "amino.name", value: "wasm/MsgStoreCode"),
      ],
      fields: [
        ProtoFieldConfig.bytes(1, options: const []),
        ProtoFieldConfig.bytes(2, options: const []),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, wasmByteCode, source, builder];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': switch (sender) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'wasm_byte_code': switch (wasmByteCode) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'source': source,
      'builder': builder,
    };
  }

  factory MsgStoreCode.fromJson(Map<String, dynamic> json) {
    return MsgStoreCode(
      sender: json.valueAsBytes<List<int>?>(
        'sender',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      wasmByteCode: json.valueAsBytes<List<int>?>(
        'wasm_byte_code',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      source: json.valueAsString<String?>('source', acceptCamelCase: true),
      builder: json.valueAsString<String?>('builder', acceptCamelCase: true),
    );
  }

  factory MsgStoreCode.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgStoreCode(
      sender: decode.getBytes<List<int>?>(1),
      wasmByteCode: decode.getBytes<List<int>?>(2),
      source: decode.getString<String?>(3),
      builder: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1MsgStoreCode;
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

  const MsgStoreCodeResponse({this.codeId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [codeId];

  @override
  Map<String, dynamic> toJson() {
    return {'code_id': codeId?.toString()};
  }

  factory MsgStoreCodeResponse.fromJson(Map<String, dynamic> json) {
    return MsgStoreCodeResponse(
      codeId: json.valueAsBigInt<BigInt?>('code_id', acceptCamelCase: true),
    );
  }

  factory MsgStoreCodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgStoreCodeResponse(codeId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1MsgStoreCodeResponse;
}

class MsgInstantiateContract extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgInstantiateContractResponse>,
        ICosmosProtoAminoMessage {
  /// sender is the canonical address of the sender
  final List<int>? sender;

  final String? callbackCodeHash;

  final BigInt? codeId;

  final String? label;

  /// init_msg is an encrypted input to pass to the contract on init
  final List<int>? initMsg;

  final List<cosmos_base_v1beta1_coin.Coin> initFunds;

  /// used internally for encryption, should always be empty in a signed
  /// transaction
  final List<int>? callbackSig;

  /// Admin is an optional address that can execute migrations
  final String? admin;

  const MsgInstantiateContract({
    this.sender,
    this.callbackCodeHash,
    this.codeId,
    this.label,
    this.initMsg,
    this.initFunds = const [],
    this.callbackSig,
    this.admin,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(
          name: "amino.name",
          value: "wasm/MsgInstantiateContract",
        ),
      ],
      fields: [
        ProtoFieldConfig.bytes(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3, options: const []),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.bytes(5),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
        ProtoFieldConfig.bytes(7, options: const []),
        ProtoFieldConfig.string(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    callbackCodeHash,
    codeId,
    label,
    initMsg,
    initFunds,
    callbackSig,
    admin,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': switch (sender) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'callback_code_hash': callbackCodeHash,
      'code_id': codeId?.toString(),
      'label': label,
      'init_msg': switch (initMsg) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'init_funds': initFunds.map((e) => e.toJson()).toList(),
      'callback_sig': switch (callbackSig) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'admin': admin,
    };
  }

  factory MsgInstantiateContract.fromJson(Map<String, dynamic> json) {
    return MsgInstantiateContract(
      sender: json.valueAsBytes<List<int>?>(
        'sender',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      callbackCodeHash: json.valueAsString<String?>(
        'callback_code_hash',
        acceptCamelCase: true,
      ),
      codeId: json.valueAsBigInt<BigInt?>('code_id', acceptCamelCase: true),
      label: json.valueAsString<String?>('label', acceptCamelCase: true),
      initMsg: json.valueAsBytes<List<int>?>(
        'init_msg',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      initFunds:
          (json.valueEnsureAsList<dynamic>('init_funds', acceptCamelCase: true))
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
      callbackSig: json.valueAsBytes<List<int>?>(
        'callback_sig',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
    );
  }

  factory MsgInstantiateContract.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgInstantiateContract(
      sender: decode.getBytes<List<int>?>(1),
      callbackCodeHash: decode.getString<String?>(2),
      codeId: decode.getBigInt<BigInt?>(3),
      label: decode.getString<String?>(4),
      initMsg: decode.getBytes<List<int>?>(5),
      initFunds:
          decode
              .getListOfBytes(6)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      callbackSig: decode.getBytes<List<int>?>(7),
      admin: decode.getString<String?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1MsgInstantiateContract;
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

  /// Data contains base64-encoded bytes to returned from the contract
  final List<int>? data;

  const MsgInstantiateContractResponse({this.address, this.data});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.bytes(2)],
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
      DefaultCosmosProtoTypeUrl
          .secretComputeV1beta1MsgInstantiateContractResponse;
}

class MsgExecuteContract extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgExecuteContractResponse>,
        ICosmosProtoAminoMessage {
  /// sender is the canonical address of the sender
  final List<int>? sender;

  /// contract is the canonical address of the contract
  final List<int>? contract;

  /// msg is an encrypted input to pass to the contract on execute
  final List<int>? msg;

  /// used internally for encryption, should always be empty in a signed
  /// transaction
  final String? callbackCodeHash;

  final List<cosmos_base_v1beta1_coin.Coin> sentFunds;

  /// used internally for encryption, should always be empty in a signed
  /// transaction
  final List<int>? callbackSig;

  const MsgExecuteContract({
    this.sender,
    this.contract,
    this.msg,
    this.callbackCodeHash,
    this.sentFunds = const [],
    this.callbackSig,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(name: "amino.name", value: "wasm/MsgExecuteContract"),
      ],
      fields: [
        ProtoFieldConfig.bytes(1, options: const []),
        ProtoFieldConfig.bytes(2, options: const []),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
        ProtoFieldConfig.bytes(6, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    contract,
    msg,
    callbackCodeHash,
    sentFunds,
    callbackSig,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': switch (sender) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'contract': switch (contract) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'msg': switch (msg) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'callback_code_hash': callbackCodeHash,
      'sent_funds': sentFunds.map((e) => e.toJson()).toList(),
      'callback_sig': switch (callbackSig) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgExecuteContract.fromJson(Map<String, dynamic> json) {
    return MsgExecuteContract(
      sender: json.valueAsBytes<List<int>?>(
        'sender',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      contract: json.valueAsBytes<List<int>?>(
        'contract',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      msg: json.valueAsBytes<List<int>?>(
        'msg',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      callbackCodeHash: json.valueAsString<String?>(
        'callback_code_hash',
        acceptCamelCase: true,
      ),
      sentFunds:
          (json.valueEnsureAsList<dynamic>('sent_funds', acceptCamelCase: true))
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
      callbackSig: json.valueAsBytes<List<int>?>(
        'callback_sig',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgExecuteContract.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExecuteContract(
      sender: decode.getBytes<List<int>?>(1),
      contract: decode.getBytes<List<int>?>(2),
      msg: decode.getBytes<List<int>?>(3),
      callbackCodeHash: decode.getString<String?>(4),
      sentFunds:
          decode
              .getListOfBytes(5)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      callbackSig: decode.getBytes<List<int>?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1MsgExecuteContract;
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
  /// Data contains base64-encoded bytes to returned from the contract
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
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1MsgExecuteContractResponse;
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

  /// msg is an encrypted input to pass to the contract on migration
  final List<int>? msg;

  /// used internally for encryption, should always be empty in a signed
  /// transaction
  final List<int>? callbackSig;

  /// used internally for encryption, should always be empty in a signed
  /// transaction
  final String? callbackCodeHash;

  const MsgMigrateContract({
    this.sender,
    this.contract,
    this.codeId,
    this.msg,
    this.callbackSig,
    this.callbackCodeHash,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(name: "amino.name", value: "wasm/MsgMigrateContract"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3, options: const []),
        ProtoFieldConfig.bytes(4),
        ProtoFieldConfig.bytes(7, options: const []),
        ProtoFieldConfig.string(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    contract,
    codeId,
    msg,
    callbackSig,
    callbackCodeHash,
  ];

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
      'callback_sig': switch (callbackSig) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'callback_code_hash': callbackCodeHash,
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
      callbackSig: json.valueAsBytes<List<int>?>(
        'callback_sig',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      callbackCodeHash: json.valueAsString<String?>(
        'callback_code_hash',
        acceptCamelCase: true,
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
      callbackSig: decode.getBytes<List<int>?>(7),
      callbackCodeHash: decode.getString<String?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1MsgMigrateContract;
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
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1MsgMigrateContractResponse;
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

  /// used internally for encryption, should always be empty in a signed
  /// transaction
  final List<int>? callbackSig;

  const MsgUpdateAdmin({
    this.sender,
    this.newAdmin,
    this.contract,
    this.callbackSig,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(name: "amino.name", value: "wasm/MsgUpdateAdmin"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.bytes(7, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, newAdmin, contract, callbackSig];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'new_admin': newAdmin,
      'contract': contract,
      'callback_sig': switch (callbackSig) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgUpdateAdmin.fromJson(Map<String, dynamic> json) {
    return MsgUpdateAdmin(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      newAdmin: json.valueAsString<String?>('new_admin', acceptCamelCase: true),
      contract: json.valueAsString<String?>('contract', acceptCamelCase: true),
      callbackSig: json.valueAsBytes<List<int>?>(
        'callback_sig',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgUpdateAdmin.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateAdmin(
      sender: decode.getString<String?>(1),
      newAdmin: decode.getString<String?>(2),
      contract: decode.getString<String?>(3),
      callbackSig: decode.getBytes<List<int>?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1MsgUpdateAdmin;
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
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1MsgUpdateAdminResponse;
}

/// MsgClearAdmin removes any admin stored for a smart contract
class MsgClearAdmin extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgClearAdminResponse>,
        ICosmosProtoAminoMessage {
  /// Sender is the that actor that signed the messages
  final String? sender;

  /// Contract is the address of the smart contract
  final String? contract;

  /// used internally for encryption, should always be empty in a signed
  /// transaction
  final List<int>? callbackSig;

  const MsgClearAdmin({this.sender, this.contract, this.callbackSig});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(name: "amino.name", value: "wasm/MsgClearAdmin"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.bytes(7, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, contract, callbackSig];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'contract': contract,
      'callback_sig': switch (callbackSig) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgClearAdmin.fromJson(Map<String, dynamic> json) {
    return MsgClearAdmin(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      contract: json.valueAsString<String?>('contract', acceptCamelCase: true),
      callbackSig: json.valueAsBytes<List<int>?>(
        'callback_sig',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgClearAdmin.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgClearAdmin(
      sender: decode.getString<String?>(1),
      contract: decode.getString<String?>(3),
      callbackSig: decode.getBytes<List<int>?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1MsgClearAdmin;
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
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1MsgClearAdminResponse;
}

/// MsgUpdateParams updates params of compute module
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address of the governance account.
  final String? authority;

  /// params defines the x/compute parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final secret_compute_v1beta1_params.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(name: "amino.name", value: "wasm/MsgUpdateParams"),
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
          .valueTo<secret_compute_v1beta1_params.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => secret_compute_v1beta1_params.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<secret_compute_v1beta1_params.Params?>(
        2,
        (b) => secret_compute_v1beta1_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1MsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

/// MsgClearAdminResponse returns empty data
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
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1MsgUpdateParamsResponse;
}

class MsgUpgradeProposalPassed extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpgradeProposalPassedResponse>,
        ICosmosProtoAminoMessage {
  /// Sender is the actor that signed the message
  final String? senderAddress;

  /// SHA256 hash of the new MREnclave
  final List<int>? mrEnclaveHash;

  const MsgUpgradeProposalPassed({this.senderAddress, this.mrEnclaveHash});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "sender_address",
        ),
        ProtoOptionString(
          name: "amino.name",
          value: "wasm/MsgUpgradeProposalPassed",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.bytes(2)],
    );
  }

  @override
  List<Object?> get protoValues => [senderAddress, mrEnclaveHash];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender_address': senderAddress,
      'mr_enclave_hash': switch (mrEnclaveHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgUpgradeProposalPassed.fromJson(Map<String, dynamic> json) {
    return MsgUpgradeProposalPassed(
      senderAddress: json.valueAsString<String?>(
        'sender_address',
        acceptCamelCase: true,
      ),
      mrEnclaveHash: json.valueAsBytes<List<int>?>(
        'mr_enclave_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgUpgradeProposalPassed.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpgradeProposalPassed(
      senderAddress: decode.getString<String?>(1),
      mrEnclaveHash: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1MsgUpgradeProposalPassed;
  @override
  MsgUpgradeProposalPassedResponse onServiceResponse(List<int> bytes) {
    return MsgUpgradeProposalPassedResponse.deserialize(bytes);
  }

  @override
  MsgUpgradeProposalPassedResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpgradeProposalPassedResponse.fromJson(json);
  }
}

class MsgUpgradeProposalPassedResponse extends CosmosProtoMessage {
  const MsgUpgradeProposalPassedResponse();

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

  factory MsgUpgradeProposalPassedResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpgradeProposalPassedResponse();
  }

  factory MsgUpgradeProposalPassedResponse.deserialize(List<int> bytes) {
    return MsgUpgradeProposalPassedResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .secretComputeV1beta1MsgUpgradeProposalPassedResponse;
}

class MigrateContractInfo extends CosmosProtoMessage {
  final String? address;

  final BigInt? newCodeId;

  const MigrateContractInfo({this.address, this.newCodeId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [address, newCodeId];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address, 'new_code_id': newCodeId?.toString()};
  }

  factory MigrateContractInfo.fromJson(Map<String, dynamic> json) {
    return MigrateContractInfo(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      newCodeId: json.valueAsBigInt<BigInt?>(
        'new_code_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory MigrateContractInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MigrateContractInfo(
      address: decode.getString<String?>(1),
      newCodeId: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1MigrateContractInfo;
}

class UpdateAdminInfo extends CosmosProtoMessage {
  final String? address;

  final String? newAdmin;

  const UpdateAdminInfo({this.address, this.newAdmin});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [address, newAdmin];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address, 'new_admin': newAdmin};
  }

  factory UpdateAdminInfo.fromJson(Map<String, dynamic> json) {
    return UpdateAdminInfo(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      newAdmin: json.valueAsString<String?>('new_admin', acceptCamelCase: true),
    );
  }

  factory UpdateAdminInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UpdateAdminInfo(
      address: decode.getString<String?>(1),
      newAdmin: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1UpdateAdminInfo;
}

/// Empty string to remove admin
class MsgContractGovernanceProposal extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgContractGovernanceProposalResponse>,
        ICosmosProtoAminoMessage {
  final String? authority;

  final String? title;

  final String? description;

  final List<MigrateContractInfo> contracts;

  final List<UpdateAdminInfo> adminUpdates;

  const MsgContractGovernanceProposal({
    this.authority,
    this.title,
    this.description,
    this.contracts = const [],
    this.adminUpdates = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "wasm/MsgContractGovernanceProposal",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    authority,
    title,
    description,
    contracts,
    adminUpdates,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'title': title,
      'description': description,
      'contracts': contracts.map((e) => e.toJson()).toList(),
      'admin_updates': adminUpdates.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgContractGovernanceProposal.fromJson(Map<String, dynamic> json) {
    return MsgContractGovernanceProposal(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      title: json.valueAsString<String?>('title', acceptCamelCase: true),
      description: json.valueAsString<String?>(
        'description',
        acceptCamelCase: true,
      ),
      contracts:
          (json.valueEnsureAsList<dynamic>('contracts', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  MigrateContractInfo,
                  Map<String, dynamic>
                >(value: e, parse: (v) => MigrateContractInfo.fromJson(v)),
              )
              .toList(),
      adminUpdates:
          (json.valueEnsureAsList<dynamic>(
                'admin_updates',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<UpdateAdminInfo, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => UpdateAdminInfo.fromJson(v),
                    ),
              )
              .toList(),
    );
  }

  factory MsgContractGovernanceProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgContractGovernanceProposal(
      authority: decode.getString<String?>(1),
      title: decode.getString<String?>(2),
      description: decode.getString<String?>(3),
      contracts:
          decode
              .getListOfBytes(4)
              .map((b) => MigrateContractInfo.deserialize(b))
              .toList(),
      adminUpdates:
          decode
              .getListOfBytes(5)
              .map((b) => UpdateAdminInfo.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .secretComputeV1beta1MsgContractGovernanceProposal;
  @override
  MsgContractGovernanceProposalResponse onServiceResponse(List<int> bytes) {
    return MsgContractGovernanceProposalResponse.deserialize(bytes);
  }

  @override
  MsgContractGovernanceProposalResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgContractGovernanceProposalResponse.fromJson(json);
  }
}

/// Better field name
class MsgContractGovernanceProposalResponse extends CosmosProtoMessage {
  const MsgContractGovernanceProposalResponse();

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

  factory MsgContractGovernanceProposalResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgContractGovernanceProposalResponse();
  }

  factory MsgContractGovernanceProposalResponse.deserialize(List<int> bytes) {
    return MsgContractGovernanceProposalResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .secretComputeV1beta1MsgContractGovernanceProposalResponse;
}

class MsgSetContractGovernance extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetContractGovernanceResponse>,
        ICosmosProtoAminoMessage {
  /// Sender (must be contract admin)
  final String? sender;

  /// Contract address to update
  final String? contractAddress;

  const MsgSetContractGovernance({this.sender, this.contractAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(
          name: "amino.name",
          value: "wasm/MsgSetContractGovernance",
        ),
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

  factory MsgSetContractGovernance.fromJson(Map<String, dynamic> json) {
    return MsgSetContractGovernance(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgSetContractGovernance.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetContractGovernance(
      sender: decode.getString<String?>(1),
      contractAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1MsgSetContractGovernance;
  @override
  MsgSetContractGovernanceResponse onServiceResponse(List<int> bytes) {
    return MsgSetContractGovernanceResponse.deserialize(bytes);
  }

  @override
  MsgSetContractGovernanceResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetContractGovernanceResponse.fromJson(json);
  }
}

class MsgSetContractGovernanceResponse extends CosmosProtoMessage {
  const MsgSetContractGovernanceResponse();

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

  factory MsgSetContractGovernanceResponse.fromJson(Map<String, dynamic> json) {
    return MsgSetContractGovernanceResponse();
  }

  factory MsgSetContractGovernanceResponse.deserialize(List<int> bytes) {
    return MsgSetContractGovernanceResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .secretComputeV1beta1MsgSetContractGovernanceResponse;
}

class MsgUpdateMachineWhitelistProposal extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateMachineWhitelistProposalResponse>,
        ICosmosProtoAminoMessage {
  final String? authority;

  final String? title;

  final String? description;

  final String? machineId;

  const MsgUpdateMachineWhitelistProposal({
    this.authority,
    this.title,
    this.description,
    this.machineId,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "wasm/MsgUpdateMachineWhitelistProposal",
        ),
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
  List<Object?> get protoValues => [authority, title, description, machineId];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'title': title,
      'description': description,
      'machine_id': machineId,
    };
  }

  factory MsgUpdateMachineWhitelistProposal.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateMachineWhitelistProposal(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      title: json.valueAsString<String?>('title', acceptCamelCase: true),
      description: json.valueAsString<String?>(
        'description',
        acceptCamelCase: true,
      ),
      machineId: json.valueAsString<String?>(
        'machine_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateMachineWhitelistProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateMachineWhitelistProposal(
      authority: decode.getString<String?>(1),
      title: decode.getString<String?>(2),
      description: decode.getString<String?>(3),
      machineId: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .secretComputeV1beta1MsgUpdateMachineWhitelistProposal;
  @override
  MsgUpdateMachineWhitelistProposalResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateMachineWhitelistProposalResponse.deserialize(bytes);
  }

  @override
  MsgUpdateMachineWhitelistProposalResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateMachineWhitelistProposalResponse.fromJson(json);
  }
}

class MsgUpdateMachineWhitelistProposalResponse extends CosmosProtoMessage {
  const MsgUpdateMachineWhitelistProposalResponse();

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

  factory MsgUpdateMachineWhitelistProposalResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateMachineWhitelistProposalResponse();
  }

  factory MsgUpdateMachineWhitelistProposalResponse.deserialize(
    List<int> bytes,
  ) {
    return MsgUpdateMachineWhitelistProposalResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .secretComputeV1beta1MsgUpdateMachineWhitelistProposalResponse;
}

/// Execution message - sent by anyone after proposal passes
class MsgUpdateMachineWhitelist extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateMachineWhitelistResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final BigInt? proposalId;

  final String? machineId;

  const MsgUpdateMachineWhitelist({
    this.sender,
    this.proposalId,
    this.machineId,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(
          name: "amino.name",
          value: "wasm/MsgUpdateMachineWhitelist",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, proposalId, machineId];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'proposal_id': proposalId?.toString(),
      'machine_id': machineId,
    };
  }

  factory MsgUpdateMachineWhitelist.fromJson(Map<String, dynamic> json) {
    return MsgUpdateMachineWhitelist(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      proposalId: json.valueAsBigInt<BigInt?>(
        'proposal_id',
        acceptCamelCase: true,
      ),
      machineId: json.valueAsString<String?>(
        'machine_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateMachineWhitelist.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateMachineWhitelist(
      sender: decode.getString<String?>(1),
      proposalId: decode.getBigInt<BigInt?>(2),
      machineId: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1MsgUpdateMachineWhitelist;
  @override
  MsgUpdateMachineWhitelistResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateMachineWhitelistResponse.deserialize(bytes);
  }

  @override
  MsgUpdateMachineWhitelistResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateMachineWhitelistResponse.fromJson(json);
  }
}

class MsgUpdateMachineWhitelistResponse extends CosmosProtoMessage {
  const MsgUpdateMachineWhitelistResponse();

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

  factory MsgUpdateMachineWhitelistResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateMachineWhitelistResponse();
  }

  factory MsgUpdateMachineWhitelistResponse.deserialize(List<int> bytes) {
    return MsgUpdateMachineWhitelistResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .secretComputeV1beta1MsgUpdateMachineWhitelistResponse;
}
