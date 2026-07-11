import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;

/// MsgGrantAllowance adds permission for Grantee to spend up to Allowance
/// of fees from the account of Granter.
class MsgGrantAllowance extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgGrantAllowanceResponse>,
        ICosmosProtoAminoMessage {
  /// granter is the address of the user granting an allowance of their funds.
  final String? granter;

  /// grantee is the address of the user being granted an allowance of another user's funds.
  final String? grantee;

  /// allowance can be any of basic, periodic, allowed fee allowance.
  final google_protobuf_any.Any? allowance;

  const MsgGrantAllowance({this.granter, this.grantee, this.allowance});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "granter"),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/MsgGrantAllowance",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [granter, grantee, allowance];

  @override
  Map<String, dynamic> toJson() {
    return {
      'granter': granter,
      'grantee': grantee,
      'allowance': allowance?.toJson(),
    };
  }

  factory MsgGrantAllowance.fromJson(Map<String, dynamic> json) {
    return MsgGrantAllowance(
      granter: json.valueAsString<String?>('granter', acceptCamelCase: true),
      grantee: json.valueAsString<String?>('grantee', acceptCamelCase: true),
      allowance: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'allowance',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgGrantAllowance.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgGrantAllowance(
      granter: decode.getString<String?>(1),
      grantee: decode.getString<String?>(2),
      allowance: decode.messageTo<google_protobuf_any.Any?>(
        3,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosFeegrantV1beta1MsgGrantAllowance;
  @override
  MsgGrantAllowanceResponse onServiceResponse(List<int> bytes) {
    return MsgGrantAllowanceResponse.deserialize(bytes);
  }

  @override
  MsgGrantAllowanceResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgGrantAllowanceResponse.fromJson(json);
  }
}

/// MsgGrantAllowanceResponse defines the Msg/GrantAllowanceResponse response type.
class MsgGrantAllowanceResponse extends CosmosProtoMessage {
  const MsgGrantAllowanceResponse();

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

  factory MsgGrantAllowanceResponse.fromJson(Map<String, dynamic> json) {
    return MsgGrantAllowanceResponse();
  }

  factory MsgGrantAllowanceResponse.deserialize(List<int> bytes) {
    return MsgGrantAllowanceResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosFeegrantV1beta1MsgGrantAllowanceResponse;
}

/// MsgRevokeAllowance removes any existing Allowance from Granter to Grantee.
class MsgRevokeAllowance extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRevokeAllowanceResponse>,
        ICosmosProtoAminoMessage {
  /// granter is the address of the user granting an allowance of their funds.
  final String? granter;

  /// grantee is the address of the user being granted an allowance of another user's funds.
  final String? grantee;

  const MsgRevokeAllowance({this.granter, this.grantee});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "granter"),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/MsgRevokeAllowance",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [granter, grantee];

  @override
  Map<String, dynamic> toJson() {
    return {'granter': granter, 'grantee': grantee};
  }

  factory MsgRevokeAllowance.fromJson(Map<String, dynamic> json) {
    return MsgRevokeAllowance(
      granter: json.valueAsString<String?>('granter', acceptCamelCase: true),
      grantee: json.valueAsString<String?>('grantee', acceptCamelCase: true),
    );
  }

  factory MsgRevokeAllowance.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRevokeAllowance(
      granter: decode.getString<String?>(1),
      grantee: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosFeegrantV1beta1MsgRevokeAllowance;
  @override
  MsgRevokeAllowanceResponse onServiceResponse(List<int> bytes) {
    return MsgRevokeAllowanceResponse.deserialize(bytes);
  }

  @override
  MsgRevokeAllowanceResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRevokeAllowanceResponse.fromJson(json);
  }
}

/// MsgRevokeAllowanceResponse defines the Msg/RevokeAllowanceResponse response type.
class MsgRevokeAllowanceResponse extends CosmosProtoMessage {
  const MsgRevokeAllowanceResponse();

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

  factory MsgRevokeAllowanceResponse.fromJson(Map<String, dynamic> json) {
    return MsgRevokeAllowanceResponse();
  }

  factory MsgRevokeAllowanceResponse.deserialize(List<int> bytes) {
    return MsgRevokeAllowanceResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosFeegrantV1beta1MsgRevokeAllowanceResponse;
}

/// MsgPruneAllowances prunes expired fee allowances.
class MsgPruneAllowances extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgPruneAllowancesResponse> {
  /// pruner is the address of the user pruning expired allowances.
  final String? pruner;

  const MsgPruneAllowances({this.pruner});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "pruner"),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [pruner];

  @override
  Map<String, dynamic> toJson() {
    return {'pruner': pruner};
  }

  factory MsgPruneAllowances.fromJson(Map<String, dynamic> json) {
    return MsgPruneAllowances(
      pruner: json.valueAsString<String?>('pruner', acceptCamelCase: true),
    );
  }

  factory MsgPruneAllowances.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgPruneAllowances(pruner: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosFeegrantV1beta1MsgPruneAllowances;
  @override
  MsgPruneAllowancesResponse onServiceResponse(List<int> bytes) {
    return MsgPruneAllowancesResponse.deserialize(bytes);
  }

  @override
  MsgPruneAllowancesResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgPruneAllowancesResponse.fromJson(json);
  }
}

/// MsgPruneAllowancesResponse defines the Msg/PruneAllowancesResponse response type.
class MsgPruneAllowancesResponse extends CosmosProtoMessage {
  const MsgPruneAllowancesResponse();

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

  factory MsgPruneAllowancesResponse.fromJson(Map<String, dynamic> json) {
    return MsgPruneAllowancesResponse();
  }

  factory MsgPruneAllowancesResponse.deserialize(List<int> bytes) {
    return MsgPruneAllowancesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosFeegrantV1beta1MsgPruneAllowancesResponse;
}
