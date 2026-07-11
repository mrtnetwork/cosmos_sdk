import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;

/// QueryEvidenceRequest is the request type for the Query/Evidence RPC method.
class QueryEvidenceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryEvidenceResponse> {
  /// evidence_hash defines the hash of the requested evidence.
  /// Deprecated: Use hash, a HEX encoded string, instead.
  final List<int>? evidenceHash;

  /// hash defines the evidence hash of the requested evidence.
  final String? hash;

  const QueryEvidenceRequest({this.evidenceHash, this.hash});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/evidence/v1beta1/evidence/{hash}",
        ),
      ],
      fields: [
        ProtoFieldConfig.bytes(
          1,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.string(
          2,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.47",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [evidenceHash, hash];

  @override
  Map<String, dynamic> toJson() {
    return {
      'evidence_hash': switch (evidenceHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'hash': hash,
    };
  }

  factory QueryEvidenceRequest.fromJson(Map<String, dynamic> json) {
    return QueryEvidenceRequest(
      evidenceHash: json.valueAsBytes<List<int>?>(
        'evidence_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      hash: json.valueAsString<String?>('hash', acceptCamelCase: true),
    );
  }

  factory QueryEvidenceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEvidenceRequest(
      evidenceHash: decode.getBytes<List<int>?>(1),
      hash: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosEvidenceV1beta1QueryEvidenceRequest;
  @override
  QueryEvidenceResponse onQueryResponse(List<int> bytes) {
    return QueryEvidenceResponse.deserialize(bytes);
  }

  @override
  QueryEvidenceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryEvidenceResponse.fromJson(json);
  }
}

/// QueryEvidenceResponse is the response type for the Query/Evidence RPC method.
class QueryEvidenceResponse extends CosmosProtoMessage {
  /// evidence returns the requested evidence.
  final google_protobuf_any.Any? evidence;

  const QueryEvidenceResponse({this.evidence});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [evidence];

  @override
  Map<String, dynamic> toJson() {
    return {'evidence': evidence?.toJson()};
  }

  factory QueryEvidenceResponse.fromJson(Map<String, dynamic> json) {
    return QueryEvidenceResponse(
      evidence: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'evidence',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryEvidenceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEvidenceResponse(
      evidence: decode.messageTo<google_protobuf_any.Any?>(
        1,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosEvidenceV1beta1QueryEvidenceResponse;
}

/// QueryEvidenceRequest is the request type for the Query/AllEvidence RPC
/// method.
class QueryAllEvidenceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllEvidenceResponse> {
  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryAllEvidenceRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/evidence/v1beta1/evidence",
        ),
      ],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'pagination': pagination?.toJson()};
  }

  factory QueryAllEvidenceRequest.fromJson(Map<String, dynamic> json) {
    return QueryAllEvidenceRequest(
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryAllEvidenceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllEvidenceRequest(
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            1,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosEvidenceV1beta1QueryAllEvidenceRequest;
  @override
  QueryAllEvidenceResponse onQueryResponse(List<int> bytes) {
    return QueryAllEvidenceResponse.deserialize(bytes);
  }

  @override
  QueryAllEvidenceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAllEvidenceResponse.fromJson(json);
  }
}

/// QueryAllEvidenceResponse is the response type for the Query/AllEvidence RPC
/// method.
class QueryAllEvidenceResponse extends CosmosProtoMessage {
  /// evidence returns all evidences.
  final List<google_protobuf_any.Any> evidence;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryAllEvidenceResponse({this.evidence = const [], this.pagination});

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
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [evidence, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'evidence': evidence.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryAllEvidenceResponse.fromJson(Map<String, dynamic> json) {
    return QueryAllEvidenceResponse(
      evidence:
          (json.valueEnsureAsList<dynamic>('evidence', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  google_protobuf_any.Any,
                  Map<String, dynamic>
                >(value: e, parse: (v) => google_protobuf_any.Any.fromJson(v)),
              )
              .toList(),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) =>
                cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryAllEvidenceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllEvidenceResponse(
      evidence:
          decode
              .getListOfBytes(1)
              .map((b) => google_protobuf_any.Any.deserialize(b))
              .toList(),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        2,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosEvidenceV1beta1QueryAllEvidenceResponse;
}
