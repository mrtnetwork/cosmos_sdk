import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryEip712TypedDataRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryEip712TypedDataResponse> {
  final List<int>? signBytes;

  const QueryEip712TypedDataRequest({this.signBytes});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/eip715/tx",
        ),
      ],
      fields: [ProtoFieldConfig.bytes(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [signBytes];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sign_bytes': switch (signBytes) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QueryEip712TypedDataRequest.fromJson(Map<String, dynamic> json) {
    return QueryEip712TypedDataRequest(
      signBytes: json.valueAsBytes<List<int>?>(
        'sign_bytes',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory QueryEip712TypedDataRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEip712TypedDataRequest(
      signBytes: decode.getBytes<List<int>?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryEip712TypedDataRequest;
  @override
  QueryEip712TypedDataResponse onQueryResponse(List<int> bytes) {
    return QueryEip712TypedDataResponse.deserialize(bytes);
  }

  @override
  QueryEip712TypedDataResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryEip712TypedDataResponse.fromJson(json);
  }
}

class QueryEip712TypedDataResponse extends CosmosProtoMessage {
  final String? typedData;

  const QueryEip712TypedDataResponse({this.typedData});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [typedData];

  @override
  Map<String, dynamic> toJson() {
    return {'typed_data': typedData};
  }

  factory QueryEip712TypedDataResponse.fromJson(Map<String, dynamic> json) {
    return QueryEip712TypedDataResponse(
      typedData: json.valueAsString<String?>(
        'typed_data',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryEip712TypedDataResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEip712TypedDataResponse(
      typedData: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryEip712TypedDataResponse;
}
