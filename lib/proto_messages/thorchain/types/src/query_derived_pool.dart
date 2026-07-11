import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryDerivedPoolRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDerivedPoolResponse> {
  final String? asset;

  final String? height;

  const QueryDerivedPoolRequest({this.asset, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/dpool/{asset}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [asset, height];

  @override
  Map<String, dynamic> toJson() {
    return {'asset': asset, 'height': height};
  }

  factory QueryDerivedPoolRequest.fromJson(Map<String, dynamic> json) {
    return QueryDerivedPoolRequest(
      asset: json.valueAsString<String?>('asset', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryDerivedPoolRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDerivedPoolRequest(
      asset: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryDerivedPoolRequest;
  @override
  QueryDerivedPoolResponse onQueryResponse(List<int> bytes) {
    return QueryDerivedPoolResponse.deserialize(bytes);
  }

  @override
  QueryDerivedPoolResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDerivedPoolResponse.fromJson(json);
  }
}

class QueryDerivedPoolResponse extends CosmosProtoMessage {
  final String? asset;

  final String? status;

  final BigInt? decimals;

  final String? balanceAsset;

  final String? balanceRune;

  /// the depth of the derived virtual pool relative to L1 pool (in basis points)
  final String? derivedDepthBps;

  const QueryDerivedPoolResponse({
    this.asset,
    this.status,
    this.decimals,
    this.balanceAsset,
    this.balanceRune,
    this.derivedDepthBps,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    asset,
    status,
    decimals,
    balanceAsset,
    balanceRune,
    derivedDepthBps,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'asset': asset,
      'status': status,
      'decimals': decimals?.toString(),
      'balance_asset': balanceAsset,
      'balance_rune': balanceRune,
      'derived_depth_bps': derivedDepthBps,
    };
  }

  factory QueryDerivedPoolResponse.fromJson(Map<String, dynamic> json) {
    return QueryDerivedPoolResponse(
      asset: json.valueAsString<String?>('asset', acceptCamelCase: true),
      status: json.valueAsString<String?>('status', acceptCamelCase: true),
      decimals: json.valueAsBigInt<BigInt?>('decimals', acceptCamelCase: true),
      balanceAsset: json.valueAsString<String?>(
        'balance_asset',
        acceptCamelCase: true,
      ),
      balanceRune: json.valueAsString<String?>(
        'balance_rune',
        acceptCamelCase: true,
      ),
      derivedDepthBps: json.valueAsString<String?>(
        'derived_depth_bps',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDerivedPoolResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDerivedPoolResponse(
      asset: decode.getString<String?>(1),
      status: decode.getString<String?>(2),
      decimals: decode.getBigInt<BigInt?>(3),
      balanceAsset: decode.getString<String?>(4),
      balanceRune: decode.getString<String?>(5),
      derivedDepthBps: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryDerivedPoolResponse;
}

class QueryDerivedPoolsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDerivedPoolsResponse> {
  final String? height;

  const QueryDerivedPoolsRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/dpools",
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

  factory QueryDerivedPoolsRequest.fromJson(Map<String, dynamic> json) {
    return QueryDerivedPoolsRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryDerivedPoolsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDerivedPoolsRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryDerivedPoolsRequest;
  @override
  QueryDerivedPoolsResponse onQueryResponse(List<int> bytes) {
    return QueryDerivedPoolsResponse.deserialize(bytes);
  }

  @override
  QueryDerivedPoolsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDerivedPoolsResponse.fromJson(json);
  }
}

class QueryDerivedPoolsResponse extends CosmosProtoMessage {
  final List<QueryDerivedPoolResponse> pools;

  const QueryDerivedPoolsResponse({this.pools = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [pools];

  @override
  Map<String, dynamic> toJson() {
    return {'pools': pools.map((e) => e.toJson()).toList()};
  }

  factory QueryDerivedPoolsResponse.fromJson(Map<String, dynamic> json) {
    return QueryDerivedPoolsResponse(
      pools:
          (json.valueEnsureAsList<dynamic>('pools', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  QueryDerivedPoolResponse,
                  Map<String, dynamic>
                >(value: e, parse: (v) => QueryDerivedPoolResponse.fromJson(v)),
              )
              .toList(),
    );
  }

  factory QueryDerivedPoolsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDerivedPoolsResponse(
      pools:
          decode
              .getListOfBytes(1)
              .map((b) => QueryDerivedPoolResponse.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryDerivedPoolsResponse;
}
