import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// this line is used by starport scaffolding # genesis/proto/state
class GenesisVestingType extends CosmosProtoMessage {
  /// vesting type name
  final String? name;

  /// period of locked coins from vesting start
  final BigInt? lockupPeriod;

  final String? lockupPeriodUnit;

  /// period of veesting coins from lockup period end
  final BigInt? vestingPeriod;

  final String? vestingPeriodUnit;

  final String? free;

  const GenesisVestingType({
    this.name,
    this.lockupPeriod,
    this.lockupPeriodUnit,
    this.vestingPeriod,
    this.vestingPeriodUnit,
    this.free,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.string(6, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    name,
    lockupPeriod,
    lockupPeriodUnit,
    vestingPeriod,
    vestingPeriodUnit,
    free,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lockup_period': lockupPeriod?.toString(),
      'lockup_period_unit': lockupPeriodUnit,
      'vesting_period': vestingPeriod?.toString(),
      'vesting_period_unit': vestingPeriodUnit,
      'free': free,
    };
  }

  factory GenesisVestingType.fromJson(Map<String, dynamic> json) {
    return GenesisVestingType(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      lockupPeriod: json.valueAsBigInt<BigInt?>(
        'lockup_period',
        acceptCamelCase: true,
      ),
      lockupPeriodUnit: json.valueAsString<String?>(
        'lockup_period_unit',
        acceptCamelCase: true,
      ),
      vestingPeriod: json.valueAsBigInt<BigInt?>(
        'vesting_period',
        acceptCamelCase: true,
      ),
      vestingPeriodUnit: json.valueAsString<String?>(
        'vesting_period_unit',
        acceptCamelCase: true,
      ),
      free: json.valueAsString<String?>('free', acceptCamelCase: true),
    );
  }

  factory GenesisVestingType.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GenesisVestingType(
      name: decode.getString<String?>(1),
      lockupPeriod: decode.getBigInt<BigInt?>(2),
      lockupPeriodUnit: decode.getString<String?>(3),
      vestingPeriod: decode.getBigInt<BigInt?>(4),
      vestingPeriodUnit: decode.getString<String?>(5),
      free: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingGenesisVestingType;
}
