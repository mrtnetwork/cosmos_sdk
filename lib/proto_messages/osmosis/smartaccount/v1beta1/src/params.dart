import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Params defines the parameters for the module.
class Params extends CosmosProtoMessage {
  /// MaximumUnauthenticatedGas defines the maximum amount of gas that can be
  /// used to authenticate a transaction in ante handler without having fee payer
  /// authenticated.
  final BigInt? maximumUnauthenticatedGas;

  /// IsSmartAccountActive defines the state of the authenticator.
  /// If set to false, the authenticator module will not be used
  /// and the classic cosmos sdk authentication will be used instead.
  final bool? isSmartAccountActive;

  /// CircuitBreakerControllers defines list of addresses that are allowed to
  /// set is_smart_account_active without going through governance.
  final List<String> circuitBreakerControllers;

  const Params({
    this.maximumUnauthenticatedGas,
    this.isSmartAccountActive,
    this.circuitBreakerControllers = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.bool(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    maximumUnauthenticatedGas,
    isSmartAccountActive,
    circuitBreakerControllers,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'maximum_unauthenticated_gas': maximumUnauthenticatedGas?.toString(),
      'is_smart_account_active': isSmartAccountActive,
      'circuit_breaker_controllers':
          circuitBreakerControllers.map((e) => e).toList(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      maximumUnauthenticatedGas: json.valueAsBigInt<BigInt?>(
        'maximum_unauthenticated_gas',
        acceptCamelCase: true,
      ),
      isSmartAccountActive: json.valueAsBool<bool?>(
        'is_smart_account_active',
        acceptCamelCase: true,
      ),
      circuitBreakerControllers:
          (json.valueEnsureAsList<dynamic>(
            'circuit_breaker_controllers',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      maximumUnauthenticatedGas: decode.getBigInt<BigInt?>(1),
      isSmartAccountActive: decode.getBool<bool?>(2),
      circuitBreakerControllers: decode.getListOrEmpty<String>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSmartaccountV1beta1Params;
}
