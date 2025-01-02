import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/types/cosmos_enum.dart';

class OsmosisPoolManagerPoolType implements CosmosEnum {
  @override
  final String name;
  @override
  final int value;
  const OsmosisPoolManagerPoolType(this.name, this.value);

  /// Balancer is the standard xy=k curve. Its pool model is defined in x/gamm.
  static const OsmosisPoolManagerPoolType balancer =
      OsmosisPoolManagerPoolType("Balancer", 0);

  /// Stableswap is the Solidly cfmm stable swap curve. Its pool model is defined
  /// in x/gamm.
  static const OsmosisPoolManagerPoolType stableswap =
      OsmosisPoolManagerPoolType("Stableswap", 1);

  /// Concentrated is the pool model specific to concentrated liquidity. It is
  /// defined in x/concentrated-liquidity.
  static const OsmosisPoolManagerPoolType concentrated =
      OsmosisPoolManagerPoolType("Concentrated", 2);

  /// CosmWasm is the pool model specific to CosmWasm. It is defined in
  /// x/cosmwasmpool.
  static const OsmosisPoolManagerPoolType cosmWasm =
      OsmosisPoolManagerPoolType("CosmWasm", 3);

  static const List<OsmosisPoolManagerPoolType> values = [
    balancer,
    stableswap,
    concentrated,
    cosmWasm
  ];
  static OsmosisPoolManagerPoolType fromValue(int? value) {
    return values.firstWhere(
      (element) => element.value == value,
      orElse: () => throw DartCosmosSdkPluginException(
          "No OsmosisPoolManagerPoolType element found for the given value.",
          details: {"value": value}),
    );
  }

  static OsmosisPoolManagerPoolType fromName(String? name) {
    return values.firstWhere(
      (element) => element.name == name,
      orElse: () => throw DartCosmosSdkPluginException(
          "No OsmosisPoolManagerPoolType element found for the given name.",
          details: {"name": name}),
    );
  }
}
