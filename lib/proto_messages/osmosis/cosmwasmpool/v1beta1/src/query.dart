import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/osmosis/cosmwasmpool/v1beta1/src/params.dart"
    as osmosis_cosmwasmpool_v1beta1_params;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;

/// =============================== ContractInfoByPoolId
class ParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ParamsResponse> {
  const ParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/cosmwasmpool/v1beta1/params",
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

  factory ParamsRequest.fromJson(Map<String, dynamic> json) {
    return ParamsRequest();
  }

  factory ParamsRequest.deserialize(List<int> bytes) {
    return ParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisCosmwasmpoolV1beta1ParamsRequest;
  @override
  ParamsResponse onQueryResponse(List<int> bytes) {
    return ParamsResponse.deserialize(bytes);
  }

  @override
  ParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return ParamsResponse.fromJson(json);
  }
}

class ParamsResponse extends CosmosProtoMessage {
  final osmosis_cosmwasmpool_v1beta1_params.Params? params;

  const ParamsResponse({this.params});

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
  List<Object?> get protoValues => [params];

  @override
  Map<String, dynamic> toJson() {
    return {'params': params?.toJson()};
  }

  factory ParamsResponse.fromJson(Map<String, dynamic> json) {
    return ParamsResponse(
      params: json.valueTo<
        osmosis_cosmwasmpool_v1beta1_params.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => osmosis_cosmwasmpool_v1beta1_params.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory ParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ParamsResponse(
      params: decode.messageTo<osmosis_cosmwasmpool_v1beta1_params.Params?>(
        1,
        (b) => osmosis_cosmwasmpool_v1beta1_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisCosmwasmpoolV1beta1ParamsResponse;
}

/// =============================== Pools
class PoolsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<PoolsResponse> {
  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const PoolsRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/cosmwasmpool/v1beta1/pools",
        ),
      ],
      fields: [ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'pagination': pagination?.toJson()};
  }

  factory PoolsRequest.fromJson(Map<String, dynamic> json) {
    return PoolsRequest(
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

  factory PoolsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PoolsRequest(
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            2,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisCosmwasmpoolV1beta1PoolsRequest;
  @override
  PoolsResponse onQueryResponse(List<int> bytes) {
    return PoolsResponse.deserialize(bytes);
  }

  @override
  PoolsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return PoolsResponse.fromJson(json);
  }
}

class PoolsResponse extends CosmosProtoMessage {
  final List<google_protobuf_any.Any> pools;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const PoolsResponse({this.pools = const [], this.pagination});

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
  List<Object?> get protoValues => [pools, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'pools': pools.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory PoolsResponse.fromJson(Map<String, dynamic> json) {
    return PoolsResponse(
      pools:
          (json.valueEnsureAsList<dynamic>('pools', acceptCamelCase: true))
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

  factory PoolsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PoolsResponse(
      pools:
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
      DefaultCosmosProtoTypeUrl.osmosisCosmwasmpoolV1beta1PoolsResponse;
}

/// =============================== ContractInfoByPoolId
class ContractInfoByPoolIdRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ContractInfoByPoolIdResponse> {
  /// pool_id is the pool id of the requested pool.
  final BigInt? poolId;

  const ContractInfoByPoolIdRequest({this.poolId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/cosmwasmpool/v1beta1/contract_info",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [poolId];

  @override
  Map<String, dynamic> toJson() {
    return {'pool_id': poolId?.toString()};
  }

  factory ContractInfoByPoolIdRequest.fromJson(Map<String, dynamic> json) {
    return ContractInfoByPoolIdRequest(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
    );
  }

  factory ContractInfoByPoolIdRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ContractInfoByPoolIdRequest(poolId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisCosmwasmpoolV1beta1ContractInfoByPoolIdRequest;
  @override
  ContractInfoByPoolIdResponse onQueryResponse(List<int> bytes) {
    return ContractInfoByPoolIdResponse.deserialize(bytes);
  }

  @override
  ContractInfoByPoolIdResponse onQueryResponseJson(Map<String, dynamic> json) {
    return ContractInfoByPoolIdResponse.fromJson(json);
  }
}

class ContractInfoByPoolIdResponse extends CosmosProtoMessage {
  /// contract_address is the pool address and contract address
  /// of the requested pool id.
  final String? contractAddress;

  /// code_id is the code id of the requested pool id.
  final BigInt? codeId;

  const ContractInfoByPoolIdResponse({this.contractAddress, this.codeId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [contractAddress, codeId];

  @override
  Map<String, dynamic> toJson() {
    return {'contract_address': contractAddress, 'code_id': codeId?.toString()};
  }

  factory ContractInfoByPoolIdResponse.fromJson(Map<String, dynamic> json) {
    return ContractInfoByPoolIdResponse(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        acceptCamelCase: true,
      ),
      codeId: json.valueAsBigInt<BigInt?>('code_id', acceptCamelCase: true),
    );
  }

  factory ContractInfoByPoolIdResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ContractInfoByPoolIdResponse(
      contractAddress: decode.getString<String?>(1),
      codeId: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisCosmwasmpoolV1beta1ContractInfoByPoolIdResponse;
}

/// =============================== PoolRawFilteredState
class PoolRawFilteredStateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<PoolRawFilteredStateResponse> {
  /// pool_id is the pool id of the requested pool.
  final BigInt? poolId;

  /// key_filter is the key filter of the requested pool.
  final String? keyFilter;

  /// value_filter is the value filter of the requested pool.
  final String? valueFilter;

  const PoolRawFilteredStateRequest({
    this.poolId,
    this.keyFilter,
    this.valueFilter,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/cosmwasmpool/v1beta1/pool_raw_filtered_state",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [poolId, keyFilter, valueFilter];

  @override
  Map<String, dynamic> toJson() {
    return {
      'pool_id': poolId?.toString(),
      'key_filter': keyFilter,
      'value_filter': valueFilter,
    };
  }

  factory PoolRawFilteredStateRequest.fromJson(Map<String, dynamic> json) {
    return PoolRawFilteredStateRequest(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      keyFilter: json.valueAsString<String?>(
        'key_filter',
        acceptCamelCase: true,
      ),
      valueFilter: json.valueAsString<String?>(
        'value_filter',
        acceptCamelCase: true,
      ),
    );
  }

  factory PoolRawFilteredStateRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PoolRawFilteredStateRequest(
      poolId: decode.getBigInt<BigInt?>(1),
      keyFilter: decode.getString<String?>(2),
      valueFilter: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisCosmwasmpoolV1beta1PoolRawFilteredStateRequest;
  @override
  PoolRawFilteredStateResponse onQueryResponse(List<int> bytes) {
    return PoolRawFilteredStateResponse.deserialize(bytes);
  }

  @override
  PoolRawFilteredStateResponse onQueryResponseJson(Map<String, dynamic> json) {
    return PoolRawFilteredStateResponse.fromJson(json);
  }
}

class PoolRawFilteredStateResponse extends CosmosProtoMessage {
  /// values represents the list of values in the pool.
  final List<List<int>> values;

  const PoolRawFilteredStateResponse({this.values = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.bytes,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [values];

  @override
  Map<String, dynamic> toJson() {
    return {
      'values':
          values
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
    };
  }

  factory PoolRawFilteredStateResponse.fromJson(Map<String, dynamic> json) {
    return PoolRawFilteredStateResponse(
      values:
          (json.valueEnsureAsList<dynamic>('values', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
    );
  }

  factory PoolRawFilteredStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PoolRawFilteredStateResponse(values: decode.getListOfBytes(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisCosmwasmpoolV1beta1PoolRawFilteredStateResponse;
}
