import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// ProofOp defines an operation used for calculating Merkle root
/// The data could be arbitrary format, providing necessary data
/// for example neighbouring node hash
class ProofOp extends CosmosProtoMessage {
  final String? type;

  final List<int>? key;

  final List<int>? data;

  const ProofOp({this.type, this.key, this.data});

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
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'key': switch (key) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'data': switch (data) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory ProofOp.fromJson(Map<String, dynamic> json) {
    return ProofOp(
      type: json.valueAsString<String?>('type', acceptCamelCase: true),
      key: json.valueAsBytes<List<int>?>(
        'key',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  Map<String, dynamic> toJson() {
    return {'ops': ops.map((e) => e.toJson()).toList()};
  }

  factory ProofOps.fromJson(Map<String, dynamic> json) {
    return ProofOps(
      ops:
          (json.valueEnsureAsList<dynamic>('ops', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<ProofOp, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => ProofOp.fromJson(v),
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
