import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// DenomAuthorityMetadata specifies metadata for addresses that have specific
/// capabilities over a token factory denom. Right now there is only one Admin
/// permission, but is planned to be extended to the future.
class DenomAuthorityMetadata extends CosmosProtoMessage {
  /// Can be empty for no admin, or a valid osmosis address
  final String? admin;

  const DenomAuthorityMetadata({this.admin});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [admin];

  @override
  Map<String, dynamic> toJson() {
    return {'admin': admin};
  }

  factory DenomAuthorityMetadata.fromJson(Map<String, dynamic> json) {
    return DenomAuthorityMetadata(
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
    );
  }

  factory DenomAuthorityMetadata.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DenomAuthorityMetadata(admin: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisTokenfactoryV1beta1DenomAuthorityMetadata;
}
