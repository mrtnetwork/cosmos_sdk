import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/evmos/inflation/v1/src/inflation.dart"
    as evmos_inflation_v1_inflation;

/// Params holds parameters for the inflation module.
class Params extends CosmosProtoMessage {
  /// mint_denom specifies the type of coin to mint
  final String? mintDenom;

  /// exponential_calculation takes in the variables to calculate exponential inflation
  final evmos_inflation_v1_inflation.ExponentialCalculation?
  exponentialCalculation;

  /// inflation_distribution of the minted denom
  final evmos_inflation_v1_inflation.InflationDistribution?
  inflationDistribution;

  /// enable_inflation is the parameter that enables inflation and halts increasing the skipped_epochs
  final bool? enableInflation;

  const Params({
    this.mintDenom,
    this.exponentialCalculation,
    this.inflationDistribution,
    this.enableInflation,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.bool(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    mintDenom,
    exponentialCalculation,
    inflationDistribution,
    enableInflation,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'mint_denom': mintDenom,
      'exponential_calculation': config.encodeMessage(exponentialCalculation),
      'inflation_distribution': config.encodeMessage(inflationDistribution),
      'enable_inflation': enableInflation,
    };
  }

  factory Params.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Params(
      mintDenom: json.valueAsString<String?>(
        'mint_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      exponentialCalculation: json.valueTo<
        evmos_inflation_v1_inflation.ExponentialCalculation?,
        Object
      >(
        key: 'exponential_calculation',
        parse:
            (v) => evmos_inflation_v1_inflation.ExponentialCalculation.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      inflationDistribution: json
          .valueTo<evmos_inflation_v1_inflation.InflationDistribution?, Object>(
            key: 'inflation_distribution',
            parse:
                (v) =>
                    evmos_inflation_v1_inflation.InflationDistribution.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      enableInflation: json.valueAsBool<bool?>(
        'enable_inflation',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      mintDenom: decode.getString<String?>(1),
      exponentialCalculation: decode
          .messageTo<evmos_inflation_v1_inflation.ExponentialCalculation?>(
            2,
            (b) => evmos_inflation_v1_inflation
                .ExponentialCalculation.deserialize(b),
          ),
      inflationDistribution: decode
          .messageTo<evmos_inflation_v1_inflation.InflationDistribution?>(
            3,
            (b) => evmos_inflation_v1_inflation
                .InflationDistribution.deserialize(b),
          ),
      enableInflation: decode.getBool<bool?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosInflationV1Params;
}
