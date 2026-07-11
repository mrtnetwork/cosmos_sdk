import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/types/src/type_tx_out.dart"
    as types_type_tx_out;
import "package:cosmos_sdk/proto_messages/thorchain/types/src/type_keygen.dart"
    as types_type_keygen;

class QueryKeysignRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryKeysignResponse> {
  final String? height;

  const QueryKeysignRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/keysign/{height}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height};
  }

  factory QueryKeysignRequest.fromJson(Map<String, dynamic> json) {
    return QueryKeysignRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryKeysignRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryKeysignRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryKeysignRequest;
  @override
  QueryKeysignResponse onQueryResponse(List<int> bytes) {
    return QueryKeysignResponse.deserialize(bytes);
  }

  @override
  QueryKeysignResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryKeysignResponse.fromJson(json);
  }
}

class QueryKeysignPubkeyRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryKeysignResponse> {
  final String? height;

  final String? pubKey;

  const QueryKeysignPubkeyRequest({this.height, this.pubKey});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/keysign/{height}/{pub_key}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [height, pubKey];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height, 'pub_key': pubKey};
  }

  factory QueryKeysignPubkeyRequest.fromJson(Map<String, dynamic> json) {
    return QueryKeysignPubkeyRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
      pubKey: json.valueAsString<String?>('pub_key', acceptCamelCase: true),
    );
  }

  factory QueryKeysignPubkeyRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryKeysignPubkeyRequest(
      height: decode.getString<String?>(1),
      pubKey: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryKeysignPubkeyRequest;
  @override
  QueryKeysignResponse onQueryResponse(List<int> bytes) {
    return QueryKeysignResponse.deserialize(bytes);
  }

  @override
  QueryKeysignResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryKeysignResponse.fromJson(json);
  }
}

class QueryKeysignResponse extends CosmosProtoMessage {
  final types_type_tx_out.TxOut? keysign;

  final String? signature;

  const QueryKeysignResponse({this.keysign, this.signature});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [keysign, signature];

  @override
  Map<String, dynamic> toJson() {
    return {'keysign': keysign?.toJson(), 'signature': signature};
  }

  factory QueryKeysignResponse.fromJson(Map<String, dynamic> json) {
    return QueryKeysignResponse(
      keysign: json.valueTo<types_type_tx_out.TxOut?, Map<String, dynamic>>(
        key: 'keysign',
        parse: (v) => types_type_tx_out.TxOut.fromJson(v),
        acceptCamelCase: true,
      ),
      signature: json.valueAsString<String?>(
        'signature',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryKeysignResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryKeysignResponse(
      keysign: decode.messageTo<types_type_tx_out.TxOut?>(
        1,
        (b) => types_type_tx_out.TxOut.deserialize(b),
      ),
      signature: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryKeysignResponse;
}

class QueryKeygenRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryKeygenResponse> {
  final String? height;

  final String? pubKey;

  const QueryKeygenRequest({this.height, this.pubKey});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/keygen/{height}/{pub_key}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [height, pubKey];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height, 'pub_key': pubKey};
  }

  factory QueryKeygenRequest.fromJson(Map<String, dynamic> json) {
    return QueryKeygenRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
      pubKey: json.valueAsString<String?>('pub_key', acceptCamelCase: true),
    );
  }

  factory QueryKeygenRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryKeygenRequest(
      height: decode.getString<String?>(1),
      pubKey: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryKeygenRequest;
  @override
  QueryKeygenResponse onQueryResponse(List<int> bytes) {
    return QueryKeygenResponse.deserialize(bytes);
  }

  @override
  QueryKeygenResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryKeygenResponse.fromJson(json);
  }
}

class QueryKeygenResponse extends CosmosProtoMessage {
  final types_type_keygen.KeygenBlock? keygenBlock;

  final String? signature;

  const QueryKeygenResponse({this.keygenBlock, this.signature});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [keygenBlock, signature];

  @override
  Map<String, dynamic> toJson() {
    return {'keygen_block': keygenBlock?.toJson(), 'signature': signature};
  }

  factory QueryKeygenResponse.fromJson(Map<String, dynamic> json) {
    return QueryKeygenResponse(
      keygenBlock: json
          .valueTo<types_type_keygen.KeygenBlock?, Map<String, dynamic>>(
            key: 'keygen_block',
            parse: (v) => types_type_keygen.KeygenBlock.fromJson(v),
            acceptCamelCase: true,
          ),
      signature: json.valueAsString<String?>(
        'signature',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryKeygenResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryKeygenResponse(
      keygenBlock: decode.messageTo<types_type_keygen.KeygenBlock?>(
        1,
        (b) => types_type_keygen.KeygenBlock.deserialize(b),
      ),
      signature: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryKeygenResponse;
}
