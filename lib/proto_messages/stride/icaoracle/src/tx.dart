import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Adds a new oracle
class MsgAddOracle extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgAddOracleResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  final String? connectionId;

  const MsgAddOracle({this.creator, this.connectionId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(name: "amino.name", value: "icaoracle/MsgAddOracle"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [creator, connectionId];

  @override
  Map<String, dynamic> toJson() {
    return {'creator': creator, 'connection_id': connectionId};
  }

  factory MsgAddOracle.fromJson(Map<String, dynamic> json) {
    return MsgAddOracle(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      connectionId: json.valueAsString<String?>(
        'connection_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgAddOracle.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAddOracle(
      creator: decode.getString<String?>(1),
      connectionId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcaoracleMsgAddOracle;
  @override
  MsgAddOracleResponse onServiceResponse(List<int> bytes) {
    return MsgAddOracleResponse.deserialize(bytes);
  }

  @override
  MsgAddOracleResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgAddOracleResponse.fromJson(json);
  }
}

class MsgAddOracleResponse extends CosmosProtoMessage {
  const MsgAddOracleResponse();

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

  factory MsgAddOracleResponse.fromJson(Map<String, dynamic> json) {
    return MsgAddOracleResponse();
  }

  factory MsgAddOracleResponse.deserialize(List<int> bytes) {
    return MsgAddOracleResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcaoracleMsgAddOracleResponse;
}

/// Instantiates the oracle's CW contract
class MsgInstantiateOracle extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgInstantiateOracleResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  final String? oracleChainId;

  final BigInt? contractCodeId;

  final String? transferChannelOnOracle;

  const MsgInstantiateOracle({
    this.creator,
    this.oracleChainId,
    this.contractCodeId,
    this.transferChannelOnOracle,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "icaoracle/MsgInstantiateOracle",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    creator,
    oracleChainId,
    contractCodeId,
    transferChannelOnOracle,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'creator': creator,
      'oracle_chain_id': oracleChainId,
      'contract_code_id': contractCodeId?.toString(),
      'transfer_channel_on_oracle': transferChannelOnOracle,
    };
  }

  factory MsgInstantiateOracle.fromJson(Map<String, dynamic> json) {
    return MsgInstantiateOracle(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      oracleChainId: json.valueAsString<String?>(
        'oracle_chain_id',
        acceptCamelCase: true,
      ),
      contractCodeId: json.valueAsBigInt<BigInt?>(
        'contract_code_id',
        acceptCamelCase: true,
      ),
      transferChannelOnOracle: json.valueAsString<String?>(
        'transfer_channel_on_oracle',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgInstantiateOracle.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgInstantiateOracle(
      creator: decode.getString<String?>(1),
      oracleChainId: decode.getString<String?>(2),
      contractCodeId: decode.getBigInt<BigInt?>(3),
      transferChannelOnOracle: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcaoracleMsgInstantiateOracle;
  @override
  MsgInstantiateOracleResponse onServiceResponse(List<int> bytes) {
    return MsgInstantiateOracleResponse.deserialize(bytes);
  }

  @override
  MsgInstantiateOracleResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgInstantiateOracleResponse.fromJson(json);
  }
}

class MsgInstantiateOracleResponse extends CosmosProtoMessage {
  const MsgInstantiateOracleResponse();

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

  factory MsgInstantiateOracleResponse.fromJson(Map<String, dynamic> json) {
    return MsgInstantiateOracleResponse();
  }

  factory MsgInstantiateOracleResponse.deserialize(List<int> bytes) {
    return MsgInstantiateOracleResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcaoracleMsgInstantiateOracleResponse;
}

/// Restore's a closed ICA channel for a given oracle
class MsgRestoreOracleICA extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRestoreOracleICAResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  final String? oracleChainId;

  const MsgRestoreOracleICA({this.creator, this.oracleChainId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "icaoracle/MsgRestoreOracleICA",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [creator, oracleChainId];

  @override
  Map<String, dynamic> toJson() {
    return {'creator': creator, 'oracle_chain_id': oracleChainId};
  }

  factory MsgRestoreOracleICA.fromJson(Map<String, dynamic> json) {
    return MsgRestoreOracleICA(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      oracleChainId: json.valueAsString<String?>(
        'oracle_chain_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgRestoreOracleICA.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRestoreOracleICA(
      creator: decode.getString<String?>(1),
      oracleChainId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcaoracleMsgRestoreOracleICA;
  @override
  MsgRestoreOracleICAResponse onServiceResponse(List<int> bytes) {
    return MsgRestoreOracleICAResponse.deserialize(bytes);
  }

  @override
  MsgRestoreOracleICAResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRestoreOracleICAResponse.fromJson(json);
  }
}

class MsgRestoreOracleICAResponse extends CosmosProtoMessage {
  const MsgRestoreOracleICAResponse();

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

  factory MsgRestoreOracleICAResponse.fromJson(Map<String, dynamic> json) {
    return MsgRestoreOracleICAResponse();
  }

  factory MsgRestoreOracleICAResponse.deserialize(List<int> bytes) {
    return MsgRestoreOracleICAResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcaoracleMsgRestoreOracleICAResponse;
}

/// Toggle's whether an oracle is active and should receive metric updates
class MsgToggleOracle extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgToggleOracleResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless
  /// overwritten).
  final String? authority;

  final String? oracleChainId;

  final bool? active;

  const MsgToggleOracle({this.authority, this.oracleChainId, this.active});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "icaoracle/MsgToggleOracle",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.bool(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, oracleChainId, active];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'oracle_chain_id': oracleChainId,
      'active': active,
    };
  }

  factory MsgToggleOracle.fromJson(Map<String, dynamic> json) {
    return MsgToggleOracle(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      oracleChainId: json.valueAsString<String?>(
        'oracle_chain_id',
        acceptCamelCase: true,
      ),
      active: json.valueAsBool<bool?>('active', acceptCamelCase: true),
    );
  }

  factory MsgToggleOracle.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgToggleOracle(
      authority: decode.getString<String?>(1),
      oracleChainId: decode.getString<String?>(2),
      active: decode.getBool<bool?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcaoracleMsgToggleOracle;
  @override
  MsgToggleOracleResponse onServiceResponse(List<int> bytes) {
    return MsgToggleOracleResponse.deserialize(bytes);
  }

  @override
  MsgToggleOracleResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgToggleOracleResponse.fromJson(json);
  }
}

class MsgToggleOracleResponse extends CosmosProtoMessage {
  const MsgToggleOracleResponse();

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

  factory MsgToggleOracleResponse.fromJson(Map<String, dynamic> json) {
    return MsgToggleOracleResponse();
  }

  factory MsgToggleOracleResponse.deserialize(List<int> bytes) {
    return MsgToggleOracleResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcaoracleMsgToggleOracleResponse;
}

/// Removes an oracle completely
class MsgRemoveOracle extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRemoveOracleResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless
  /// overwritten).
  final String? authority;

  final String? oracleChainId;

  const MsgRemoveOracle({this.authority, this.oracleChainId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "icaoracle/MsgRemoveOracle",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, oracleChainId];

  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'oracle_chain_id': oracleChainId};
  }

  factory MsgRemoveOracle.fromJson(Map<String, dynamic> json) {
    return MsgRemoveOracle(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      oracleChainId: json.valueAsString<String?>(
        'oracle_chain_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgRemoveOracle.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRemoveOracle(
      authority: decode.getString<String?>(1),
      oracleChainId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcaoracleMsgRemoveOracle;
  @override
  MsgRemoveOracleResponse onServiceResponse(List<int> bytes) {
    return MsgRemoveOracleResponse.deserialize(bytes);
  }

  @override
  MsgRemoveOracleResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRemoveOracleResponse.fromJson(json);
  }
}

class MsgRemoveOracleResponse extends CosmosProtoMessage {
  const MsgRemoveOracleResponse();

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

  factory MsgRemoveOracleResponse.fromJson(Map<String, dynamic> json) {
    return MsgRemoveOracleResponse();
  }

  factory MsgRemoveOracleResponse.deserialize(List<int> bytes) {
    return MsgRemoveOracleResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcaoracleMsgRemoveOracleResponse;
}
