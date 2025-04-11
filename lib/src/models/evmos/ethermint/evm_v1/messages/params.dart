import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';
import 'chain_config.dart';

/// Params defines the EVM module parameters
class EvmosEthermintEVMV1Params extends CosmosMessage {
  // evm_denom represents the token denomination used to run the EVM state
  // transitions.
  final String? evmDenom;
  // enable_create toggles state transitions that use the vm.Create function
  final bool? enableCreate;
  // enable_call toggles state transitions that use the vm.Call function
  final bool? enableCall;
  // extra_eips defines the additional EIPs for the vm.Config
  final List<List<int>>? extraEips;
  // chain_config defines the EVM chain configuration parameters
  final EvmosEthermintEVMV1ChainConfig? chainConfig;
  // allow_unprotected_txs defines if replay-protected (i.e non EIP155
  // signed) transactions can be executed on the state machine.
  final bool? allowUnprotectedTxs;
  factory EvmosEthermintEVMV1Params.fromJson(Map<String, dynamic> json) {
    return EvmosEthermintEVMV1Params(
        enableCall: json["enable_call"],
        allowUnprotectedTxs: json["allow_unprotected_txs"],
        chainConfig: json["chain_config"] == null
            ? null
            : EvmosEthermintEVMV1ChainConfig.fromJson(json["chain_config"]),
        enableCreate: json["enable_create"],
        evmDenom: json["evm_denom"],
        extraEips: (json["extra_eips"] as List?)
            ?.map((e) => CosmosUtils.toBytes(e))
            .toList());
  }
  EvmosEthermintEVMV1Params(
      {required this.evmDenom,
      required this.enableCreate,
      required this.enableCall,
      required this.extraEips,
      required this.chainConfig,
      required this.allowUnprotectedTxs});
  factory EvmosEthermintEVMV1Params.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1Params(
        evmDenom: decode.getField(1),
        enableCreate: decode.getField(2),
        enableCall: decode.getField(3),
        extraEips: decode.getFields<List<int>>(4),
        chainConfig: decode
            .getResult(5)
            ?.to<EvmosEthermintEVMV1ChainConfig, List<int>>(
                (e) => EvmosEthermintEVMV1ChainConfig.deserialize(e)),
        allowUnprotectedTxs: decode.getField(6));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "evm_denom": evmDenom,
      "enable_create": enableCreate,
      "enable_call": enableCall,
      "extra_eips": extraEips?.map((e) => CosmosUtils.toBase64(e)).toList(),
      "chain_config": chainConfig?.toJson(),
      "allow_unprotected_txs": allowUnprotectedTxs,
    };
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.evmV1params;

  @override
  List get values => [
        evmDenom,
        enableCreate,
        enableCall,
        extraEips,
        chainConfig,
        allowUnprotectedTxs
      ];
}
