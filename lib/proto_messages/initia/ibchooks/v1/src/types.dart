import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Params defines the set of hook parameters.
class Params extends CosmosProtoMessage {
  /// if the ACL of a address is not set,
  /// then we use this value to decide the ACL.
  final bool? defaultAllowed;

  const Params({this.defaultAllowed});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "ibchooks/Params"),
      ],
      fields: [ProtoFieldConfig.bool(1)],
    );
  }

  @override
  List<Object?> get protoValues => [defaultAllowed];

  @override
  Map<String, dynamic> toJson() {
    return {'default_allowed': defaultAllowed};
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      defaultAllowed: json.valueAsBool<bool?>(
        'default_allowed',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(defaultAllowed: decode.getBool<bool?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaIbchooksV1Params;
}

/// ACL defines the ACL entry of an address.
class Acl extends CosmosProtoMessage {
  final String? address;

  final bool? allowed;

  const Acl({this.address, this.allowed});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.bool(2)],
    );
  }

  @override
  List<Object?> get protoValues => [address, allowed];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address, 'allowed': allowed};
  }

  factory Acl.fromJson(Map<String, dynamic> json) {
    return Acl(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      allowed: json.valueAsBool<bool?>('allowed', acceptCamelCase: true),
    );
  }

  factory Acl.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Acl(
      address: decode.getString<String?>(1),
      allowed: decode.getBool<bool?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaIbchooksV1Acl;
}
