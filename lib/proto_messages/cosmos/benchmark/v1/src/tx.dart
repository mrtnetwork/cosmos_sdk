import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/benchmark/v1/src/benchmark.dart"
    as cosmos_benchmark_v1_benchmark;

/// MsgLoadTestOps defines a message containing a sequence of load test operations.
class MsgLoadTest extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgLoadTestResponse>,
        ICosmosProtoAminoMessage {
  final BuBytes? caller;

  final List<cosmos_benchmark_v1_benchmark.Op> ops;

  MsgLoadTest({List<int>? caller, this.ops = const []})
    : caller = caller?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "caller"),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/tools/benchmark/v1/MsgLoadTest",
        ),
      ],
      fields: [
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [caller, ops];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'caller': config.encodeBinary(caller),
      'ops': ops.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory MsgLoadTest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgLoadTest(
      caller: config.decodeBinary<List<int>?>(
        json.valueAs('caller', normalizeKeyLookup: config.normalizeKeys),
      ),
      ops:
          (json.valueEnsureAsList<dynamic>(
                'ops',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_benchmark_v1_benchmark.Op,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => cosmos_benchmark_v1_benchmark.Op.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory MsgLoadTest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgLoadTest(
      caller: decode.getBytes<List<int>?>(1),
      ops:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_benchmark_v1_benchmark.Op.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBenchmarkV1MsgLoadTest;
  @override
  MsgLoadTestResponse onServiceResponse(List<int> bytes) {
    return MsgLoadTestResponse.deserialize(bytes);
  }

  @override
  MsgLoadTestResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgLoadTestResponse.fromJson(json);
  }
}

/// MsgLoadTestResponse defines a message containing the results of a load test operation.
class MsgLoadTestResponse extends CosmosProtoMessage {
  final BigInt? totalTime;

  final BigInt? totalErrors;

  const MsgLoadTestResponse({this.totalTime, this.totalErrors});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [totalTime, totalErrors];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'total_time': config.encodeBigint(totalTime),
      'total_errors': config.encodeBigint(totalErrors),
    };
  }

  factory MsgLoadTestResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgLoadTestResponse(
      totalTime: json.valueAsBigInt<BigInt?>(
        'total_time',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      totalErrors: json.valueAsBigInt<BigInt?>(
        'total_errors',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgLoadTestResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgLoadTestResponse(
      totalTime: decode.getBigInt<BigInt?>(1),
      totalErrors: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBenchmarkV1MsgLoadTestResponse;
}
