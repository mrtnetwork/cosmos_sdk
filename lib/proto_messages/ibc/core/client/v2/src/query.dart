import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/ibc/core/client/v2/src/counterparty.dart"
    as ibc_core_client_v2_counterparty;
import "package:cosmos_sdk/proto_messages/ibc/core/client/v2/src/config.dart"
    as ibc_core_client_v2_config;

/// QueryCounterpartyInfoRequest is the request type for the Query/CounterpartyInfo RPC
/// method
class QueryCounterpartyInfoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCounterpartyInfoResponse> {
  /// client state unique identifier
  final String? clientId;

  const QueryCounterpartyInfoRequest({this.clientId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/core/client/v2/counterparty_info/{client_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [clientId];

  @override
  Map<String, dynamic> toJson() {
    return {'client_id': clientId};
  }

  factory QueryCounterpartyInfoRequest.fromJson(Map<String, dynamic> json) {
    return QueryCounterpartyInfoRequest(
      clientId: json.valueAsString<String?>('client_id', acceptCamelCase: true),
    );
  }

  factory QueryCounterpartyInfoRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCounterpartyInfoRequest(clientId: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV2QueryCounterpartyInfoRequest;
  @override
  QueryCounterpartyInfoResponse onQueryResponse(List<int> bytes) {
    return QueryCounterpartyInfoResponse.deserialize(bytes);
  }

  @override
  QueryCounterpartyInfoResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryCounterpartyInfoResponse.fromJson(json);
  }
}

/// QueryCounterpartyInfoResponse is the response type for the
/// Query/CounterpartyInfo RPC method.
class QueryCounterpartyInfoResponse extends CosmosProtoMessage {
  final ibc_core_client_v2_counterparty.CounterpartyInfo? counterpartyInfo;

  const QueryCounterpartyInfoResponse({this.counterpartyInfo});

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
  List<Object?> get protoValues => [counterpartyInfo];

  @override
  Map<String, dynamic> toJson() {
    return {'counterparty_info': counterpartyInfo?.toJson()};
  }

  factory QueryCounterpartyInfoResponse.fromJson(Map<String, dynamic> json) {
    return QueryCounterpartyInfoResponse(
      counterpartyInfo: json.valueTo<
        ibc_core_client_v2_counterparty.CounterpartyInfo?,
        Map<String, dynamic>
      >(
        key: 'counterparty_info',
        parse:
            (v) => ibc_core_client_v2_counterparty.CounterpartyInfo.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryCounterpartyInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCounterpartyInfoResponse(
      counterpartyInfo: decode
          .messageTo<ibc_core_client_v2_counterparty.CounterpartyInfo?>(
            1,
            (b) =>
                ibc_core_client_v2_counterparty.CounterpartyInfo.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV2QueryCounterpartyInfoResponse;
}

/// QueryConfigRequest is the request type for the Query/Config RPC method
class QueryConfigRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryConfigResponse> {
  /// client state unique identifier
  final String? clientId;

  const QueryConfigRequest({this.clientId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/core/client/v2/config/{client_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [clientId];

  @override
  Map<String, dynamic> toJson() {
    return {'client_id': clientId};
  }

  factory QueryConfigRequest.fromJson(Map<String, dynamic> json) {
    return QueryConfigRequest(
      clientId: json.valueAsString<String?>('client_id', acceptCamelCase: true),
    );
  }

  factory QueryConfigRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConfigRequest(clientId: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV2QueryConfigRequest;
  @override
  QueryConfigResponse onQueryResponse(List<int> bytes) {
    return QueryConfigResponse.deserialize(bytes);
  }

  @override
  QueryConfigResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryConfigResponse.fromJson(json);
  }
}

/// QueryConfigResponse is the response type for the Query/Config RPC method
class QueryConfigResponse extends CosmosProtoMessage {
  final ibc_core_client_v2_config.Config? config;

  const QueryConfigResponse({this.config});

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
  List<Object?> get protoValues => [config];

  @override
  Map<String, dynamic> toJson() {
    return {'config': config?.toJson()};
  }

  factory QueryConfigResponse.fromJson(Map<String, dynamic> json) {
    return QueryConfigResponse(
      config: json
          .valueTo<ibc_core_client_v2_config.Config?, Map<String, dynamic>>(
            key: 'config',
            parse: (v) => ibc_core_client_v2_config.Config.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryConfigResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConfigResponse(
      config: decode.messageTo<ibc_core_client_v2_config.Config?>(
        1,
        (b) => ibc_core_client_v2_config.Config.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV2QueryConfigResponse;
}
