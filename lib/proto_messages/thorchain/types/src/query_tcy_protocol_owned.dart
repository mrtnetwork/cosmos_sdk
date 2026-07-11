import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryTCYProtocolOwnedRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTCYProtocolOwnedResponse> {
  final String? height;

  const QueryTCYProtocolOwnedRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/tcy_protocol_owned",
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

  factory QueryTCYProtocolOwnedRequest.fromJson(Map<String, dynamic> json) {
    return QueryTCYProtocolOwnedRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryTCYProtocolOwnedRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTCYProtocolOwnedRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTCYProtocolOwnedRequest;
  @override
  QueryTCYProtocolOwnedResponse onQueryResponse(List<int> bytes) {
    return QueryTCYProtocolOwnedResponse.deserialize(bytes);
  }

  @override
  QueryTCYProtocolOwnedResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTCYProtocolOwnedResponse.fromJson(json);
  }
}

class QueryTCYProtocolOwnedResponse extends CosmosProtoMessage {
  final String? amount;

  const QueryTCYProtocolOwnedResponse({this.amount});

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
  List<Object?> get protoValues => [amount];

  @override
  Map<String, dynamic> toJson() {
    return {'amount': amount};
  }

  factory QueryTCYProtocolOwnedResponse.fromJson(Map<String, dynamic> json) {
    return QueryTCYProtocolOwnedResponse(
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
    );
  }

  factory QueryTCYProtocolOwnedResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTCYProtocolOwnedResponse(amount: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTCYProtocolOwnedResponse;
}
