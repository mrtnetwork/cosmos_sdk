import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryLastBlocksRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryLastBlocksResponse> {
  final String? height;

  const QueryLastBlocksRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/lastblock",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'height': height};
  }

  factory QueryLastBlocksRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryLastBlocksRequest(
      height: json.valueAsString<String?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryLastBlocksRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLastBlocksRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryLastBlocksRequest;
  @override
  QueryLastBlocksResponse onQueryResponse(List<int> bytes) {
    return QueryLastBlocksResponse.deserialize(bytes);
  }

  @override
  QueryLastBlocksResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryLastBlocksResponse.fromJson(json);
  }
}

class QueryChainsLastBlockRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryLastBlocksResponse> {
  final String? chain;

  final String? height;

  const QueryChainsLastBlockRequest({this.chain, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/lastblock/{chain}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [chain, height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'chain': chain, 'height': height};
  }

  factory QueryChainsLastBlockRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryChainsLastBlockRequest(
      chain: json.valueAsString<String?>(
        'chain',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      height: json.valueAsString<String?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryChainsLastBlockRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryChainsLastBlockRequest(
      chain: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryChainsLastBlockRequest;
  @override
  QueryLastBlocksResponse onQueryResponse(List<int> bytes) {
    return QueryLastBlocksResponse.deserialize(bytes);
  }

  @override
  QueryLastBlocksResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryLastBlocksResponse.fromJson(json);
  }
}

class QueryLastBlocksResponse extends CosmosProtoMessage {
  final List<ChainsLastBlock> lastBlocks;

  const QueryLastBlocksResponse({this.lastBlocks = const []});

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
  List<Object?> get protoValues => [lastBlocks];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'last_blocks': lastBlocks.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryLastBlocksResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryLastBlocksResponse(
      lastBlocks:
          (json.valueEnsureAsList<dynamic>(
                'last_blocks',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<ChainsLastBlock, Object>(
                  value: e,
                  parse:
                      (v) => ChainsLastBlock.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryLastBlocksResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLastBlocksResponse(
      lastBlocks:
          decode
              .getListOfBytes(1)
              .map((b) => ChainsLastBlock.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryLastBlocksResponse;
}

class ChainsLastBlock extends CosmosProtoMessage {
  final String? chain;

  final BigInt? lastObservedIn;

  final BigInt? lastSignedOut;

  final BigInt? thorchain;

  const ChainsLastBlock({
    this.chain,
    this.lastObservedIn,
    this.lastSignedOut,
    this.thorchain,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.int64(2, options: const []),
        ProtoFieldConfig.int64(3, options: const []),
        ProtoFieldConfig.int64(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    chain,
    lastObservedIn,
    lastSignedOut,
    thorchain,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'chain': chain,
      'last_observed_in': config.encodeBigint(lastObservedIn),
      'last_signed_out': config.encodeBigint(lastSignedOut),
      'thorchain': config.encodeBigint(thorchain),
    };
  }

  factory ChainsLastBlock.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ChainsLastBlock(
      chain: json.valueAsString<String?>(
        'chain',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lastObservedIn: json.valueAsBigInt<BigInt?>(
        'last_observed_in',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lastSignedOut: json.valueAsBigInt<BigInt?>(
        'last_signed_out',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      thorchain: json.valueAsBigInt<BigInt?>(
        'thorchain',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ChainsLastBlock.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ChainsLastBlock(
      chain: decode.getString<String?>(1),
      lastObservedIn: decode.getBigInt<BigInt?>(2),
      lastSignedOut: decode.getBigInt<BigInt?>(3),
      thorchain: decode.getBigInt<BigInt?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesChainsLastBlock;
}
