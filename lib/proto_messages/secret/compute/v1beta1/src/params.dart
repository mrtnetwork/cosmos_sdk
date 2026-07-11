import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Params defines the parameters for the compute module.
class Params extends CosmosProtoMessage {
  /// CompileCost is how much SDK gas we charge *per byte* for compiling WASM
  /// code.
  final String? compileCost;

  /// MaxContractSize is the maximum size of contract to store in bytes.
  final BigInt? maxContractSize;

  const Params({this.compileCost, this.maxContractSize});

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
        ProtoFieldConfig.uint64(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [compileCost, maxContractSize];

  @override
  Map<String, dynamic> toJson() {
    return {
      'compile_cost': compileCost,
      'max_contract_size': maxContractSize?.toString(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      compileCost: json.valueAsString<String?>(
        'compile_cost',
        acceptCamelCase: true,
      ),
      maxContractSize: json.valueAsBigInt<BigInt?>(
        'max_contract_size',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      compileCost: decode.getString<String?>(1),
      maxContractSize: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1Params;
}
