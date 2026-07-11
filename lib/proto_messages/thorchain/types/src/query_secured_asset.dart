import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QuerySecuredAssetRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySecuredAssetResponse> {
  final String? asset;

  final String? height;

  const QuerySecuredAssetRequest({this.asset, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/securedasset/{asset}",
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

  factory QuerySecuredAssetRequest.fromJson(Map<String, dynamic> json) {
    return QuerySecuredAssetRequest(
      asset: json.valueAsString<String?>('asset', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QuerySecuredAssetRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySecuredAssetRequest(
      asset: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQuerySecuredAssetRequest;
  @override
  QuerySecuredAssetResponse onQueryResponse(List<int> bytes) {
    return QuerySecuredAssetResponse.deserialize(bytes);
  }

  @override
  QuerySecuredAssetResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySecuredAssetResponse.fromJson(json);
  }
}

class QuerySecuredAssetResponse extends CosmosProtoMessage {
  /// bridge account asset with \"-\" separator
  final String? asset;

  /// total share tokens issued for the pool
  final String? supply;

  /// total depth of bridge asset
  final String? depth;

  const QuerySecuredAssetResponse({this.asset, this.supply, this.depth});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [asset, supply, depth];

  @override
  Map<String, dynamic> toJson() {
    return {'asset': asset, 'supply': supply, 'depth': depth};
  }

  factory QuerySecuredAssetResponse.fromJson(Map<String, dynamic> json) {
    return QuerySecuredAssetResponse(
      asset: json.valueAsString<String?>('asset', acceptCamelCase: true),
      supply: json.valueAsString<String?>('supply', acceptCamelCase: true),
      depth: json.valueAsString<String?>('depth', acceptCamelCase: true),
    );
  }

  factory QuerySecuredAssetResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySecuredAssetResponse(
      asset: decode.getString<String?>(1),
      supply: decode.getString<String?>(2),
      depth: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQuerySecuredAssetResponse;
}

class QuerySecuredAssetsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySecuredAssetsResponse> {
  final String? height;

  const QuerySecuredAssetsRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/securedassets",
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

  factory QuerySecuredAssetsRequest.fromJson(Map<String, dynamic> json) {
    return QuerySecuredAssetsRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QuerySecuredAssetsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySecuredAssetsRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQuerySecuredAssetsRequest;
  @override
  QuerySecuredAssetsResponse onQueryResponse(List<int> bytes) {
    return QuerySecuredAssetsResponse.deserialize(bytes);
  }

  @override
  QuerySecuredAssetsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySecuredAssetsResponse.fromJson(json);
  }
}

class QuerySecuredAssetsResponse extends CosmosProtoMessage {
  final List<QuerySecuredAssetResponse> assets;

  const QuerySecuredAssetsResponse({this.assets = const []});

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
  List<Object?> get protoValues => [assets];

  @override
  Map<String, dynamic> toJson() {
    return {'assets': assets.map((e) => e.toJson()).toList()};
  }

  factory QuerySecuredAssetsResponse.fromJson(Map<String, dynamic> json) {
    return QuerySecuredAssetsResponse(
      assets:
          (json.valueEnsureAsList<dynamic>('assets', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  QuerySecuredAssetResponse,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => QuerySecuredAssetResponse.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QuerySecuredAssetsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySecuredAssetsResponse(
      assets:
          decode
              .getListOfBytes(1)
              .map((b) => QuerySecuredAssetResponse.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQuerySecuredAssetsResponse;
}
