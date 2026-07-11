import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Params defines the set of IBC transfer parameters.
/// NOTE: To prevent a single token from being transferred, set the
/// TransfersEnabled parameter to true and then set the bank module's SendEnabled
/// parameter for the denomination to false.
class Params extends CosmosProtoMessage {
  /// send_enabled enables or disables all cross-chain token transfers from this
  /// chain.
  final bool? sendEnabled;

  /// receive_enabled enables or disables all cross-chain token transfers to this
  /// chain.
  final bool? receiveEnabled;

  const Params({this.sendEnabled, this.receiveEnabled});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bool(1), ProtoFieldConfig.bool(2)],
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
      DefaultCosmosProtoTypeUrl.ibcApplicationsTransferV1Params;
}
