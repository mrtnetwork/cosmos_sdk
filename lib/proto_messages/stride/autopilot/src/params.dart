import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Params defines the parameters for the module.
/// next id: 1
class Params extends CosmosProtoMessage {
  /// optionally, turn off each module
  final bool? stakeibcActive;

  final bool? claimActive;

  const Params({this.stakeibcActive, this.claimActive});

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
  List<Object?> get protoValues => [stakeibcActive, claimActive];

  @override
  Map<String, dynamic> toJson() {
    return {'stakeibc_active': stakeibcActive, 'claim_active': claimActive};
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      stakeibcActive: json.valueAsBool<bool?>(
        'stakeibc_active',
        acceptCamelCase: true,
      ),
      claimActive: json.valueAsBool<bool?>(
        'claim_active',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      stakeibcActive: decode.getBool<bool?>(1),
      claimActive: decode.getBool<bool?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAutopilotParams;
}
