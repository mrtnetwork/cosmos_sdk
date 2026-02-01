import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'genesis_denom.dart';
import 'params.dart';

/// GenesisDenom defines a tokenfactory denom that is defined within genesis state.
/// The structure contains DenomAuthorityMetadata which defines the denom's admin.
class OsmosisTokenFactoryGenesisState extends CosmosMessage {
  final OsmosisTokenFactoryParams params;
  final List<OsmosisTokenFactoryGenesisDenom> factoryDenoms;
  OsmosisTokenFactoryGenesisState({
    required this.params,
    required List<OsmosisTokenFactoryGenesisDenom> factoryDenoms,
  }) : factoryDenoms = factoryDenoms.immutable;
  factory OsmosisTokenFactoryGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTokenFactoryGenesisState(
      params: OsmosisTokenFactoryParams.deserialize(decode.getField(1)),
      factoryDenoms:
          decode
              .getFields<List<int>>(2)
              .map((e) => OsmosisTokenFactoryGenesisDenom.deserialize(e))
              .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "params": params.toJson(),
      "factory_denoms": factoryDenoms.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisTokenFactoryV1beta1Types.genesisState;

  @override
  List get values => [params, factoryDenoms];
}
