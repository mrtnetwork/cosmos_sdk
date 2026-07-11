import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Denom holds the base denom of a Token and a trace of the chains it was sent through.
class Denom extends CosmosProtoMessage {
  /// the base token denomination
  final String? base;

  /// the trace of the token
  final List<Hop> trace;

  const Denom({this.base, this.trace = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [base, trace];

  @override
  Map<String, dynamic> toJson() {
    return {'base': base, 'trace': trace.map((e) => e.toJson()).toList()};
  }

  factory Denom.fromJson(Map<String, dynamic> json) {
    return Denom(
      base: json.valueAsString<String?>('base', acceptCamelCase: true),
      trace:
          (json.valueEnsureAsList<dynamic>('trace', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<Hop, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Hop.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory Denom.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Denom(
      base: decode.getString<String?>(1),
      trace: decode.getListOfBytes(3).map((b) => Hop.deserialize(b)).toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsTransferV1Denom;
}

/// Hop defines a port ID, channel ID pair specifying a unique "hop" in a trace
class Hop extends CosmosProtoMessage {
  final String? portId;

  final String? channelId;

  const Hop({this.portId, this.channelId});

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
  List<Object?> get protoValues => [portId, channelId];

  @override
  Map<String, dynamic> toJson() {
    return {'port_id': portId, 'channel_id': channelId};
  }

  factory Hop.fromJson(Map<String, dynamic> json) {
    return Hop(
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory Hop.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Hop(
      portId: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsTransferV1Hop;
}
