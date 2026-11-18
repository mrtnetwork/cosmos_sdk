import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// ProofOp defines an operation used for calculating Merkle root
/// The data could be arbitrary format, providing necessary data
/// for example neighbouring node hash
class ProofOp extends CosmosProtoMessage {
  final String? type;

  final BuBytes? key;

  final BuBytes? data;

  ProofOp({this.type, List<int>? key, List<int>? data})
    : key = key?.asImmutableBytes,
      data = data?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.bytes(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [type, key, data];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'type': type,
      'key': config.encodeBinary(key),
      'data': config.encodeBinary(data),
    };
  }

  factory ProofOp.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ProofOp(
      type: json.valueAsString<String?>(
        'type',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      key: config.decodeBinary<List<int>?>(
        json.valueAs('key', normalizeKeyLookup: config.normalizeKeys),
      ),
      data: config.decodeBinary<List<int>?>(
        json.valueAs('data', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory ProofOp.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ProofOp(
      type: decode.getString<String?>(1),
      key: decode.getBytes<List<int>?>(2),
      data: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintCryptoProofOp;
}

/// ProofOps is Merkle proof defined by the list of ProofOps
class ProofOps extends CosmosProtoMessage {
  final List<ProofOp> ops;

  const ProofOps({this.ops = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [ops];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'ops': ops.map((e) => config.encodeMessage(e)).toList()};
  }

  factory ProofOps.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ProofOps(
      ops:
          (json.valueEnsureAsList<dynamic>(
                'ops',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<ProofOp, Object>(
                  value: e,
                  parse:
                      (v) => ProofOp.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory ProofOps.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ProofOps(
      ops: decode.getListOfBytes(1).map((b) => ProofOp.deserialize(b)).toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintCryptoProofOps;
}
