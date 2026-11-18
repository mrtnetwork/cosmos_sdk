import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Params defines the parameters for the ibc-rate-limit module.
class Params extends CosmosProtoMessage {
  final String? contractAddress;

  const Params({this.contractAddress});

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
  List<Object?> get protoValues => [contractAddress];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'contract_address': contractAddress};
  }

  factory Params.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Params(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(contractAddress: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIbcratelimitV1beta1Params;
}
