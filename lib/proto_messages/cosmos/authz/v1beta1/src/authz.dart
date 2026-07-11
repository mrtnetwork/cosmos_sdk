import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;

/// Grant gives permissions to execute
/// the provide method with expiration time.
class Grant extends CosmosProtoMessage {
  final google_protobuf_any.Any? authorization;

  /// time when the grant will expire and will be pruned. If null, then the grant
  /// doesn't have a time expiration (other conditions  in `authorization`
  /// may apply to invalidate the grant)
  final google_protobuf_timestamp.Timestamp? expiration;

  const Grant({this.authorization, this.expiration});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authorization, expiration];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authorization': authorization?.toJson(),
      'expiration': expiration?.toRfc3339(),
    };
  }

  factory Grant.fromJson(Map<String, dynamic> json) {
    return Grant(
      authorization: json
          .valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
            key: 'authorization',
            parse: (v) => google_protobuf_any.Any.fromJson(v),
            acceptCamelCase: true,
          ),
      expiration: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'expiration',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory Grant.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Grant(
      authorization: decode.messageTo<google_protobuf_any.Any?>(
        1,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      expiration: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        2,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthzV1beta1Grant;
}

/// GrantAuthorization extends a grant with both the addresses of the grantee and granter.
/// It is used in genesis.proto and query.proto
class GrantAuthorization extends CosmosProtoMessage {
  final String? granter;

  final String? grantee;

  final google_protobuf_any.Any? authorization;

  final google_protobuf_timestamp.Timestamp? expiration;

  const GrantAuthorization({
    this.granter,
    this.grantee,
    this.authorization,
    this.expiration,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    granter,
    grantee,
    authorization,
    expiration,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'granter': granter,
      'grantee': grantee,
      'authorization': authorization?.toJson(),
      'expiration': expiration?.toRfc3339(),
    };
  }

  factory GrantAuthorization.fromJson(Map<String, dynamic> json) {
    return GrantAuthorization(
      granter: json.valueAsString<String?>('granter', acceptCamelCase: true),
      grantee: json.valueAsString<String?>('grantee', acceptCamelCase: true),
      authorization: json
          .valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
            key: 'authorization',
            parse: (v) => google_protobuf_any.Any.fromJson(v),
            acceptCamelCase: true,
          ),
      expiration: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'expiration',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory GrantAuthorization.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GrantAuthorization(
      granter: decode.getString<String?>(1),
      grantee: decode.getString<String?>(2),
      authorization: decode.messageTo<google_protobuf_any.Any?>(
        3,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      expiration: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        4,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthzV1beta1GrantAuthorization;
}
