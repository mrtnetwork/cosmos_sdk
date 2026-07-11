import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/stratos/register/v1/src/register.dart"
    as stratos_register_v1_register;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/cosmos/staking/v1beta1/src/staking.dart"
    as cosmos_staking_v1beta1_staking;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;

/// QueryResourceNodeRequest is request type for the Query/ResourceNode RPC method
class QueryResourceNodeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryResourceNodeResponse> {
  /// network_addr defines the node network address to query for.
  final String? networkAddr;

  const QueryResourceNodeRequest({this.networkAddr});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/register/v1/resource_node/{network_addr}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [networkAddr];

  @override
  Map<String, dynamic> toJson() {
    return {'network_addr': networkAddr};
  }

  factory QueryResourceNodeRequest.fromJson(Map<String, dynamic> json) {
    return QueryResourceNodeRequest(
      networkAddr: json.valueAsString<String?>(
        'network_addr',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryResourceNodeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryResourceNodeRequest(networkAddr: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1QueryResourceNodeRequest;
  @override
  QueryResourceNodeResponse onQueryResponse(List<int> bytes) {
    return QueryResourceNodeResponse.deserialize(bytes);
  }

  @override
  QueryResourceNodeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryResourceNodeResponse.fromJson(json);
  }
}

/// QueryResourceNodeResponse is response type for the Query/ResourceNode RPC method
class QueryResourceNodeResponse extends CosmosProtoMessage {
  /// node defines the the resourceNode info.
  final stratos_register_v1_register.ResourceNode? node;

  const QueryResourceNodeResponse({this.node});

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
  List<Object?> get protoValues => [node];

  @override
  Map<String, dynamic> toJson() {
    return {'node': node?.toJson()};
  }

  factory QueryResourceNodeResponse.fromJson(Map<String, dynamic> json) {
    return QueryResourceNodeResponse(
      node: json.valueTo<
        stratos_register_v1_register.ResourceNode?,
        Map<String, dynamic>
      >(
        key: 'node',
        parse: (v) => stratos_register_v1_register.ResourceNode.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryResourceNodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryResourceNodeResponse(
      node: decode.messageTo<stratos_register_v1_register.ResourceNode?>(
        1,
        (b) => stratos_register_v1_register.ResourceNode.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1QueryResourceNodeResponse;
}

/// QueryMetaNodeRequest is request type for the Query/MetaNode RPC method
class QueryMetaNodeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryMetaNodeResponse> {
  /// network_addr defines the node network address to query for.
  final String? networkAddr;

  const QueryMetaNodeRequest({this.networkAddr});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/register/v1/meta_node/{network_addr}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [networkAddr];

  @override
  Map<String, dynamic> toJson() {
    return {'network_addr': networkAddr};
  }

  factory QueryMetaNodeRequest.fromJson(Map<String, dynamic> json) {
    return QueryMetaNodeRequest(
      networkAddr: json.valueAsString<String?>(
        'network_addr',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryMetaNodeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMetaNodeRequest(networkAddr: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1QueryMetaNodeRequest;
  @override
  QueryMetaNodeResponse onQueryResponse(List<int> bytes) {
    return QueryMetaNodeResponse.deserialize(bytes);
  }

  @override
  QueryMetaNodeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryMetaNodeResponse.fromJson(json);
  }
}

/// QueryMetaNodeResponse is response type for the Query/MetaNode RPC method
class QueryMetaNodeResponse extends CosmosProtoMessage {
  /// node defines the the meta info.
  final stratos_register_v1_register.MetaNode? node;

  const QueryMetaNodeResponse({this.node});

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
  List<Object?> get protoValues => [node];

  @override
  Map<String, dynamic> toJson() {
    return {'node': node?.toJson()};
  }

  factory QueryMetaNodeResponse.fromJson(Map<String, dynamic> json) {
    return QueryMetaNodeResponse(
      node: json.valueTo<
        stratos_register_v1_register.MetaNode?,
        Map<String, dynamic>
      >(
        key: 'node',
        parse: (v) => stratos_register_v1_register.MetaNode.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryMetaNodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMetaNodeResponse(
      node: decode.messageTo<stratos_register_v1_register.MetaNode?>(
        1,
        (b) => stratos_register_v1_register.MetaNode.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1QueryMetaNodeResponse;
}

/// QueryDepositByNodeRequest is request type for the Query/DepositByNode RPC method
class QueryDepositByNodeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDepositByNodeResponse> {
  /// network_addr defines the node network address to query for.
  final String? networkAddr;

  final int? queryType;

  const QueryDepositByNodeRequest({this.networkAddr, this.queryType});

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
              "/stratos/register/v1/deposit_by_node/{network_addr}/{query_type}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.uint32(2)],
    );
  }

  @override
  List<Object?> get protoValues => [networkAddr, queryType];

  @override
  Map<String, dynamic> toJson() {
    return {'network_addr': networkAddr, 'query_type': queryType};
  }

  factory QueryDepositByNodeRequest.fromJson(Map<String, dynamic> json) {
    return QueryDepositByNodeRequest(
      networkAddr: json.valueAsString<String?>(
        'network_addr',
        acceptCamelCase: true,
      ),
      queryType: json.valueAsInt<int?>('query_type', acceptCamelCase: true),
    );
  }

  factory QueryDepositByNodeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDepositByNodeRequest(
      networkAddr: decode.getString<String?>(1),
      queryType: decode.getInt<int?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1QueryDepositByNodeRequest;
  @override
  QueryDepositByNodeResponse onQueryResponse(List<int> bytes) {
    return QueryDepositByNodeResponse.deserialize(bytes);
  }

  @override
  QueryDepositByNodeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDepositByNodeResponse.fromJson(json);
  }
}

/// QueryDepositByNodeResponse is response type for the Query/DepositByNode RPC method
class QueryDepositByNodeResponse extends CosmosProtoMessage {
  /// deposit_info defines the the deposit info of the node.
  final DepositInfo? depositInfo;

  const QueryDepositByNodeResponse({this.depositInfo});

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
  List<Object?> get protoValues => [depositInfo];

  @override
  Map<String, dynamic> toJson() {
    return {'deposit_info': depositInfo?.toJson()};
  }

  factory QueryDepositByNodeResponse.fromJson(Map<String, dynamic> json) {
    return QueryDepositByNodeResponse(
      depositInfo: json.valueTo<DepositInfo?, Map<String, dynamic>>(
        key: 'deposit_info',
        parse: (v) => DepositInfo.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDepositByNodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDepositByNodeResponse(
      depositInfo: decode.messageTo<DepositInfo?>(
        1,
        (b) => DepositInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1QueryDepositByNodeResponse;
}

/// QueryDepositByOwnerRequest is request type for the Query/DepositByOwner RPC method
class QueryDepositByOwnerRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDepositByOwnerResponse> {
  /// owner_addr defines the owner address to query for.
  final String? ownerAddr;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryDepositByOwnerRequest({this.ownerAddr, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/register/v1/deposit_by_owner/{owner_addr}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [ownerAddr, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'owner_addr': ownerAddr, 'pagination': pagination?.toJson()};
  }

  factory QueryDepositByOwnerRequest.fromJson(Map<String, dynamic> json) {
    return QueryDepositByOwnerRequest(
      ownerAddr: json.valueAsString<String?>(
        'owner_addr',
        acceptCamelCase: true,
      ),
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

  factory QueryDepositByOwnerRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDepositByOwnerRequest(
      ownerAddr: decode.getString<String?>(1),
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
      DefaultCosmosProtoTypeUrl.stratosRegisterV1QueryDepositByOwnerRequest;
  @override
  QueryDepositByOwnerResponse onQueryResponse(List<int> bytes) {
    return QueryDepositByOwnerResponse.deserialize(bytes);
  }

  @override
  QueryDepositByOwnerResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDepositByOwnerResponse.fromJson(json);
  }
}

/// QueryDepositByOwnerResponse is response type for the Query/DepositByOwner RPC method
class QueryDepositByOwnerResponse extends CosmosProtoMessage {
  /// deposit_infos defines the the node deposit info of this owner.
  final List<DepositInfo> depositInfos;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryDepositByOwnerResponse({
    this.depositInfos = const [],
    this.pagination,
  });

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
  List<Object?> get protoValues => [depositInfos, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'deposit_infos': depositInfos.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryDepositByOwnerResponse.fromJson(Map<String, dynamic> json) {
    return QueryDepositByOwnerResponse(
      depositInfos:
          (json.valueEnsureAsList<dynamic>(
                'deposit_infos',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<DepositInfo, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => DepositInfo.fromJson(v),
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

  factory QueryDepositByOwnerResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDepositByOwnerResponse(
      depositInfos:
          decode
              .getListOfBytes(1)
              .map((b) => DepositInfo.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.stratosRegisterV1QueryDepositByOwnerResponse;
}

/// QueryDepositTotalRequest is request type for the Query/DepositTotal RPC method
class QueryDepositTotalRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDepositTotalResponse> {
  const QueryDepositTotalRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/register/v1/deposit_total",
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

  factory QueryDepositTotalRequest.fromJson(Map<String, dynamic> json) {
    return QueryDepositTotalRequest();
  }

  factory QueryDepositTotalRequest.deserialize(List<int> bytes) {
    return QueryDepositTotalRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1QueryDepositTotalRequest;
  @override
  QueryDepositTotalResponse onQueryResponse(List<int> bytes) {
    return QueryDepositTotalResponse.deserialize(bytes);
  }

  @override
  QueryDepositTotalResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDepositTotalResponse.fromJson(json);
  }
}

/// QueryDepositTotalResponse is response type for the Query/DepositTotal RPC method
class QueryDepositTotalResponse extends CosmosProtoMessage {
  final cosmos_base_v1beta1_coin.Coin? resourceNodesTotalDeposit;

  final cosmos_base_v1beta1_coin.Coin? metaNodesTotalDeposit;

  final cosmos_base_v1beta1_coin.Coin? totalBondedDeposit;

  final cosmos_base_v1beta1_coin.Coin? totalUnbondedDeposit;

  final cosmos_base_v1beta1_coin.Coin? totalUnbondingDeposit;

  const QueryDepositTotalResponse({
    this.resourceNodesTotalDeposit,
    this.metaNodesTotalDeposit,
    this.totalBondedDeposit,
    this.totalUnbondedDeposit,
    this.totalUnbondingDeposit,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.message(4),
        ProtoFieldConfig.message(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    resourceNodesTotalDeposit,
    metaNodesTotalDeposit,
    totalBondedDeposit,
    totalUnbondedDeposit,
    totalUnbondingDeposit,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'resource_nodes_total_deposit': resourceNodesTotalDeposit?.toJson(),
      'meta_nodes_total_deposit': metaNodesTotalDeposit?.toJson(),
      'total_bonded_deposit': totalBondedDeposit?.toJson(),
      'total_unbonded_deposit': totalUnbondedDeposit?.toJson(),
      'total_unbonding_deposit': totalUnbondingDeposit?.toJson(),
    };
  }

  factory QueryDepositTotalResponse.fromJson(Map<String, dynamic> json) {
    return QueryDepositTotalResponse(
      resourceNodesTotalDeposit: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'resource_nodes_total_deposit',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      metaNodesTotalDeposit: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'meta_nodes_total_deposit',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      totalBondedDeposit: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'total_bonded_deposit',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      totalUnbondedDeposit: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'total_unbonded_deposit',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      totalUnbondingDeposit: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'total_unbonding_deposit',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryDepositTotalResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDepositTotalResponse(
      resourceNodesTotalDeposit: decode
          .messageTo<cosmos_base_v1beta1_coin.Coin?>(
            1,
            (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
          ),
      metaNodesTotalDeposit: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        2,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      totalBondedDeposit: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      totalUnbondedDeposit: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        4,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      totalUnbondingDeposit: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        5,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1QueryDepositTotalResponse;
}

/// QueryParamsRequest is request type for the Query/Params RPC method.
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
          path: "/stratos/register/v1/params",
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
      DefaultCosmosProtoTypeUrl.stratosRegisterV1QueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

/// QueryParamsResponse is response type for the Query/Params RPC method.
class QueryParamsResponse extends CosmosProtoMessage {
  /// params holds all the parameters of this module.
  final stratos_register_v1_register.Params? params;

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
      params: json
          .valueTo<stratos_register_v1_register.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => stratos_register_v1_register.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<stratos_register_v1_register.Params?>(
        1,
        (b) => stratos_register_v1_register.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1QueryParamsResponse;
}

/// QueryBondedResourceNodeCountRequest is request type for the Query/BondedResourceNodeCount RPC method.
class QueryBondedResourceNodeCountRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBondedResourceNodeCountResponse> {
  const QueryBondedResourceNodeCountRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/register/v1/resource_node_count",
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

  factory QueryBondedResourceNodeCountRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryBondedResourceNodeCountRequest();
  }

  factory QueryBondedResourceNodeCountRequest.deserialize(List<int> bytes) {
    return QueryBondedResourceNodeCountRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .stratosRegisterV1QueryBondedResourceNodeCountRequest;
  @override
  QueryBondedResourceNodeCountResponse onQueryResponse(List<int> bytes) {
    return QueryBondedResourceNodeCountResponse.deserialize(bytes);
  }

  @override
  QueryBondedResourceNodeCountResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryBondedResourceNodeCountResponse.fromJson(json);
  }
}

/// QueryBondedResourceNodeCountResponse is response type for the Query/BondedResourceNodeCount RPC method.
class QueryBondedResourceNodeCountResponse extends CosmosProtoMessage {
  /// number holds the total number of resource nodes.
  final BigInt? number;

  const QueryBondedResourceNodeCountResponse({this.number});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [number];

  @override
  Map<String, dynamic> toJson() {
    return {'number': number?.toString()};
  }

  factory QueryBondedResourceNodeCountResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryBondedResourceNodeCountResponse(
      number: json.valueAsBigInt<BigInt?>('number', acceptCamelCase: true),
    );
  }

  factory QueryBondedResourceNodeCountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBondedResourceNodeCountResponse(
      number: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .stratosRegisterV1QueryBondedResourceNodeCountResponse;
}

/// QueryBondedMetaNodeCountRequest is request type for the Query/MetaNodeNumber RPC method.
class QueryBondedMetaNodeCountRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBondedMetaNodeCountResponse> {
  const QueryBondedMetaNodeCountRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/register/v1/meta_node_count",
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

  factory QueryBondedMetaNodeCountRequest.fromJson(Map<String, dynamic> json) {
    return QueryBondedMetaNodeCountRequest();
  }

  factory QueryBondedMetaNodeCountRequest.deserialize(List<int> bytes) {
    return QueryBondedMetaNodeCountRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .stratosRegisterV1QueryBondedMetaNodeCountRequest;
  @override
  QueryBondedMetaNodeCountResponse onQueryResponse(List<int> bytes) {
    return QueryBondedMetaNodeCountResponse.deserialize(bytes);
  }

  @override
  QueryBondedMetaNodeCountResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryBondedMetaNodeCountResponse.fromJson(json);
  }
}

/// QueryBondedMetaNodeCountResponse is response type for the Query/MetaNodeNumber RPC method.
class QueryBondedMetaNodeCountResponse extends CosmosProtoMessage {
  /// number holds the total number of meta nodes.
  final BigInt? number;

  const QueryBondedMetaNodeCountResponse({this.number});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [number];

  @override
  Map<String, dynamic> toJson() {
    return {'number': number?.toString()};
  }

  factory QueryBondedMetaNodeCountResponse.fromJson(Map<String, dynamic> json) {
    return QueryBondedMetaNodeCountResponse(
      number: json.valueAsBigInt<BigInt?>('number', acceptCamelCase: true),
    );
  }

  factory QueryBondedMetaNodeCountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBondedMetaNodeCountResponse(
      number: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .stratosRegisterV1QueryBondedMetaNodeCountResponse;
}

/// QueryRemainingOzoneLimitRequest is request type for the Query/RemainingOzoneLimit RPC method.
class QueryRemainingOzoneLimitRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryRemainingOzoneLimitResponse> {
  const QueryRemainingOzoneLimitRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/register/v1/remaining_ozone_limit",
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

  factory QueryRemainingOzoneLimitRequest.fromJson(Map<String, dynamic> json) {
    return QueryRemainingOzoneLimitRequest();
  }

  factory QueryRemainingOzoneLimitRequest.deserialize(List<int> bytes) {
    return QueryRemainingOzoneLimitRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .stratosRegisterV1QueryRemainingOzoneLimitRequest;
  @override
  QueryRemainingOzoneLimitResponse onQueryResponse(List<int> bytes) {
    return QueryRemainingOzoneLimitResponse.deserialize(bytes);
  }

  @override
  QueryRemainingOzoneLimitResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryRemainingOzoneLimitResponse.fromJson(json);
  }
}

/// QueryRemainingOzoneLimitResponse is response type for the Query/RemainingOzoneLimit RPC method.
class QueryRemainingOzoneLimitResponse extends CosmosProtoMessage {
  final String? ozoneLimit;

  const QueryRemainingOzoneLimitResponse({this.ozoneLimit});

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
  List<Object?> get protoValues => [ozoneLimit];

  @override
  Map<String, dynamic> toJson() {
    return {'ozone_limit': ozoneLimit};
  }

  factory QueryRemainingOzoneLimitResponse.fromJson(Map<String, dynamic> json) {
    return QueryRemainingOzoneLimitResponse(
      ozoneLimit: json.valueAsString<String?>(
        'ozone_limit',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryRemainingOzoneLimitResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRemainingOzoneLimitResponse(
      ozoneLimit: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .stratosRegisterV1QueryRemainingOzoneLimitResponse;
}

class DepositInfo extends CosmosProtoMessage {
  final String? networkAddress;

  final google_protobuf_any.Any? pubkey;

  final bool? suspend;

  final cosmos_staking_v1beta1_staking.BondStatus? status;

  final String? tokens;

  final String? ownerAddress;

  final stratos_register_v1_register.Description? description;

  final google_protobuf_timestamp.Timestamp? creationTime;

  final int? nodeType;

  final cosmos_base_v1beta1_coin.Coin? bondedDeposit;

  final cosmos_base_v1beta1_coin.Coin? unBondingDeposit;

  final cosmos_base_v1beta1_coin.Coin? unBondedDeposit;

  const DepositInfo({
    this.networkAddress,
    this.pubkey,
    this.suspend,
    this.status,
    this.tokens,
    this.ownerAddress,
    this.description,
    this.creationTime,
    this.nodeType,
    this.bondedDeposit,
    this.unBondingDeposit,
    this.unBondedDeposit,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.bool(3, options: const []),
        ProtoFieldConfig.enumType(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.message(7, options: const []),
        ProtoFieldConfig.message(8, options: const []),
        ProtoFieldConfig.uint32(9, options: const []),
        ProtoFieldConfig.message(10, options: const []),
        ProtoFieldConfig.message(11, options: const []),
        ProtoFieldConfig.message(12, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    networkAddress,
    pubkey,
    suspend,
    status,
    tokens,
    ownerAddress,
    description,
    creationTime,
    nodeType,
    bondedDeposit,
    unBondingDeposit,
    unBondedDeposit,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'network_address': networkAddress,
      'pubkey': pubkey?.toJson(),
      'suspend': suspend,
      'status': status?.protoName,
      'tokens': tokens,
      'owner_address': ownerAddress,
      'description': description?.toJson(),
      'creation_time': creationTime?.toRfc3339(),
      'node_type': nodeType,
      'bonded_deposit': bondedDeposit?.toJson(),
      'un_bonding_deposit': unBondingDeposit?.toJson(),
      'un_bonded_deposit': unBondedDeposit?.toJson(),
    };
  }

  factory DepositInfo.fromJson(Map<String, dynamic> json) {
    return DepositInfo(
      networkAddress: json.valueAsString<String?>(
        'network_address',
        acceptCamelCase: true,
      ),
      pubkey: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'pubkey',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
      suspend: json.valueAsBool<bool?>('suspend', acceptCamelCase: true),
      status: json.valueTo<cosmos_staking_v1beta1_staking.BondStatus?, Object?>(
        key: 'status',
        parse: (v) => cosmos_staking_v1beta1_staking.BondStatus.from(v),
      ),
      tokens: json.valueAsString<String?>('tokens', acceptCamelCase: true),
      ownerAddress: json.valueAsString<String?>(
        'owner_address',
        acceptCamelCase: true,
      ),
      description: json.valueTo<
        stratos_register_v1_register.Description?,
        Map<String, dynamic>
      >(
        key: 'description',
        parse: (v) => stratos_register_v1_register.Description.fromJson(v),
        acceptCamelCase: true,
      ),
      creationTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'creation_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      nodeType: json.valueAsInt<int?>('node_type', acceptCamelCase: true),
      bondedDeposit: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'bonded_deposit',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      unBondingDeposit: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'un_bonding_deposit',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      unBondedDeposit: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'un_bonded_deposit',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory DepositInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DepositInfo(
      networkAddress: decode.getString<String?>(1),
      pubkey: decode.messageTo<google_protobuf_any.Any?>(
        2,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      suspend: decode.getBool<bool?>(3),
      status: decode.getEnum<cosmos_staking_v1beta1_staking.BondStatus?>(
        4,
        cosmos_staking_v1beta1_staking.BondStatus.values,
      ),
      tokens: decode.getString<String?>(5),
      ownerAddress: decode.getString<String?>(6),
      description: decode.messageTo<stratos_register_v1_register.Description?>(
        7,
        (b) => stratos_register_v1_register.Description.deserialize(b),
      ),
      creationTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        8,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      nodeType: decode.getInt<int?>(9),
      bondedDeposit: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        10,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      unBondingDeposit: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        11,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      unBondedDeposit: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        12,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1DepositInfo;
}
