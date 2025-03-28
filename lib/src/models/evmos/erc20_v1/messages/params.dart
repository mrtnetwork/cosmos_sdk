import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class EvmosErc20V1Params extends CosmosMessage {
  /// enable_erc20 is the parameter to enable the conversion of Cosmos coins <--> ERC20 tokens.
  final bool? enableErc20;

  /// native_precompiles defines the slice of hex addresses of the
  /// active precompiles that are used to interact with native staking coins as ERC20s
  final List<String>? nativePrecompiles;

  /// dynamic_precompiles defines the slice of hex addresses of the
  /// active precompiles that are used to interact with Bank coins as ERC20s
  final List<String>? dynamicPrecompiles;
  EvmosErc20V1Params(
      {required this.enableErc20,
      List<String>? nativePrecompiles,
      List<String>? dynamicPrecompiles})
      : nativePrecompiles = nativePrecompiles?.immutable,
        dynamicPrecompiles = dynamicPrecompiles?.immutable;
  factory EvmosErc20V1Params.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosErc20V1Params(
        enableErc20: decode.getField(1),
        nativePrecompiles: decode.getFields<String>(3),
        dynamicPrecompiles: decode.getFields<String>(4));
  }
  factory EvmosErc20V1Params.fromJson(Map<String, dynamic> json) {
    return EvmosErc20V1Params(
        enableErc20: json.as("enable_erc20"),
        nativePrecompiles:
            json.asListOfString("native_precompiles", throwOnNull: false),
        dynamicPrecompiles:
            json.asListOfString("dynamic_precompiles", throwOnNull: false));
  }
  @override
  List get values => [enableErc20, nativePrecompiles, dynamicPrecompiles];

  @override
  List<int> get fieldIds => [1, 3, 4];

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.params;
  @override
  Map<String, dynamic> toJson() {
    return {
      "enable_erc20": enableErc20,
      "native_precompiles": nativePrecompiles,
      "dynamic_precompiles": dynamicPrecompiles
    };
  }
}
