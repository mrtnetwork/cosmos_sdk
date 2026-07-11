import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/stratos/register/v1/src/register.dart"
    as stratos_register_v1_register;

/// MsgCreateResourceNode encapsulates an MsgCreateResourceNodeTx transaction as an SDK message.
class MsgCreateResourceNode extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateResourceNodeResponse>,
        ICosmosProtoAminoMessage {
  final String? networkAddress;

  final google_protobuf_any.Any? pubkey;

  final cosmos_base_v1beta1_coin.Coin? value;

  final String? ownerAddress;

  final String? beneficiaryAddress;

  final stratos_register_v1_register.Description? description;

  final int? nodeType;

  const MsgCreateResourceNode({
    this.networkAddress,
    this.pubkey,
    this.value,
    this.ownerAddress,
    this.beneficiaryAddress,
    this.description,
    this.nodeType,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "owner_address"),
        ProtoOptionString(
          name: "amino.name",
          value: "stratos/MsgCreateResourceNode",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.message(
          6,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.uint32(7, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    networkAddress,
    pubkey,
    value,
    ownerAddress,
    beneficiaryAddress,
    description,
    nodeType,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'network_address': networkAddress,
      'pubkey': pubkey?.toJson(),
      'value': value?.toJson(),
      'owner_address': ownerAddress,
      'beneficiary_address': beneficiaryAddress,
      'description': description?.toJson(),
      'node_type': nodeType,
    };
  }

  factory MsgCreateResourceNode.fromJson(Map<String, dynamic> json) {
    return MsgCreateResourceNode(
      networkAddress: json.valueAsString<String?>(
        'network_address',
        acceptCamelCase: true,
      ),
      pubkey: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'pubkey',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
      value: json.valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
        key: 'value',
        parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
        acceptCamelCase: true,
      ),
      ownerAddress: json.valueAsString<String?>(
        'owner_address',
        acceptCamelCase: true,
      ),
      beneficiaryAddress: json.valueAsString<String?>(
        'beneficiary_address',
        acceptCamelCase: true,
      ),
      description: json.valueTo<
        stratos_register_v1_register.Description?,
        Map<String, dynamic>
      >(
        key: 'description',
        parse: (v) => stratos_register_v1_register.Description.fromJson(v),
        acceptCamelCase: true,
      ),
      nodeType: json.valueAsInt<int?>('node_type', acceptCamelCase: true),
    );
  }

  factory MsgCreateResourceNode.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateResourceNode(
      networkAddress: decode.getString<String?>(1),
      pubkey: decode.messageTo<google_protobuf_any.Any?>(
        2,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      value: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      ownerAddress: decode.getString<String?>(4),
      beneficiaryAddress: decode.getString<String?>(5),
      description: decode.messageTo<stratos_register_v1_register.Description?>(
        6,
        (b) => stratos_register_v1_register.Description.deserialize(b),
      ),
      nodeType: decode.getInt<int?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1MsgCreateResourceNode;
  @override
  MsgCreateResourceNodeResponse onServiceResponse(List<int> bytes) {
    return MsgCreateResourceNodeResponse.deserialize(bytes);
  }

  @override
  MsgCreateResourceNodeResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateResourceNodeResponse.fromJson(json);
  }
}

/// MsgCreateResourceNodeResponse defines the CreateResourceNodeTx response type
class MsgCreateResourceNodeResponse extends CosmosProtoMessage {
  const MsgCreateResourceNodeResponse();

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

  factory MsgCreateResourceNodeResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateResourceNodeResponse();
  }

  factory MsgCreateResourceNodeResponse.deserialize(List<int> bytes) {
    return MsgCreateResourceNodeResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1MsgCreateResourceNodeResponse;
}

/// MsgCreateMetaNode encapsulates an MsgCreateMetaNodeTx transaction as an SDK message.
class MsgCreateMetaNode extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateMetaNodeResponse>,
        ICosmosProtoAminoMessage {
  final String? networkAddress;

  final google_protobuf_any.Any? pubkey;

  final cosmos_base_v1beta1_coin.Coin? value;

  final String? ownerAddress;

  final String? beneficiaryAddress;

  final stratos_register_v1_register.Description? description;

  const MsgCreateMetaNode({
    this.networkAddress,
    this.pubkey,
    this.value,
    this.ownerAddress,
    this.beneficiaryAddress,
    this.description,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "owner_address"),
        ProtoOptionString(
          name: "amino.name",
          value: "stratos/MsgCreateMetaNode",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.message(
          6,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    networkAddress,
    pubkey,
    value,
    ownerAddress,
    beneficiaryAddress,
    description,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'network_address': networkAddress,
      'pubkey': pubkey?.toJson(),
      'value': value?.toJson(),
      'owner_address': ownerAddress,
      'beneficiary_address': beneficiaryAddress,
      'description': description?.toJson(),
    };
  }

  factory MsgCreateMetaNode.fromJson(Map<String, dynamic> json) {
    return MsgCreateMetaNode(
      networkAddress: json.valueAsString<String?>(
        'network_address',
        acceptCamelCase: true,
      ),
      pubkey: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'pubkey',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
      value: json.valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
        key: 'value',
        parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
        acceptCamelCase: true,
      ),
      ownerAddress: json.valueAsString<String?>(
        'owner_address',
        acceptCamelCase: true,
      ),
      beneficiaryAddress: json.valueAsString<String?>(
        'beneficiary_address',
        acceptCamelCase: true,
      ),
      description: json.valueTo<
        stratos_register_v1_register.Description?,
        Map<String, dynamic>
      >(
        key: 'description',
        parse: (v) => stratos_register_v1_register.Description.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateMetaNode.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateMetaNode(
      networkAddress: decode.getString<String?>(1),
      pubkey: decode.messageTo<google_protobuf_any.Any?>(
        2,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      value: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      ownerAddress: decode.getString<String?>(4),
      beneficiaryAddress: decode.getString<String?>(5),
      description: decode.messageTo<stratos_register_v1_register.Description?>(
        6,
        (b) => stratos_register_v1_register.Description.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1MsgCreateMetaNode;
  @override
  MsgCreateMetaNodeResponse onServiceResponse(List<int> bytes) {
    return MsgCreateMetaNodeResponse.deserialize(bytes);
  }

  @override
  MsgCreateMetaNodeResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgCreateMetaNodeResponse.fromJson(json);
  }
}

/// MsgCreateMetaNodeResponse defines the CreateMetaNode response type
class MsgCreateMetaNodeResponse extends CosmosProtoMessage {
  const MsgCreateMetaNodeResponse();

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

  factory MsgCreateMetaNodeResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateMetaNodeResponse();
  }

  factory MsgCreateMetaNodeResponse.deserialize(List<int> bytes) {
    return MsgCreateMetaNodeResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1MsgCreateMetaNodeResponse;
}

/// MsgRemoveResourceNode - encapsulates an RemoveResourceNode transaction as an SDK message
class MsgRemoveResourceNode extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRemoveResourceNodeResponse>,
        ICosmosProtoAminoMessage {
  final String? resourceNodeAddress;

  final String? ownerAddress;

  const MsgRemoveResourceNode({this.resourceNodeAddress, this.ownerAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "owner_address"),
        ProtoOptionString(
          name: "amino.name",
          value: "stratos/MsgRemoveResourceNode",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [resourceNodeAddress, ownerAddress];

  @override
  Map<String, dynamic> toJson() {
    return {
      'resource_node_address': resourceNodeAddress,
      'owner_address': ownerAddress,
    };
  }

  factory MsgRemoveResourceNode.fromJson(Map<String, dynamic> json) {
    return MsgRemoveResourceNode(
      resourceNodeAddress: json.valueAsString<String?>(
        'resource_node_address',
        acceptCamelCase: true,
      ),
      ownerAddress: json.valueAsString<String?>(
        'owner_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgRemoveResourceNode.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRemoveResourceNode(
      resourceNodeAddress: decode.getString<String?>(1),
      ownerAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1MsgRemoveResourceNode;
  @override
  MsgRemoveResourceNodeResponse onServiceResponse(List<int> bytes) {
    return MsgRemoveResourceNodeResponse.deserialize(bytes);
  }

  @override
  MsgRemoveResourceNodeResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRemoveResourceNodeResponse.fromJson(json);
  }
}

/// MsgRemoveResourceNodeResponse defines the Msg/RemoveResourceNode response type.
class MsgRemoveResourceNodeResponse extends CosmosProtoMessage {
  const MsgRemoveResourceNodeResponse();

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

  factory MsgRemoveResourceNodeResponse.fromJson(Map<String, dynamic> json) {
    return MsgRemoveResourceNodeResponse();
  }

  factory MsgRemoveResourceNodeResponse.deserialize(List<int> bytes) {
    return MsgRemoveResourceNodeResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1MsgRemoveResourceNodeResponse;
}

/// MsgRemoveMetaNode - encapsulates an MsgRemoveMetaNode transaction as an SDK message
class MsgRemoveMetaNode extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRemoveMetaNodeResponse>,
        ICosmosProtoAminoMessage {
  final String? metaNodeAddress;

  final String? ownerAddress;

  const MsgRemoveMetaNode({this.metaNodeAddress, this.ownerAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "owner_address"),
        ProtoOptionString(
          name: "amino.name",
          value: "stratos/MsgRemoveMetaNode",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [metaNodeAddress, ownerAddress];

  @override
  Map<String, dynamic> toJson() {
    return {
      'meta_node_address': metaNodeAddress,
      'owner_address': ownerAddress,
    };
  }

  factory MsgRemoveMetaNode.fromJson(Map<String, dynamic> json) {
    return MsgRemoveMetaNode(
      metaNodeAddress: json.valueAsString<String?>(
        'meta_node_address',
        acceptCamelCase: true,
      ),
      ownerAddress: json.valueAsString<String?>(
        'owner_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgRemoveMetaNode.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRemoveMetaNode(
      metaNodeAddress: decode.getString<String?>(1),
      ownerAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1MsgRemoveMetaNode;
  @override
  MsgRemoveMetaNodeResponse onServiceResponse(List<int> bytes) {
    return MsgRemoveMetaNodeResponse.deserialize(bytes);
  }

  @override
  MsgRemoveMetaNodeResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRemoveMetaNodeResponse.fromJson(json);
  }
}

/// MsgRemoveMetaNodeResponse defines the Msg/RemoveMetaNode response type.
class MsgRemoveMetaNodeResponse extends CosmosProtoMessage {
  const MsgRemoveMetaNodeResponse();

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

  factory MsgRemoveMetaNodeResponse.fromJson(Map<String, dynamic> json) {
    return MsgRemoveMetaNodeResponse();
  }

  factory MsgRemoveMetaNodeResponse.deserialize(List<int> bytes) {
    return MsgRemoveMetaNodeResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1MsgRemoveMetaNodeResponse;
}

/// MsgUpdateResourceNode defines a SDK message for updating an existing resource node.
class MsgUpdateResourceNode extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateResourceNodeResponse>,
        ICosmosProtoAminoMessage {
  final stratos_register_v1_register.Description? description;

  final String? beneficiaryAddress;

  final String? networkAddress;

  final String? ownerAddress;

  final int? nodeType;

  const MsgUpdateResourceNode({
    this.description,
    this.beneficiaryAddress,
    this.networkAddress,
    this.ownerAddress,
    this.nodeType,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "owner_address"),
        ProtoOptionString(
          name: "amino.name",
          value: "stratos/MsgUpdateResourceNode",
        ),
      ],
      fields: [
        ProtoFieldConfig.message(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.uint32(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    description,
    beneficiaryAddress,
    networkAddress,
    ownerAddress,
    nodeType,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'description': description?.toJson(),
      'beneficiary_address': beneficiaryAddress,
      'network_address': networkAddress,
      'owner_address': ownerAddress,
      'node_type': nodeType,
    };
  }

  factory MsgUpdateResourceNode.fromJson(Map<String, dynamic> json) {
    return MsgUpdateResourceNode(
      description: json.valueTo<
        stratos_register_v1_register.Description?,
        Map<String, dynamic>
      >(
        key: 'description',
        parse: (v) => stratos_register_v1_register.Description.fromJson(v),
        acceptCamelCase: true,
      ),
      beneficiaryAddress: json.valueAsString<String?>(
        'beneficiary_address',
        acceptCamelCase: true,
      ),
      networkAddress: json.valueAsString<String?>(
        'network_address',
        acceptCamelCase: true,
      ),
      ownerAddress: json.valueAsString<String?>(
        'owner_address',
        acceptCamelCase: true,
      ),
      nodeType: json.valueAsInt<int?>('node_type', acceptCamelCase: true),
    );
  }

  factory MsgUpdateResourceNode.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateResourceNode(
      description: decode.messageTo<stratos_register_v1_register.Description?>(
        1,
        (b) => stratos_register_v1_register.Description.deserialize(b),
      ),
      beneficiaryAddress: decode.getString<String?>(2),
      networkAddress: decode.getString<String?>(3),
      ownerAddress: decode.getString<String?>(4),
      nodeType: decode.getInt<int?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1MsgUpdateResourceNode;
  @override
  MsgUpdateResourceNodeResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateResourceNodeResponse.deserialize(bytes);
  }

  @override
  MsgUpdateResourceNodeResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateResourceNodeResponse.fromJson(json);
  }
}

/// MsgUpdateResourceNodeResponse defines the Msg/UpdateResourceNode response type.
class MsgUpdateResourceNodeResponse extends CosmosProtoMessage {
  const MsgUpdateResourceNodeResponse();

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

  factory MsgUpdateResourceNodeResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateResourceNodeResponse();
  }

  factory MsgUpdateResourceNodeResponse.deserialize(List<int> bytes) {
    return MsgUpdateResourceNodeResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1MsgUpdateResourceNodeResponse;
}

/// MsgUpdateMetaNode defines a SDK message for updating an existing meta node.
class MsgUpdateMetaNode extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateMetaNodeResponse>,
        ICosmosProtoAminoMessage {
  final stratos_register_v1_register.Description? description;

  final String? beneficiaryAddress;

  final String? networkAddress;

  final String? ownerAddress;

  const MsgUpdateMetaNode({
    this.description,
    this.beneficiaryAddress,
    this.networkAddress,
    this.ownerAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "owner_address"),
        ProtoOptionString(
          name: "amino.name",
          value: "stratos/MsgUpdateMetaNode",
        ),
      ],
      fields: [
        ProtoFieldConfig.message(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    description,
    beneficiaryAddress,
    networkAddress,
    ownerAddress,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'description': description?.toJson(),
      'beneficiary_address': beneficiaryAddress,
      'network_address': networkAddress,
      'owner_address': ownerAddress,
    };
  }

  factory MsgUpdateMetaNode.fromJson(Map<String, dynamic> json) {
    return MsgUpdateMetaNode(
      description: json.valueTo<
        stratos_register_v1_register.Description?,
        Map<String, dynamic>
      >(
        key: 'description',
        parse: (v) => stratos_register_v1_register.Description.fromJson(v),
        acceptCamelCase: true,
      ),
      beneficiaryAddress: json.valueAsString<String?>(
        'beneficiary_address',
        acceptCamelCase: true,
      ),
      networkAddress: json.valueAsString<String?>(
        'network_address',
        acceptCamelCase: true,
      ),
      ownerAddress: json.valueAsString<String?>(
        'owner_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateMetaNode.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateMetaNode(
      description: decode.messageTo<stratos_register_v1_register.Description?>(
        1,
        (b) => stratos_register_v1_register.Description.deserialize(b),
      ),
      beneficiaryAddress: decode.getString<String?>(2),
      networkAddress: decode.getString<String?>(3),
      ownerAddress: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1MsgUpdateMetaNode;
  @override
  MsgUpdateMetaNodeResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateMetaNodeResponse.deserialize(bytes);
  }

  @override
  MsgUpdateMetaNodeResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateMetaNodeResponse.fromJson(json);
  }
}

/// MsgUpdateMetaNodeResponse defines the Msg/UpdateMetaNode response type.
class MsgUpdateMetaNodeResponse extends CosmosProtoMessage {
  const MsgUpdateMetaNodeResponse();

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

  factory MsgUpdateMetaNodeResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateMetaNodeResponse();
  }

  factory MsgUpdateMetaNodeResponse.deserialize(List<int> bytes) {
    return MsgUpdateMetaNodeResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1MsgUpdateMetaNodeResponse;
}

/// MsgUpdateResourceNodeDeposit defines a SDK message for updating the deposit of an existing resource node.
class MsgUpdateResourceNodeDeposit extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateResourceNodeDepositResponse>,
        ICosmosProtoAminoMessage {
  final String? networkAddress;

  final String? ownerAddress;

  final cosmos_base_v1beta1_coin.Coin? depositDelta;

  const MsgUpdateResourceNodeDeposit({
    this.networkAddress,
    this.ownerAddress,
    this.depositDelta,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "owner_address"),
        ProtoOptionString(
          name: "amino.name",
          value: "stratos/MsgUpdateResourceNodeDeposit",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [networkAddress, ownerAddress, depositDelta];

  @override
  Map<String, dynamic> toJson() {
    return {
      'network_address': networkAddress,
      'owner_address': ownerAddress,
      'deposit_delta': depositDelta?.toJson(),
    };
  }

  factory MsgUpdateResourceNodeDeposit.fromJson(Map<String, dynamic> json) {
    return MsgUpdateResourceNodeDeposit(
      networkAddress: json.valueAsString<String?>(
        'network_address',
        acceptCamelCase: true,
      ),
      ownerAddress: json.valueAsString<String?>(
        'owner_address',
        acceptCamelCase: true,
      ),
      depositDelta: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'deposit_delta',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgUpdateResourceNodeDeposit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateResourceNodeDeposit(
      networkAddress: decode.getString<String?>(1),
      ownerAddress: decode.getString<String?>(2),
      depositDelta: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1MsgUpdateResourceNodeDeposit;
  @override
  MsgUpdateResourceNodeDepositResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateResourceNodeDepositResponse.deserialize(bytes);
  }

  @override
  MsgUpdateResourceNodeDepositResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateResourceNodeDepositResponse.fromJson(json);
  }
}

/// MsgUpdateResourceNodeDepositResponse defines the Msg/UpdateResourceNodeDeposit response type.
class MsgUpdateResourceNodeDepositResponse extends CosmosProtoMessage {
  const MsgUpdateResourceNodeDepositResponse();

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

  factory MsgUpdateResourceNodeDepositResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateResourceNodeDepositResponse();
  }

  factory MsgUpdateResourceNodeDepositResponse.deserialize(List<int> bytes) {
    return MsgUpdateResourceNodeDepositResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .stratosRegisterV1MsgUpdateResourceNodeDepositResponse;
}

/// MsgUpdateEffectiveDeposit defines a SDK message for updating the effective deposit of an existing resource node.
class MsgUpdateEffectiveDeposit extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateEffectiveDepositResponse>,
        ICosmosProtoAminoMessage {
  final List<String> reporters;

  final List<String> reporterOwner;

  final String? networkAddress;

  final String? effectiveTokens;

  const MsgUpdateEffectiveDeposit({
    this.reporters = const [],
    this.reporterOwner = const [],
    this.networkAddress,
    this.effectiveTokens,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "reporter_owner",
        ),
        ProtoOptionString(
          name: "amino.name",
          value: "stratos/MsgUpdateEffectiveDeposit",
        ),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(
          4,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    reporters,
    reporterOwner,
    networkAddress,
    effectiveTokens,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'reporters': reporters.map((e) => e).toList(),
      'reporter_owner': reporterOwner.map((e) => e).toList(),
      'network_address': networkAddress,
      'effective_tokens': effectiveTokens,
    };
  }

  factory MsgUpdateEffectiveDeposit.fromJson(Map<String, dynamic> json) {
    return MsgUpdateEffectiveDeposit(
      reporters:
          (json.valueEnsureAsList<dynamic>(
            'reporters',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      reporterOwner:
          (json.valueEnsureAsList<dynamic>(
            'reporter_owner',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      networkAddress: json.valueAsString<String?>(
        'network_address',
        acceptCamelCase: true,
      ),
      effectiveTokens: json.valueAsString<String?>(
        'effective_tokens',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateEffectiveDeposit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateEffectiveDeposit(
      reporters: decode.getListOrEmpty<String>(1),
      reporterOwner: decode.getListOrEmpty<String>(2),
      networkAddress: decode.getString<String?>(3),
      effectiveTokens: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1MsgUpdateEffectiveDeposit;
  @override
  MsgUpdateEffectiveDepositResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateEffectiveDepositResponse.deserialize(bytes);
  }

  @override
  MsgUpdateEffectiveDepositResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateEffectiveDepositResponse.fromJson(json);
  }
}

/// MsgUpdateEffectiveDepositResponse defines the Msg/UpdateEffectiveDeposit response type.
class MsgUpdateEffectiveDepositResponse extends CosmosProtoMessage {
  const MsgUpdateEffectiveDepositResponse();

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

  factory MsgUpdateEffectiveDepositResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateEffectiveDepositResponse();
  }

  factory MsgUpdateEffectiveDepositResponse.deserialize(List<int> bytes) {
    return MsgUpdateEffectiveDepositResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .stratosRegisterV1MsgUpdateEffectiveDepositResponse;
}

/// MsgUpdateMetaNodeDeposit defines a SDK message for updating the deposit of an existing meta node.
class MsgUpdateMetaNodeDeposit extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateMetaNodeDepositResponse>,
        ICosmosProtoAminoMessage {
  final String? networkAddress;

  final String? ownerAddress;

  final cosmos_base_v1beta1_coin.Coin? depositDelta;

  const MsgUpdateMetaNodeDeposit({
    this.networkAddress,
    this.ownerAddress,
    this.depositDelta,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "owner_address"),
        ProtoOptionString(
          name: "amino.name",
          value: "stratos/MsgUpdateMetaNodeDeposit",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [networkAddress, ownerAddress, depositDelta];

  @override
  Map<String, dynamic> toJson() {
    return {
      'network_address': networkAddress,
      'owner_address': ownerAddress,
      'deposit_delta': depositDelta?.toJson(),
    };
  }

  factory MsgUpdateMetaNodeDeposit.fromJson(Map<String, dynamic> json) {
    return MsgUpdateMetaNodeDeposit(
      networkAddress: json.valueAsString<String?>(
        'network_address',
        acceptCamelCase: true,
      ),
      ownerAddress: json.valueAsString<String?>(
        'owner_address',
        acceptCamelCase: true,
      ),
      depositDelta: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'deposit_delta',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgUpdateMetaNodeDeposit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateMetaNodeDeposit(
      networkAddress: decode.getString<String?>(1),
      ownerAddress: decode.getString<String?>(2),
      depositDelta: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1MsgUpdateMetaNodeDeposit;
  @override
  MsgUpdateMetaNodeDepositResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateMetaNodeDepositResponse.deserialize(bytes);
  }

  @override
  MsgUpdateMetaNodeDepositResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateMetaNodeDepositResponse.fromJson(json);
  }
}

/// MsgUpdateMetaNodeDepositResponse defines the Msg/UpdateMetaNodeDeposit response type.
class MsgUpdateMetaNodeDepositResponse extends CosmosProtoMessage {
  const MsgUpdateMetaNodeDepositResponse();

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

  factory MsgUpdateMetaNodeDepositResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateMetaNodeDepositResponse();
  }

  factory MsgUpdateMetaNodeDepositResponse.deserialize(List<int> bytes) {
    return MsgUpdateMetaNodeDepositResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .stratosRegisterV1MsgUpdateMetaNodeDepositResponse;
}

/// MsgMetaNodeRegistrationVote defines a SDK message for registration vote of an existing meta node.
class MsgMetaNodeRegistrationVote extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgMetaNodeRegistrationVoteResponse>,
        ICosmosProtoAminoMessage {
  final String? candidateNetworkAddress;

  /// node address of meta node
  final String? candidateOwnerAddress;

  /// owner address of meta node
  final bool? opinion;

  final String? voterNetworkAddress;

  /// address of voter (other existed meta node)
  final String? voterOwnerAddress;

  const MsgMetaNodeRegistrationVote({
    this.candidateNetworkAddress,
    this.candidateOwnerAddress,
    this.opinion,
    this.voterNetworkAddress,
    this.voterOwnerAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "voter_owner_address",
        ),
        ProtoOptionString(
          name: "amino.name",
          value: "stratos/MsgMetaNodeRegistrationVote",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.bool(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    candidateNetworkAddress,
    candidateOwnerAddress,
    opinion,
    voterNetworkAddress,
    voterOwnerAddress,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'candidate_network_address': candidateNetworkAddress,
      'candidate_owner_address': candidateOwnerAddress,
      'opinion': opinion,
      'voter_network_address': voterNetworkAddress,
      'voter_owner_address': voterOwnerAddress,
    };
  }

  factory MsgMetaNodeRegistrationVote.fromJson(Map<String, dynamic> json) {
    return MsgMetaNodeRegistrationVote(
      candidateNetworkAddress: json.valueAsString<String?>(
        'candidate_network_address',
        acceptCamelCase: true,
      ),
      candidateOwnerAddress: json.valueAsString<String?>(
        'candidate_owner_address',
        acceptCamelCase: true,
      ),
      opinion: json.valueAsBool<bool?>('opinion', acceptCamelCase: true),
      voterNetworkAddress: json.valueAsString<String?>(
        'voter_network_address',
        acceptCamelCase: true,
      ),
      voterOwnerAddress: json.valueAsString<String?>(
        'voter_owner_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgMetaNodeRegistrationVote.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgMetaNodeRegistrationVote(
      candidateNetworkAddress: decode.getString<String?>(1),
      candidateOwnerAddress: decode.getString<String?>(2),
      opinion: decode.getBool<bool?>(3),
      voterNetworkAddress: decode.getString<String?>(4),
      voterOwnerAddress: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1MsgMetaNodeRegistrationVote;
  @override
  MsgMetaNodeRegistrationVoteResponse onServiceResponse(List<int> bytes) {
    return MsgMetaNodeRegistrationVoteResponse.deserialize(bytes);
  }

  @override
  MsgMetaNodeRegistrationVoteResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgMetaNodeRegistrationVoteResponse.fromJson(json);
  }
}

/// address of owner of the voter (other existed meta node)
/// MsgMetaNodeRegistrationVoteResponse defines the Msg/MetaNodeRegistrationVote response type.
class MsgMetaNodeRegistrationVoteResponse extends CosmosProtoMessage {
  const MsgMetaNodeRegistrationVoteResponse();

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

  factory MsgMetaNodeRegistrationVoteResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgMetaNodeRegistrationVoteResponse();
  }

  factory MsgMetaNodeRegistrationVoteResponse.deserialize(List<int> bytes) {
    return MsgMetaNodeRegistrationVoteResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .stratosRegisterV1MsgMetaNodeRegistrationVoteResponse;
}

class MsgKickMetaNodeVote extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgKickMetaNodeVoteResponse>,
        ICosmosProtoAminoMessage {
  final String? targetNetworkAddress;

  final bool? opinion;

  final String? voterNetworkAddress;

  final String? voterOwnerAddress;

  const MsgKickMetaNodeVote({
    this.targetNetworkAddress,
    this.opinion,
    this.voterNetworkAddress,
    this.voterOwnerAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "voter_owner_address",
        ),
        ProtoOptionString(
          name: "amino.name",
          value: "stratos/MsgKickMetaNodeVote",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.bool(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    targetNetworkAddress,
    opinion,
    voterNetworkAddress,
    voterOwnerAddress,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'target_network_address': targetNetworkAddress,
      'opinion': opinion,
      'voter_network_address': voterNetworkAddress,
      'voter_owner_address': voterOwnerAddress,
    };
  }

  factory MsgKickMetaNodeVote.fromJson(Map<String, dynamic> json) {
    return MsgKickMetaNodeVote(
      targetNetworkAddress: json.valueAsString<String?>(
        'target_network_address',
        acceptCamelCase: true,
      ),
      opinion: json.valueAsBool<bool?>('opinion', acceptCamelCase: true),
      voterNetworkAddress: json.valueAsString<String?>(
        'voter_network_address',
        acceptCamelCase: true,
      ),
      voterOwnerAddress: json.valueAsString<String?>(
        'voter_owner_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgKickMetaNodeVote.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgKickMetaNodeVote(
      targetNetworkAddress: decode.getString<String?>(1),
      opinion: decode.getBool<bool?>(2),
      voterNetworkAddress: decode.getString<String?>(3),
      voterOwnerAddress: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1MsgKickMetaNodeVote;
  @override
  MsgKickMetaNodeVoteResponse onServiceResponse(List<int> bytes) {
    return MsgKickMetaNodeVoteResponse.deserialize(bytes);
  }

  @override
  MsgKickMetaNodeVoteResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgKickMetaNodeVoteResponse.fromJson(json);
  }
}

class MsgKickMetaNodeVoteResponse extends CosmosProtoMessage {
  const MsgKickMetaNodeVoteResponse();

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

  factory MsgKickMetaNodeVoteResponse.fromJson(Map<String, dynamic> json) {
    return MsgKickMetaNodeVoteResponse();
  }

  factory MsgKickMetaNodeVoteResponse.deserialize(List<int> bytes) {
    return MsgKickMetaNodeVoteResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1MsgKickMetaNodeVoteResponse;
}

/// MsgUpdateParams defines a Msg for updating the x/register module parameters.
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address of the governance account.
  final String? authority;

  /// params defines the x/register parameters to update.
  /// NOTE: All parameters must be supplied.
  final stratos_register_v1_register.Params? params;

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
          value: "stratos/x/register/MsgUpdateParams",
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
          .valueTo<stratos_register_v1_register.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => stratos_register_v1_register.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<stratos_register_v1_register.Params?>(
        2,
        (b) => stratos_register_v1_register.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1MsgUpdateParams;
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
      DefaultCosmosProtoTypeUrl.stratosRegisterV1MsgUpdateParamsResponse;
}
