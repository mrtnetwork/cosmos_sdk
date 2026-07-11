import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/authz/v1beta1/src/authz.dart"
    as cosmos_authz_v1beta1_authz;
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;

/// MsgGrant is a request type for Grant method. It declares authorization to the grantee
/// on behalf of the granter with the provided expiration time.
class MsgGrant extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgGrantResponse>,
        ICosmosProtoAminoMessage {
  final String? granter;

  final String? grantee;

  final cosmos_authz_v1beta1_authz.Grant? grant;

  const MsgGrant({this.granter, this.grantee, this.grant});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "granter"),
        ProtoOptionString(name: "amino.name", value: "cosmos-sdk/MsgGrant"),
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
  List<Object?> get protoValues => [granter, grantee, grant];

  @override
  Map<String, dynamic> toJson() {
    return {'granter': granter, 'grantee': grantee, 'grant': grant?.toJson()};
  }

  factory MsgGrant.fromJson(Map<String, dynamic> json) {
    return MsgGrant(
      granter: json.valueAsString<String?>('granter', acceptCamelCase: true),
      grantee: json.valueAsString<String?>('grantee', acceptCamelCase: true),
      grant: json
          .valueTo<cosmos_authz_v1beta1_authz.Grant?, Map<String, dynamic>>(
            key: 'grant',
            parse: (v) => cosmos_authz_v1beta1_authz.Grant.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgGrant.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgGrant(
      granter: decode.getString<String?>(1),
      grantee: decode.getString<String?>(2),
      grant: decode.messageTo<cosmos_authz_v1beta1_authz.Grant?>(
        3,
        (b) => cosmos_authz_v1beta1_authz.Grant.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthzV1beta1MsgGrant;
  @override
  MsgGrantResponse onServiceResponse(List<int> bytes) {
    return MsgGrantResponse.deserialize(bytes);
  }

  @override
  MsgGrantResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgGrantResponse.fromJson(json);
  }
}

/// MsgGrantResponse defines the Msg/MsgGrant response type.
class MsgGrantResponse extends CosmosProtoMessage {
  const MsgGrantResponse();

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

  factory MsgGrantResponse.fromJson(Map<String, dynamic> json) {
    return MsgGrantResponse();
  }

  factory MsgGrantResponse.deserialize(List<int> bytes) {
    return MsgGrantResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthzV1beta1MsgGrantResponse;
}

/// MsgExec attempts to execute the provided messages using
/// authorizations granted to the grantee. Each message should have only
/// one signer corresponding to the granter of the authorization.
class MsgExec extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgExecResponse>, ICosmosProtoAminoMessage {
  final String? grantee;

  /// Execute Msg.
  /// The x/authz will try to find a grant matching (msg.signers[0], grantee, MsgTypeURL(msg))
  /// triple and validate it.
  final List<google_protobuf_any.Any> msgs;

  const MsgExec({this.grantee, this.msgs = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "grantee"),
        ProtoOptionString(name: "amino.name", value: "cosmos-sdk/MsgExec"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [grantee, msgs];

  @override
  Map<String, dynamic> toJson() {
    return {'grantee': grantee, 'msgs': msgs.map((e) => e.toJson()).toList()};
  }

  factory MsgExec.fromJson(Map<String, dynamic> json) {
    return MsgExec(
      grantee: json.valueAsString<String?>('grantee', acceptCamelCase: true),
      msgs:
          (json.valueEnsureAsList<dynamic>('msgs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  google_protobuf_any.Any,
                  Map<String, dynamic>
                >(value: e, parse: (v) => google_protobuf_any.Any.fromJson(v)),
              )
              .toList(),
    );
  }

  factory MsgExec.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExec(
      grantee: decode.getString<String?>(1),
      msgs:
          decode
              .getListOfBytes(2)
              .map((b) => google_protobuf_any.Any.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthzV1beta1MsgExec;
  @override
  MsgExecResponse onServiceResponse(List<int> bytes) {
    return MsgExecResponse.deserialize(bytes);
  }

  @override
  MsgExecResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgExecResponse.fromJson(json);
  }
}

/// MsgExecResponse defines the Msg/MsgExecResponse response type.
class MsgExecResponse extends CosmosProtoMessage {
  final List<List<int>> results;

  const MsgExecResponse({this.results = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.bytes,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [results];

  @override
  Map<String, dynamic> toJson() {
    return {
      'results':
          results
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
    };
  }

  factory MsgExecResponse.fromJson(Map<String, dynamic> json) {
    return MsgExecResponse(
      results:
          (json.valueEnsureAsList<dynamic>('results', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
    );
  }

  factory MsgExecResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExecResponse(results: decode.getListOfBytes(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthzV1beta1MsgExecResponse;
}

/// MsgRevoke revokes any authorization with the provided sdk.Msg type on the
/// granter's account with that has been granted to the grantee.
class MsgRevoke extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRevokeResponse>,
        ICosmosProtoAminoMessage {
  final String? granter;

  final String? grantee;

  final String? msgTypeUrl;

  const MsgRevoke({this.granter, this.grantee, this.msgTypeUrl});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "granter"),
        ProtoOptionString(name: "amino.name", value: "cosmos-sdk/MsgRevoke"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [granter, grantee, msgTypeUrl];

  @override
  Map<String, dynamic> toJson() {
    return {'granter': granter, 'grantee': grantee, 'msg_type_url': msgTypeUrl};
  }

  factory MsgRevoke.fromJson(Map<String, dynamic> json) {
    return MsgRevoke(
      granter: json.valueAsString<String?>('granter', acceptCamelCase: true),
      grantee: json.valueAsString<String?>('grantee', acceptCamelCase: true),
      msgTypeUrl: json.valueAsString<String?>(
        'msg_type_url',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgRevoke.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRevoke(
      granter: decode.getString<String?>(1),
      grantee: decode.getString<String?>(2),
      msgTypeUrl: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthzV1beta1MsgRevoke;
  @override
  MsgRevokeResponse onServiceResponse(List<int> bytes) {
    return MsgRevokeResponse.deserialize(bytes);
  }

  @override
  MsgRevokeResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRevokeResponse.fromJson(json);
  }
}

/// MsgRevokeResponse defines the Msg/MsgRevokeResponse response type.
class MsgRevokeResponse extends CosmosProtoMessage {
  const MsgRevokeResponse();

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

  factory MsgRevokeResponse.fromJson(Map<String, dynamic> json) {
    return MsgRevokeResponse();
  }

  factory MsgRevokeResponse.deserialize(List<int> bytes) {
    return MsgRevokeResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthzV1beta1MsgRevokeResponse;
}
