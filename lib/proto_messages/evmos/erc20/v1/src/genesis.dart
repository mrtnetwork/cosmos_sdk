import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Params defines the erc20 module params
class Params extends CosmosProtoMessage {
  /// enable_erc20 is the parameter to enable the conversion of Cosmos coins <--> ERC20 tokens.
  final bool? enableErc20;

  /// enable_evm_hook is now depecrated
  /// native_precompiles defines the slice of hex addresses of the
  /// active precompiles that are used to interact with native staking coins as ERC20s
  final List<String> nativePrecompiles;

  /// dynamic_precompiles defines the slice of hex addresses of the
  /// active precompiles that are used to interact with Bank coins as ERC20s
  final List<String> dynamicPrecompiles;

  const Params({
    this.enableErc20,
    this.nativePrecompiles = const [],
    this.dynamicPrecompiles = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bool(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    enableErc20,
    nativePrecompiles,
    dynamicPrecompiles,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'enable_erc20': enableErc20,
      'native_precompiles': nativePrecompiles.map((e) => e).toList(),
      'dynamic_precompiles': dynamicPrecompiles.map((e) => e).toList(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      enableErc20: json.valueAsBool<bool?>(
        'enable_erc20',
        acceptCamelCase: true,
      ),
      nativePrecompiles:
          (json.valueEnsureAsList<dynamic>(
            'native_precompiles',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      dynamicPrecompiles:
          (json.valueEnsureAsList<dynamic>(
            'dynamic_precompiles',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      enableErc20: decode.getBool<bool?>(1),
      nativePrecompiles: decode.getListOrEmpty<String>(3),
      dynamicPrecompiles: decode.getListOrEmpty<String>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosErc20V1Params;
}
