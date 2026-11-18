import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/chain4energy/c4echain/cfedistributor/src/sub_distributor.dart"
    as chain4energy_c4echain_cfedistributor_sub_distributor;

/// Params defines the parameters for the module.
class Params extends CosmosProtoMessage {
  final List<
    chain4energy_c4echain_cfedistributor_sub_distributor.SubDistributor
  >
  subDistributors;

  const Params({this.subDistributors = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [subDistributors];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'sub_distributors':
          subDistributors.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory Params.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Params(
      subDistributors:
          (json.valueEnsureAsList<dynamic>(
                'sub_distributors',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  chain4energy_c4echain_cfedistributor_sub_distributor.SubDistributor,
                  Object
                >(
                  value: e,
                  parse:
                      (v) =>
                          chain4energy_c4echain_cfedistributor_sub_distributor
                              .SubDistributor.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                ),
              )
              .toList(),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      subDistributors:
          decode
              .getListOfBytes(1)
              .map(
                (b) => chain4energy_c4echain_cfedistributor_sub_distributor
                    .SubDistributor.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfedistributorParams;
}
