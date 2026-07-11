import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;

/// Grant is stored in the KVStore to record a grant with full context
class Grant extends CosmosProtoMessage {
  /// granter is the address of the user granting an allowance of their funds.
  final String? granter;

  /// grantee is the address of the user being granted an allowance of another user's funds.
  final String? grantee;

  /// allowance can be any of basic, periodic, allowed fee allowance.
  final google_protobuf_any.Any? allowance;

  const Grant({this.granter, this.grantee, this.allowance});

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

  factory Grant.fromJson(Map<String, dynamic> json) {
    return Grant(
      granter: json.valueAsString<String?>('granter', acceptCamelCase: true),
      grantee: json.valueAsString<String?>('grantee', acceptCamelCase: true),
      allowance: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'allowance',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory Grant.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Grant(
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
      DefaultCosmosProtoTypeUrl.cosmosFeegrantV1beta1Grant;
}
