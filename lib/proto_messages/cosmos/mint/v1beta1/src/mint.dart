import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Params defines the parameters for the x/mint module.
class Params extends CosmosProtoMessage {
  /// type of coin to mint
  final String? mintDenom;

  /// maximum annual change in inflation rate
  final String? inflationRateChange;

  /// maximum inflation rate
  final String? inflationMax;

  /// minimum inflation rate
  final String? inflationMin;

  /// goal of percent bonded atoms
  final String? goalBonded;

  /// expected blocks per year
  final BigInt? blocksPerYear;

  /// maximum supply for the token.
  ///
  /// A value of "0" indicates an unlimited (infinite) maximum supply.
  final String? maxSupply;

  const Params({
    this.mintDenom,
    this.inflationRateChange,
    this.inflationMax,
    this.inflationMin,
    this.goalBonded,
    this.blocksPerYear,
    this.maxSupply,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/x/mint/Params",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          4,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          5,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.uint64(6),
        ProtoFieldConfig.string(
          7,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    mintDenom,
    inflationRateChange,
    inflationMax,
    inflationMin,
    goalBonded,
    blocksPerYear,
    maxSupply,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'mint_denom': mintDenom,
      'inflation_rate_change': inflationRateChange,
      'inflation_max': inflationMax,
      'inflation_min': inflationMin,
      'goal_bonded': goalBonded,
      'blocks_per_year': blocksPerYear?.toString(),
      'max_supply': maxSupply,
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      mintDenom: json.valueAsString<String?>(
        'mint_denom',
        acceptCamelCase: true,
      ),
      inflationRateChange: json.valueAsString<String?>(
        'inflation_rate_change',
        acceptCamelCase: true,
      ),
      inflationMax: json.valueAsString<String?>(
        'inflation_max',
        acceptCamelCase: true,
      ),
      inflationMin: json.valueAsString<String?>(
        'inflation_min',
        acceptCamelCase: true,
      ),
      goalBonded: json.valueAsString<String?>(
        'goal_bonded',
        acceptCamelCase: true,
      ),
      blocksPerYear: json.valueAsBigInt<BigInt?>(
        'blocks_per_year',
        acceptCamelCase: true,
      ),
      maxSupply: json.valueAsString<String?>(
        'max_supply',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      mintDenom: decode.getString<String?>(1),
      inflationRateChange: decode.getString<String?>(2),
      inflationMax: decode.getString<String?>(3),
      inflationMin: decode.getString<String?>(4),
      goalBonded: decode.getString<String?>(5),
      blocksPerYear: decode.getBigInt<BigInt?>(6),
      maxSupply: decode.getString<String?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosMintV1beta1Params;
}
