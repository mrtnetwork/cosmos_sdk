import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// ClassTrace contains the base class id for ICS721 non fungible tokens and the
/// source tracing information path.
class ClassTrace extends CosmosProtoMessage {
  /// path defines the chain of port/channel identifiers used for tracing the
  /// source of the non fungible token.
  final String? path;

  /// base class id of the relayed non fungible token.
  final String? baseClassId;

  const ClassTrace({this.path, this.baseClassId});

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
  List<Object?> get protoValues => [path, baseClassId];

  @override
  Map<String, dynamic> toJson() {
    return {'path': path, 'base_class_id': baseClassId};
  }

  factory ClassTrace.fromJson(Map<String, dynamic> json) {
    return ClassTrace(
      path: json.valueAsString<String?>('path', acceptCamelCase: true),
      baseClassId: json.valueAsString<String?>(
        'base_class_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory ClassTrace.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ClassTrace(
      path: decode.getString<String?>(1),
      baseClassId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsNftTransferV1ClassTrace;
}

/// Params defines the set of IBC nft transfer parameters.
class Params extends CosmosProtoMessage {
  /// send_enabled enables or disables all cross-chain token transfers from this chain.
  final bool? sendEnabled;

  /// receive_enabled enables or disables all cross-chain token transfers to this chain.
  final bool? receiveEnabled;

  const Params({this.sendEnabled, this.receiveEnabled});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "nft-transfer/Params"),
      ],
      fields: [
        ProtoFieldConfig.bool(1, options: const []),
        ProtoFieldConfig.bool(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sendEnabled, receiveEnabled];

  @override
  Map<String, dynamic> toJson() {
    return {'send_enabled': sendEnabled, 'receive_enabled': receiveEnabled};
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      sendEnabled: json.valueAsBool<bool?>(
        'send_enabled',
        acceptCamelCase: true,
      ),
      receiveEnabled: json.valueAsBool<bool?>(
        'receive_enabled',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      sendEnabled: decode.getBool<bool?>(1),
      receiveEnabled: decode.getBool<bool?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsNftTransferV1Params;
}
