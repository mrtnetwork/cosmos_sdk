import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Params defines the parameters for the dynamicfee module.
class Params extends CosmosProtoMessage {
  final String? baseGasPrice;

  final String? minBaseGasPrice;

  final String? maxBaseGasPrice;

  final String? maxChangeRate;

  final BigInt? targetGas;

  const Params({
    this.baseGasPrice,
    this.minBaseGasPrice,
    this.maxBaseGasPrice,
    this.maxChangeRate,
    this.targetGas,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
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
        ProtoFieldConfig.int64(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    baseGasPrice,
    minBaseGasPrice,
    maxBaseGasPrice,
    maxChangeRate,
    targetGas,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'base_gas_price': baseGasPrice,
      'min_base_gas_price': minBaseGasPrice,
      'max_base_gas_price': maxBaseGasPrice,
      'max_change_rate': maxChangeRate,
      'target_gas': targetGas?.toString(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      baseGasPrice: json.valueAsString<String?>(
        'base_gas_price',
        acceptCamelCase: true,
      ),
      minBaseGasPrice: json.valueAsString<String?>(
        'min_base_gas_price',
        acceptCamelCase: true,
      ),
      maxBaseGasPrice: json.valueAsString<String?>(
        'max_base_gas_price',
        acceptCamelCase: true,
      ),
      maxChangeRate: json.valueAsString<String?>(
        'max_change_rate',
        acceptCamelCase: true,
      ),
      targetGas: json.valueAsBigInt<BigInt?>(
        'target_gas',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      baseGasPrice: decode.getString<String?>(1),
      minBaseGasPrice: decode.getString<String?>(2),
      maxBaseGasPrice: decode.getString<String?>(3),
      maxChangeRate: decode.getString<String?>(4),
      targetGas: decode.getBigInt<BigInt?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaDynamicfeeV1Params;
}
