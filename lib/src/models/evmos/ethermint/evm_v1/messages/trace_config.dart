import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/evmos/ethermint/evm_v1/messages/chain_config.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ChainConfig defines the Ethereum ChainConfig parameters
class EvmosEthermintEVMV1TraceConfig extends CosmosMessage {
  // tracer is a custom javascript tracer
  final String tracer;
  // timeout overrides the default timeout of 5 seconds for JavaScript-based tracing
  // calls
  final String timeout;
  // reexec defines the number of blocks the tracer is willing to go back
  final BigInt reexec;
  // disable_stack switches stack capture
  final bool disableStack;
  // disable_storage switches storage capture
  final bool disableStorage;
  // debug can be used to print output during capture end
  final bool debug;
  // limit defines the maximum length of output, but zero means unlimited
  final int limit;
  // overrides can be used to execute a trace using future fork rules
  final EvmosEthermintEVMV1ChainConfig overrides;
  // enable_memory switches memory capture
  final bool enableMemory;
  // enable_return_data switches the capture of return data
  final bool enableReturnData;
  // tracer_json_config configures the tracer using a JSON String
  final String tracerJsonConfig;
  factory EvmosEthermintEVMV1TraceConfig.fromJson(Map<String, dynamic> json) {
    return EvmosEthermintEVMV1TraceConfig(
        debug: json["debug"],
        disableStack: json["disable_stack"],
        disableStorage: json["disable_storage"],
        enableMemory: json["enable_memory"],
        enableReturnData: json["enable_return_data"],
        limit: IntUtils.parse(json["limit"]),
        overrides: EvmosEthermintEVMV1ChainConfig.fromJson(json["overrides"]),
        reexec: BigintUtils.parse(json["reexec"]),
        timeout: json["timeout"],
        tracer: json["tracer"],
        tracerJsonConfig: json["tracer_json_config"]);
  }
  EvmosEthermintEVMV1TraceConfig(
      {required this.tracer,
      required this.timeout,
      required this.reexec,
      required this.disableStack,
      required this.disableStorage,
      required this.debug,
      required this.limit,
      required this.overrides,
      required this.enableMemory,
      required this.enableReturnData,
      required this.tracerJsonConfig});
  factory EvmosEthermintEVMV1TraceConfig.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1TraceConfig(
      tracer: decode.getField(1),
      timeout: decode.getField(2),
      reexec: decode.getField(3),
      disableStack: decode.getField(5),
      disableStorage: decode.getField(6),
      debug: decode.getField(8),
      limit: decode.getField(9),
      overrides:
          EvmosEthermintEVMV1ChainConfig.deserialize(decode.getField(10)),
      enableMemory: decode.getField(11),
      enableReturnData: decode.getField(12),
      tracerJsonConfig: decode.getField(13),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 5, 6, 8, 9, 10, 11, 12, 13];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tracer": tracer,
      "timeout": timeout,
      "reexec": reexec,
      "disable_stack": disableStack,
      "disable_storage": disableStorage,
      "debug": debug,
      "limit": limit,
      "overrides": overrides,
      "enable_memory": enableMemory,
      "enable_return_data": enableReturnData,
      "tracer_json_config": tracerJsonConfig,
    };
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.traceConfig;

  @override
  List get values => [
        tracer,
        timeout,
        reexec,
        disableStack,
        disableStorage,
        debug,
        limit,
        overrides,
        enableMemory,
        enableReturnData,
        tracerJsonConfig
      ];
}
