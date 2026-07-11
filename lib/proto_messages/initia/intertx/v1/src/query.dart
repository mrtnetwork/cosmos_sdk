import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// QueryInterchainAccountRequest is the request type for the Query/InterchainAccountAddress RPC
class QueryInterchainAccountRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryInterchainAccountResponse> {
  final String? owner;

  final String? connectionId;

  const QueryInterchainAccountRequest({this.owner, this.connectionId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/inter-tx/interchain_account/owner/{owner}/connection/{connection_id}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [owner, connectionId];

  @override
  Map<String, dynamic> toJson() {
    return {'owner': owner, 'connection_id': connectionId};
  }

  factory QueryInterchainAccountRequest.fromJson(Map<String, dynamic> json) {
    return QueryInterchainAccountRequest(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      connectionId: json.valueAsString<String?>(
        'connection_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryInterchainAccountRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInterchainAccountRequest(
      owner: decode.getString<String?>(1),
      connectionId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaIntertxV1QueryInterchainAccountRequest;
  @override
  QueryInterchainAccountResponse onQueryResponse(List<int> bytes) {
    return QueryInterchainAccountResponse.deserialize(bytes);
  }

  @override
  QueryInterchainAccountResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryInterchainAccountResponse.fromJson(json);
  }
}

/// QueryInterchainAccountResponse the response type for the Query/InterchainAccountAddress RPC
class QueryInterchainAccountResponse extends CosmosProtoMessage {
  final String? interchainAccountAddress;

  const QueryInterchainAccountResponse({this.interchainAccountAddress});

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
  List<Object?> get protoValues => [interchainAccountAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'interchain_account_address': interchainAccountAddress};
  }

  factory QueryInterchainAccountResponse.fromJson(Map<String, dynamic> json) {
    return QueryInterchainAccountResponse(
      interchainAccountAddress: json.valueAsString<String?>(
        'interchain_account_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryInterchainAccountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInterchainAccountResponse(
      interchainAccountAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaIntertxV1QueryInterchainAccountResponse;
}
