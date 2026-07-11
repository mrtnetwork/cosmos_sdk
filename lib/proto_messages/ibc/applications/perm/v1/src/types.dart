import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// ChannelState defines the channel state for the specific port-id:channel-id pair.
class ChannelState extends CosmosProtoMessage {
  final String? portId;

  final String? channelId;

  /// admin is the address that controls the channel relayers
  final String? admin;

  final List<String> relayers;

  const ChannelState({
    this.portId,
    this.channelId,
    this.admin,
    this.relayers = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [portId, channelId, admin, relayers];

  @override
  Map<String, dynamic> toJson() {
    return {
      'port_id': portId,
      'channel_id': channelId,
      'admin': admin,
      'relayers': relayers.map((e) => e).toList(),
    };
  }

  factory ChannelState.fromJson(Map<String, dynamic> json) {
    return ChannelState(
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      relayers:
          (json.valueEnsureAsList<dynamic>(
            'relayers',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory ChannelState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ChannelState(
      portId: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
      admin: decode.getString<String?>(3),
      relayers: decode.getListOrEmpty<String>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsPermV1ChannelState;
}
