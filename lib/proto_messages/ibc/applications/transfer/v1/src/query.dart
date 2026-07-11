import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/ibc/applications/transfer/v1/src/transfer.dart"
    as ibc_applications_transfer_v1_transfer;
import "package:cosmos_sdk/proto_messages/ibc/applications/transfer/v1/src/token.dart"
    as ibc_applications_transfer_v1_token;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// QueryParamsRequest is the request type for the Query/Params RPC method.
class QueryParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryParamsResponse> {
  const QueryParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/apps/transfer/v1/params",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryParamsRequest.fromJson(Map<String, dynamic> json) {
    return QueryParamsRequest();
  }

  factory QueryParamsRequest.deserialize(List<int> bytes) {
    return QueryParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsTransferV1QueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

/// QueryParamsResponse is the response type for the Query/Params RPC method.
class QueryParamsResponse extends CosmosProtoMessage {
  /// params defines the parameters of the module.
  final ibc_applications_transfer_v1_transfer.Params? params;

  const QueryParamsResponse({this.params});

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
  List<Object?> get protoValues => [params];

  @override
  Map<String, dynamic> toJson() {
    return {'params': params?.toJson()};
  }

  factory QueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryParamsResponse(
      params: json.valueTo<
        ibc_applications_transfer_v1_transfer.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => ibc_applications_transfer_v1_transfer.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<ibc_applications_transfer_v1_transfer.Params?>(
        1,
        (b) => ibc_applications_transfer_v1_transfer.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsTransferV1QueryParamsResponse;
}

/// QueryDenomRequest is the request type for the Query/Denom RPC
/// method
class QueryDenomRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDenomResponse> {
  /// hash (in hex format) or denom (full denom with ibc prefix) of the on chain denomination.
  final String? hash;

  const QueryDenomRequest({this.hash});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/apps/transfer/v1/denoms/{hash=**}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [hash];

  @override
  Map<String, dynamic> toJson() {
    return {'hash': hash};
  }

  factory QueryDenomRequest.fromJson(Map<String, dynamic> json) {
    return QueryDenomRequest(
      hash: json.valueAsString<String?>('hash', acceptCamelCase: true),
    );
  }

  factory QueryDenomRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomRequest(hash: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsTransferV1QueryDenomRequest;
  @override
  QueryDenomResponse onQueryResponse(List<int> bytes) {
    return QueryDenomResponse.deserialize(bytes);
  }

  @override
  QueryDenomResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDenomResponse.fromJson(json);
  }
}

/// QueryDenomResponse is the response type for the Query/Denom RPC
/// method.
class QueryDenomResponse extends CosmosProtoMessage {
  /// denom returns the requested denomination.
  final ibc_applications_transfer_v1_token.Denom? denom;

  const QueryDenomResponse({this.denom});

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
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom?.toJson()};
  }

  factory QueryDenomResponse.fromJson(Map<String, dynamic> json) {
    return QueryDenomResponse(
      denom: json.valueTo<
        ibc_applications_transfer_v1_token.Denom?,
        Map<String, dynamic>
      >(
        key: 'denom',
        parse: (v) => ibc_applications_transfer_v1_token.Denom.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomResponse(
      denom: decode.messageTo<ibc_applications_transfer_v1_token.Denom?>(
        1,
        (b) => ibc_applications_transfer_v1_token.Denom.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsTransferV1QueryDenomResponse;
}

/// QueryDenomsRequest is the request type for the Query/Denoms RPC
/// method
class QueryDenomsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDenomsResponse> {
  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryDenomsRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/apps/transfer/v1/denoms",
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

  factory QueryDenomsRequest.fromJson(Map<String, dynamic> json) {
    return QueryDenomsRequest(
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

  factory QueryDenomsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomsRequest(
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
      DefaultCosmosProtoTypeUrl.ibcApplicationsTransferV1QueryDenomsRequest;
  @override
  QueryDenomsResponse onQueryResponse(List<int> bytes) {
    return QueryDenomsResponse.deserialize(bytes);
  }

  @override
  QueryDenomsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDenomsResponse.fromJson(json);
  }
}

/// QueryDenomsResponse is the response type for the Query/Denoms RPC
/// method.
class QueryDenomsResponse extends CosmosProtoMessage {
  /// denoms returns all denominations.
  final List<ibc_applications_transfer_v1_token.Denom> denoms;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryDenomsResponse({this.denoms = const [], this.pagination});

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
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [denoms, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'denoms': denoms.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryDenomsResponse.fromJson(Map<String, dynamic> json) {
    return QueryDenomsResponse(
      denoms:
          (json.valueEnsureAsList<dynamic>('denoms', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  ibc_applications_transfer_v1_token.Denom,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          ibc_applications_transfer_v1_token.Denom.fromJson(v),
                ),
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

  factory QueryDenomsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomsResponse(
      denoms:
          decode
              .getListOfBytes(1)
              .map(
                (b) => ibc_applications_transfer_v1_token.Denom.deserialize(b),
              )
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
      DefaultCosmosProtoTypeUrl.ibcApplicationsTransferV1QueryDenomsResponse;
}

/// QueryDenomHashRequest is the request type for the Query/DenomHash RPC
/// method
class QueryDenomHashRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDenomHashResponse> {
  /// The denomination trace ([port_id]/[channel_id])+/[denom]
  final String? trace;

  const QueryDenomHashRequest({this.trace});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/apps/transfer/v1/denom_hashes/{trace=**}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [trace];

  @override
  Map<String, dynamic> toJson() {
    return {'trace': trace};
  }

  factory QueryDenomHashRequest.fromJson(Map<String, dynamic> json) {
    return QueryDenomHashRequest(
      trace: json.valueAsString<String?>('trace', acceptCamelCase: true),
    );
  }

  factory QueryDenomHashRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomHashRequest(trace: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsTransferV1QueryDenomHashRequest;
  @override
  QueryDenomHashResponse onQueryResponse(List<int> bytes) {
    return QueryDenomHashResponse.deserialize(bytes);
  }

  @override
  QueryDenomHashResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDenomHashResponse.fromJson(json);
  }
}

/// QueryDenomHashResponse is the response type for the Query/DenomHash RPC
/// method.
class QueryDenomHashResponse extends CosmosProtoMessage {
  /// hash (in hex format) of the denomination trace information.
  final String? hash;

  const QueryDenomHashResponse({this.hash});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [hash];

  @override
  Map<String, dynamic> toJson() {
    return {'hash': hash};
  }

  factory QueryDenomHashResponse.fromJson(Map<String, dynamic> json) {
    return QueryDenomHashResponse(
      hash: json.valueAsString<String?>('hash', acceptCamelCase: true),
    );
  }

  factory QueryDenomHashResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomHashResponse(hash: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsTransferV1QueryDenomHashResponse;
}

/// QueryEscrowAddressRequest is the request type for the EscrowAddress RPC method.
class QueryEscrowAddressRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryEscrowAddressResponse> {
  /// unique port identifier
  final String? portId;

  /// unique channel identifier
  final String? channelId;

  const QueryEscrowAddressRequest({this.portId, this.channelId});

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
              "/ibc/apps/transfer/v1/channels/{channel_id}/ports/{port_id}/escrow_address",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [portId, channelId];

  @override
  Map<String, dynamic> toJson() {
    return {'port_id': portId, 'channel_id': channelId};
  }

  factory QueryEscrowAddressRequest.fromJson(Map<String, dynamic> json) {
    return QueryEscrowAddressRequest(
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryEscrowAddressRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEscrowAddressRequest(
      portId: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsTransferV1QueryEscrowAddressRequest;
  @override
  QueryEscrowAddressResponse onQueryResponse(List<int> bytes) {
    return QueryEscrowAddressResponse.deserialize(bytes);
  }

  @override
  QueryEscrowAddressResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryEscrowAddressResponse.fromJson(json);
  }
}

/// QueryEscrowAddressResponse is the response type of the EscrowAddress RPC method.
class QueryEscrowAddressResponse extends CosmosProtoMessage {
  /// the escrow account address
  final String? escrowAddress;

  const QueryEscrowAddressResponse({this.escrowAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [escrowAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'escrow_address': escrowAddress};
  }

  factory QueryEscrowAddressResponse.fromJson(Map<String, dynamic> json) {
    return QueryEscrowAddressResponse(
      escrowAddress: json.valueAsString<String?>(
        'escrow_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryEscrowAddressResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEscrowAddressResponse(
      escrowAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsTransferV1QueryEscrowAddressResponse;
}

/// QueryTotalEscrowForDenomRequest is the request type for TotalEscrowForDenom RPC method.
class QueryTotalEscrowForDenomRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTotalEscrowForDenomResponse> {
  final String? denom;

  const QueryTotalEscrowForDenomRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/apps/transfer/v1/total_escrow/{denom=**}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory QueryTotalEscrowForDenomRequest.fromJson(Map<String, dynamic> json) {
    return QueryTotalEscrowForDenomRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QueryTotalEscrowForDenomRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTotalEscrowForDenomRequest(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsTransferV1QueryTotalEscrowForDenomRequest;
  @override
  QueryTotalEscrowForDenomResponse onQueryResponse(List<int> bytes) {
    return QueryTotalEscrowForDenomResponse.deserialize(bytes);
  }

  @override
  QueryTotalEscrowForDenomResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryTotalEscrowForDenomResponse.fromJson(json);
  }
}

/// QueryTotalEscrowForDenomResponse is the response type for TotalEscrowForDenom RPC method.
class QueryTotalEscrowForDenomResponse extends CosmosProtoMessage {
  final cosmos_base_v1beta1_coin.Coin? amount;

  const QueryTotalEscrowForDenomResponse({this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [amount];

  @override
  Map<String, dynamic> toJson() {
    return {'amount': amount?.toJson()};
  }

  factory QueryTotalEscrowForDenomResponse.fromJson(Map<String, dynamic> json) {
    return QueryTotalEscrowForDenomResponse(
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryTotalEscrowForDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTotalEscrowForDenomResponse(
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        1,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsTransferV1QueryTotalEscrowForDenomResponse;
}
