import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/evm/v1/src/chain_config.dart"
    as injective_evm_v1_chain_config;

/// TraceConfig holds extra parameters to trace functions.
class TraceConfig extends CosmosProtoMessage {
  /// DEPRECATED: DisableMemory and DisableReturnData have been renamed to
  /// Enable*.
  /// tracer is a custom javascript tracer
  final String? tracer;

  /// timeout overrides the default timeout of 5 seconds for JavaScript-based
  /// tracing calls
  final String? timeout;

  /// reexec defines the number of blocks the tracer is willing to go back
  final BigInt? reexec;

  /// disable_stack switches stack capture
  final bool? disableStack;

  /// disable_storage switches storage capture
  final bool? disableStorage;

  /// debug can be used to print output during capture end
  final bool? debug;

  /// limit defines the maximum length of output, but zero means unlimited
  final int? limit;

  /// overrides can be used to execute a trace using future fork rules
  final injective_evm_v1_chain_config.ChainConfig? overrides;

  /// enable_memory switches memory capture
  final bool? enableMemory;

  /// enable_return_data switches the capture of return data
  final bool? enableReturnData;

  /// tracer_json_config configures the tracer using a JSON string
  final String? tracerJsonConfig;

  /// temporary state modifications to Geth in order to simulate the effects of
  /// eth_call
  final List<int>? stateOverrides;

  /// block overrides block context fields encoded as json
  final List<int>? blockOverrides;

  const TraceConfig({
    this.tracer,
    this.timeout,
    this.reexec,
    this.disableStack,
    this.disableStorage,
    this.debug,
    this.limit,
    this.overrides,
    this.enableMemory,
    this.enableReturnData,
    this.tracerJsonConfig,
    this.stateOverrides,
    this.blockOverrides,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.bool(5, options: const []),
        ProtoFieldConfig.bool(6, options: const []),
        ProtoFieldConfig.bool(8),
        ProtoFieldConfig.int32(9),
        ProtoFieldConfig.message(10),
        ProtoFieldConfig.bool(11, options: const []),
        ProtoFieldConfig.bool(12, options: const []),
        ProtoFieldConfig.string(13, options: const []),
        ProtoFieldConfig.bytes(14, options: const []),
        ProtoFieldConfig.bytes(15, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
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
    tracerJsonConfig,
    stateOverrides,
    blockOverrides,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'tracer': tracer,
      'timeout': timeout,
      'reexec': reexec?.toString(),
      'disable_stack': disableStack,
      'disable_storage': disableStorage,
      'debug': debug,
      'limit': limit,
      'overrides': overrides?.toJson(),
      'enable_memory': enableMemory,
      'enable_return_data': enableReturnData,
      'tracer_json_config': tracerJsonConfig,
      'state_overrides': switch (stateOverrides) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'block_overrides': switch (blockOverrides) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory TraceConfig.fromJson(Map<String, dynamic> json) {
    return TraceConfig(
      tracer: json.valueAsString<String?>('tracer', acceptCamelCase: true),
      timeout: json.valueAsString<String?>('timeout', acceptCamelCase: true),
      reexec: json.valueAsBigInt<BigInt?>('reexec', acceptCamelCase: true),
      disableStack: json.valueAsBool<bool?>(
        'disable_stack',
        acceptCamelCase: true,
      ),
      disableStorage: json.valueAsBool<bool?>(
        'disable_storage',
        acceptCamelCase: true,
      ),
      debug: json.valueAsBool<bool?>('debug', acceptCamelCase: true),
      limit: json.valueAsInt<int?>('limit', acceptCamelCase: true),
      overrides: json.valueTo<
        injective_evm_v1_chain_config.ChainConfig?,
        Map<String, dynamic>
      >(
        key: 'overrides',
        parse: (v) => injective_evm_v1_chain_config.ChainConfig.fromJson(v),
        acceptCamelCase: true,
      ),
      enableMemory: json.valueAsBool<bool?>(
        'enable_memory',
        acceptCamelCase: true,
      ),
      enableReturnData: json.valueAsBool<bool?>(
        'enable_return_data',
        acceptCamelCase: true,
      ),
      tracerJsonConfig: json.valueAsString<String?>(
        'tracer_json_config',
        acceptCamelCase: true,
      ),
      stateOverrides: json.valueAsBytes<List<int>?>(
        'state_overrides',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      blockOverrides: json.valueAsBytes<List<int>?>(
        'block_overrides',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory TraceConfig.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TraceConfig(
      tracer: decode.getString<String?>(1),
      timeout: decode.getString<String?>(2),
      reexec: decode.getBigInt<BigInt?>(3),
      disableStack: decode.getBool<bool?>(5),
      disableStorage: decode.getBool<bool?>(6),
      debug: decode.getBool<bool?>(8),
      limit: decode.getInt<int?>(9),
      overrides: decode.messageTo<injective_evm_v1_chain_config.ChainConfig?>(
        10,
        (b) => injective_evm_v1_chain_config.ChainConfig.deserialize(b),
      ),
      enableMemory: decode.getBool<bool?>(11),
      enableReturnData: decode.getBool<bool?>(12),
      tracerJsonConfig: decode.getString<String?>(13),
      stateOverrides: decode.getBytes<List<int>?>(14),
      blockOverrides: decode.getBytes<List<int>?>(15),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1TraceConfig;
}
