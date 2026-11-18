import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/tendermint/types/src/types.dart"
    as tendermint_types_types;
import "package:cosmos_sdk/proto_messages/tendermint/types/src/block.dart"
    as tendermint_types_block;
import "package:cosmos_sdk/proto_messages/cosmos/base/tendermint/v1beta1/src/types.dart"
    as cosmos_base_tendermint_v1beta1_types;
import "package:cosmos_sdk/proto_messages/tendermint/p2p/src/types.dart"
    as tendermint_p2p_types;
import "package:cosmos_sdk/proto_messages/tendermint/abci/src/types.dart"
    as tendermint_abci_types;
import "package:cosmos_sdk/proto_messages/tendermint/types/src/params.dart"
    as tendermint_types_params;

/// GetValidatorSetByHeightRequest is the request type for the Query/GetValidatorSetByHeight RPC method.
class GetValidatorSetByHeightRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GetValidatorSetByHeightResponse> {
  final BigInt? height;

  /// pagination defines an pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const GetValidatorSetByHeightRequest({this.height, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/base/tendermint/v1beta1/validatorsets/{height}",
        ),
      ],
      fields: [ProtoFieldConfig.int64(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [height, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'height': config.encodeBigint(height),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory GetValidatorSetByHeightRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GetValidatorSetByHeightRequest(
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageRequest?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory GetValidatorSetByHeightRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetValidatorSetByHeightRequest(
      height: decode.getBigInt<BigInt?>(1),
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
      DefaultCosmosProtoTypeUrl
          .cosmosBaseTendermintV1beta1GetValidatorSetByHeightRequest;
  @override
  GetValidatorSetByHeightResponse onQueryResponse(List<int> bytes) {
    return GetValidatorSetByHeightResponse.deserialize(bytes);
  }

  @override
  GetValidatorSetByHeightResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return GetValidatorSetByHeightResponse.fromJson(json);
  }
}

/// GetValidatorSetByHeightResponse is the response type for the Query/GetValidatorSetByHeight RPC method.
class GetValidatorSetByHeightResponse extends CosmosProtoMessage {
  final BigInt? blockHeight;

  final List<Validator> validators;

  /// pagination defines an pagination for the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const GetValidatorSetByHeightResponse({
    this.blockHeight,
    this.validators = const [],
    this.pagination,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.message(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [blockHeight, validators, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'block_height': config.encodeBigint(blockHeight),
      'validators': validators.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory GetValidatorSetByHeightResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GetValidatorSetByHeightResponse(
      blockHeight: json.valueAsBigInt<BigInt?>(
        'block_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      validators:
          (json.valueEnsureAsList<dynamic>(
                'validators',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<Validator, Object>(
                  value: e,
                  parse:
                      (v) => Validator.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageResponse?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory GetValidatorSetByHeightResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetValidatorSetByHeightResponse(
      blockHeight: decode.getBigInt<BigInt?>(1),
      validators:
          decode
              .getListOfBytes(2)
              .map((b) => Validator.deserialize(b))
              .toList(),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        3,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseTendermintV1beta1GetValidatorSetByHeightResponse;
}

/// GetLatestValidatorSetRequest is the request type for the Query/GetValidatorSetByHeight RPC method.
class GetLatestValidatorSetRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GetLatestValidatorSetResponse> {
  /// pagination defines an pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const GetLatestValidatorSetRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/base/tendermint/v1beta1/validatorsets/latest",
        ),
      ],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pagination': config.encodeMessage(pagination)};
  }

  factory GetLatestValidatorSetRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GetLatestValidatorSetRequest(
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageRequest?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory GetLatestValidatorSetRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetLatestValidatorSetRequest(
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
      DefaultCosmosProtoTypeUrl
          .cosmosBaseTendermintV1beta1GetLatestValidatorSetRequest;
  @override
  GetLatestValidatorSetResponse onQueryResponse(List<int> bytes) {
    return GetLatestValidatorSetResponse.deserialize(bytes);
  }

  @override
  GetLatestValidatorSetResponse onQueryResponseJson(Map<String, dynamic> json) {
    return GetLatestValidatorSetResponse.fromJson(json);
  }
}

/// GetLatestValidatorSetResponse is the response type for the Query/GetValidatorSetByHeight RPC method.
class GetLatestValidatorSetResponse extends CosmosProtoMessage {
  final BigInt? blockHeight;

  final List<Validator> validators;

  /// pagination defines an pagination for the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const GetLatestValidatorSetResponse({
    this.blockHeight,
    this.validators = const [],
    this.pagination,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.message(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [blockHeight, validators, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'block_height': config.encodeBigint(blockHeight),
      'validators': validators.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory GetLatestValidatorSetResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GetLatestValidatorSetResponse(
      blockHeight: json.valueAsBigInt<BigInt?>(
        'block_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      validators:
          (json.valueEnsureAsList<dynamic>(
                'validators',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<Validator, Object>(
                  value: e,
                  parse:
                      (v) => Validator.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageResponse?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory GetLatestValidatorSetResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetLatestValidatorSetResponse(
      blockHeight: decode.getBigInt<BigInt?>(1),
      validators:
          decode
              .getListOfBytes(2)
              .map((b) => Validator.deserialize(b))
              .toList(),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        3,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseTendermintV1beta1GetLatestValidatorSetResponse;
}

/// Validator is the type for the validator-set.
class Validator extends CosmosProtoMessage {
  final String? address;

  final google_protobuf_any.Any? pubKey;

  final BigInt? votingPower;

  final BigInt? proposerPriority;

  const Validator({
    this.address,
    this.pubKey,
    this.votingPower,
    this.proposerPriority,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.int64(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    address,
    pubKey,
    votingPower,
    proposerPriority,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'address': address,
      'pub_key': config.encodeMessage(pubKey),
      'voting_power': config.encodeBigint(votingPower),
      'proposer_priority': config.encodeBigint(proposerPriority),
    };
  }

  factory Validator.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Validator(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      pubKey: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'pub_key',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      votingPower: json.valueAsBigInt<BigInt?>(
        'voting_power',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      proposerPriority: json.valueAsBigInt<BigInt?>(
        'proposer_priority',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Validator.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Validator(
      address: decode.getString<String?>(1),
      pubKey: decode.messageTo<google_protobuf_any.Any?>(
        2,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      votingPower: decode.getBigInt<BigInt?>(3),
      proposerPriority: decode.getBigInt<BigInt?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseTendermintV1beta1Validator;
}

/// GetBlockByHeightRequest is the request type for the Query/GetBlockByHeight RPC method.
class GetBlockByHeightRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GetBlockByHeightResponse> {
  final BigInt? height;

  const GetBlockByHeightRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/base/tendermint/v1beta1/blocks/{height}",
        ),
      ],
      fields: [ProtoFieldConfig.int64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'height': config.encodeBigint(height)};
  }

  factory GetBlockByHeightRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GetBlockByHeightRequest(
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory GetBlockByHeightRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetBlockByHeightRequest(height: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseTendermintV1beta1GetBlockByHeightRequest;
  @override
  GetBlockByHeightResponse onQueryResponse(List<int> bytes) {
    return GetBlockByHeightResponse.deserialize(bytes);
  }

  @override
  GetBlockByHeightResponse onQueryResponseJson(Map<String, dynamic> json) {
    return GetBlockByHeightResponse.fromJson(json);
  }
}

/// GetBlockByHeightResponse is the response type for the Query/GetBlockByHeight RPC method.
class GetBlockByHeightResponse extends CosmosProtoMessage {
  final tendermint_types_types.BlockID? blockId;

  /// Deprecated: please use `sdk_block` instead
  final tendermint_types_block.Block? block;

  final cosmos_base_tendermint_v1beta1_types.Block? sdkBlock;

  const GetBlockByHeightResponse({this.blockId, this.block, this.sdkBlock});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.message(
          3,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.47",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [blockId, block, sdkBlock];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'block_id': config.encodeMessage(blockId),
      'block': config.encodeMessage(block),
      'sdk_block': config.encodeMessage(sdkBlock),
    };
  }

  factory GetBlockByHeightResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GetBlockByHeightResponse(
      blockId: json.valueTo<tendermint_types_types.BlockID?, Object>(
        key: 'block_id',
        parse:
            (v) => tendermint_types_types.BlockID.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      block: json.valueTo<tendermint_types_block.Block?, Object>(
        key: 'block',
        parse:
            (v) => tendermint_types_block.Block.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      sdkBlock: json
          .valueTo<cosmos_base_tendermint_v1beta1_types.Block?, Object>(
            key: 'sdk_block',
            parse:
                (v) => cosmos_base_tendermint_v1beta1_types.Block.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory GetBlockByHeightResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetBlockByHeightResponse(
      blockId: decode.messageTo<tendermint_types_types.BlockID?>(
        1,
        (b) => tendermint_types_types.BlockID.deserialize(b),
      ),
      block: decode.messageTo<tendermint_types_block.Block?>(
        2,
        (b) => tendermint_types_block.Block.deserialize(b),
      ),
      sdkBlock: decode.messageTo<cosmos_base_tendermint_v1beta1_types.Block?>(
        3,
        (b) => cosmos_base_tendermint_v1beta1_types.Block.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseTendermintV1beta1GetBlockByHeightResponse;
}

/// GetLatestBlockRequest is the request type for the Query/GetLatestBlock RPC method.
class GetLatestBlockRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GetLatestBlockResponse> {
  const GetLatestBlockRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/base/tendermint/v1beta1/blocks/latest",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory GetLatestBlockRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GetLatestBlockRequest();
  }

  factory GetLatestBlockRequest.deserialize(List<int> bytes) {
    return GetLatestBlockRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseTendermintV1beta1GetLatestBlockRequest;
  @override
  GetLatestBlockResponse onQueryResponse(List<int> bytes) {
    return GetLatestBlockResponse.deserialize(bytes);
  }

  @override
  GetLatestBlockResponse onQueryResponseJson(Map<String, dynamic> json) {
    return GetLatestBlockResponse.fromJson(json);
  }
}

/// GetLatestBlockResponse is the response type for the Query/GetLatestBlock RPC method.
class GetLatestBlockResponse extends CosmosProtoMessage {
  final tendermint_types_types.BlockID? blockId;

  /// Deprecated: please use `sdk_block` instead
  final tendermint_types_block.Block? block;

  final cosmos_base_tendermint_v1beta1_types.Block? sdkBlock;

  const GetLatestBlockResponse({this.blockId, this.block, this.sdkBlock});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.message(
          3,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.47",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [blockId, block, sdkBlock];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'block_id': config.encodeMessage(blockId),
      'block': config.encodeMessage(block),
      'sdk_block': config.encodeMessage(sdkBlock),
    };
  }

  factory GetLatestBlockResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GetLatestBlockResponse(
      blockId: json.valueTo<tendermint_types_types.BlockID?, Object>(
        key: 'block_id',
        parse:
            (v) => tendermint_types_types.BlockID.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      block: json.valueTo<tendermint_types_block.Block?, Object>(
        key: 'block',
        parse:
            (v) => tendermint_types_block.Block.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      sdkBlock: json
          .valueTo<cosmos_base_tendermint_v1beta1_types.Block?, Object>(
            key: 'sdk_block',
            parse:
                (v) => cosmos_base_tendermint_v1beta1_types.Block.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory GetLatestBlockResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetLatestBlockResponse(
      blockId: decode.messageTo<tendermint_types_types.BlockID?>(
        1,
        (b) => tendermint_types_types.BlockID.deserialize(b),
      ),
      block: decode.messageTo<tendermint_types_block.Block?>(
        2,
        (b) => tendermint_types_block.Block.deserialize(b),
      ),
      sdkBlock: decode.messageTo<cosmos_base_tendermint_v1beta1_types.Block?>(
        3,
        (b) => cosmos_base_tendermint_v1beta1_types.Block.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseTendermintV1beta1GetLatestBlockResponse;
}

/// GetSyncingRequest is the request type for the Query/GetSyncing RPC method.
class GetSyncingRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GetSyncingResponse> {
  const GetSyncingRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/base/tendermint/v1beta1/syncing",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory GetSyncingRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GetSyncingRequest();
  }

  factory GetSyncingRequest.deserialize(List<int> bytes) {
    return GetSyncingRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseTendermintV1beta1GetSyncingRequest;
  @override
  GetSyncingResponse onQueryResponse(List<int> bytes) {
    return GetSyncingResponse.deserialize(bytes);
  }

  @override
  GetSyncingResponse onQueryResponseJson(Map<String, dynamic> json) {
    return GetSyncingResponse.fromJson(json);
  }
}

/// GetSyncingResponse is the response type for the Query/GetSyncing RPC method.
class GetSyncingResponse extends CosmosProtoMessage {
  final bool? syncing;

  /// earliest_block_height is the earliest block height available on this node.
  final BigInt? earliestBlockHeight;

  /// latest_block_height is the latest block height available on this node.
  final BigInt? latestBlockHeight;

  const GetSyncingResponse({
    this.syncing,
    this.earliestBlockHeight,
    this.latestBlockHeight,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bool(1),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.int64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    syncing,
    earliestBlockHeight,
    latestBlockHeight,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'syncing': syncing,
      'earliest_block_height': config.encodeBigint(earliestBlockHeight),
      'latest_block_height': config.encodeBigint(latestBlockHeight),
    };
  }

  factory GetSyncingResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GetSyncingResponse(
      syncing: json.valueAsBool<bool?>(
        'syncing',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      earliestBlockHeight: json.valueAsBigInt<BigInt?>(
        'earliest_block_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      latestBlockHeight: json.valueAsBigInt<BigInt?>(
        'latest_block_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory GetSyncingResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetSyncingResponse(
      syncing: decode.getBool<bool?>(1),
      earliestBlockHeight: decode.getBigInt<BigInt?>(2),
      latestBlockHeight: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseTendermintV1beta1GetSyncingResponse;
}

/// GetNodeInfoRequest is the request type for the Query/GetNodeInfo RPC method.
class GetNodeInfoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GetNodeInfoResponse> {
  const GetNodeInfoRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/base/tendermint/v1beta1/node_info",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory GetNodeInfoRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GetNodeInfoRequest();
  }

  factory GetNodeInfoRequest.deserialize(List<int> bytes) {
    return GetNodeInfoRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseTendermintV1beta1GetNodeInfoRequest;
  @override
  GetNodeInfoResponse onQueryResponse(List<int> bytes) {
    return GetNodeInfoResponse.deserialize(bytes);
  }

  @override
  GetNodeInfoResponse onQueryResponseJson(Map<String, dynamic> json) {
    return GetNodeInfoResponse.fromJson(json);
  }
}

/// GetNodeInfoResponse is the response type for the Query/GetNodeInfo RPC method.
class GetNodeInfoResponse extends CosmosProtoMessage {
  final tendermint_p2p_types.DefaultNodeInfo? defaultNodeInfo;

  final VersionInfo? applicationVersion;

  const GetNodeInfoResponse({this.defaultNodeInfo, this.applicationVersion});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [defaultNodeInfo, applicationVersion];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'default_node_info': config.encodeMessage(defaultNodeInfo),
      'application_version': config.encodeMessage(applicationVersion),
    };
  }

  factory GetNodeInfoResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GetNodeInfoResponse(
      defaultNodeInfo: json
          .valueTo<tendermint_p2p_types.DefaultNodeInfo?, Object>(
            key: 'default_node_info',
            parse:
                (v) => tendermint_p2p_types.DefaultNodeInfo.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      applicationVersion: json.valueTo<VersionInfo?, Object>(
        key: 'application_version',
        parse:
            (v) => VersionInfo.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory GetNodeInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetNodeInfoResponse(
      defaultNodeInfo: decode.messageTo<tendermint_p2p_types.DefaultNodeInfo?>(
        1,
        (b) => tendermint_p2p_types.DefaultNodeInfo.deserialize(b),
      ),
      applicationVersion: decode.messageTo<VersionInfo?>(
        2,
        (b) => VersionInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseTendermintV1beta1GetNodeInfoResponse;
}

/// VersionInfo is the type for the GetNodeInfoResponse message.
class VersionInfo extends CosmosProtoMessage {
  final String? name;

  final String? appName;

  final String? version;

  final String? gitCommit;

  final String? buildTags;

  final String? goVersion;

  final List<Module> buildDeps;

  final String? cosmosSdkVersion;

  const VersionInfo({
    this.name,
    this.appName,
    this.version,
    this.gitCommit,
    this.buildTags,
    this.goVersion,
    this.buildDeps = const [],
    this.cosmosSdkVersion,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.string(
          8,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.43",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    name,
    appName,
    version,
    gitCommit,
    buildTags,
    goVersion,
    buildDeps,
    cosmosSdkVersion,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'name': name,
      'app_name': appName,
      'version': version,
      'git_commit': gitCommit,
      'build_tags': buildTags,
      'go_version': goVersion,
      'build_deps': buildDeps.map((e) => config.encodeMessage(e)).toList(),
      'cosmos_sdk_version': cosmosSdkVersion,
    };
  }

  factory VersionInfo.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return VersionInfo(
      name: json.valueAsString<String?>(
        'name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      appName: json.valueAsString<String?>(
        'app_name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      version: json.valueAsString<String?>(
        'version',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      gitCommit: json.valueAsString<String?>(
        'git_commit',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      buildTags: json.valueAsString<String?>(
        'build_tags',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      goVersion: json.valueAsString<String?>(
        'go_version',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      buildDeps:
          (json.valueEnsureAsList<dynamic>(
                'build_deps',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<Module, Object>(
                  value: e,
                  parse:
                      (v) => Module.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      cosmosSdkVersion: json.valueAsString<String?>(
        'cosmos_sdk_version',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory VersionInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return VersionInfo(
      name: decode.getString<String?>(1),
      appName: decode.getString<String?>(2),
      version: decode.getString<String?>(3),
      gitCommit: decode.getString<String?>(4),
      buildTags: decode.getString<String?>(5),
      goVersion: decode.getString<String?>(6),
      buildDeps:
          decode.getListOfBytes(7).map((b) => Module.deserialize(b)).toList(),
      cosmosSdkVersion: decode.getString<String?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseTendermintV1beta1VersionInfo;
}

/// Module is the type for VersionInfo
class Module extends CosmosProtoMessage {
  /// module path
  final String? path;

  /// module version
  final String? version;

  /// checksum
  final String? sum;

  const Module({this.path, this.version, this.sum});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [path, version, sum];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'path': path, 'version': version, 'sum': sum};
  }

  factory Module.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Module(
      path: json.valueAsString<String?>(
        'path',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      version: json.valueAsString<String?>(
        'version',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      sum: json.valueAsString<String?>(
        'sum',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Module.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Module(
      path: decode.getString<String?>(1),
      version: decode.getString<String?>(2),
      sum: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseTendermintV1beta1Module;
}

/// ABCIQueryRequest defines the request structure for the ABCIQuery gRPC query.
class ABCIQueryRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ABCIQueryResponse> {
  final BuBytes? data;

  final String? path;

  final BigInt? height;

  final bool? prove;

  ABCIQueryRequest({List<int>? data, this.path, this.height, this.prove})
    : data = data?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/base/tendermint/v1beta1/abci_query",
        ),
      ],
      fields: [
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.bool(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [data, path, height, prove];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'data': config.encodeBinary(data),
      'path': path,
      'height': config.encodeBigint(height),
      'prove': prove,
    };
  }

  factory ABCIQueryRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ABCIQueryRequest(
      data: config.decodeBinary<List<int>?>(
        json.valueAs('data', normalizeKeyLookup: config.normalizeKeys),
      ),
      path: json.valueAsString<String?>(
        'path',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      prove: json.valueAsBool<bool?>(
        'prove',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ABCIQueryRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ABCIQueryRequest(
      data: decode.getBytes<List<int>?>(1),
      path: decode.getString<String?>(2),
      height: decode.getBigInt<BigInt?>(3),
      prove: decode.getBool<bool?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseTendermintV1beta1ABCIQueryRequest;
  @override
  ABCIQueryResponse onQueryResponse(List<int> bytes) {
    return ABCIQueryResponse.deserialize(bytes);
  }

  @override
  ABCIQueryResponse onQueryResponseJson(Map<String, dynamic> json) {
    return ABCIQueryResponse.fromJson(json);
  }
}

/// ABCIQueryResponse defines the response structure for the ABCIQuery gRPC query.
///
/// Note: This type is a duplicate of the ResponseQuery proto type defined in
/// Tendermint.
class ABCIQueryResponse extends CosmosProtoMessage {
  final int? code;

  /// DEPRECATED: use "value" instead
  final String? log;

  /// nondeterministic
  final String? info;

  /// nondeterministic
  final BigInt? index;

  final BuBytes? key;

  final BuBytes? value;

  final ProofOps? proofOps;

  final BigInt? height;

  final String? codespace;

  ABCIQueryResponse({
    this.code,
    this.log,
    this.info,
    this.index,
    List<int>? key,
    List<int>? value,
    this.proofOps,
    this.height,
    this.codespace,
  }) : key = key?.asImmutableBytes,
       value = value?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint32(1),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.bytes(6),
        ProtoFieldConfig.bytes(7),
        ProtoFieldConfig.message(8),
        ProtoFieldConfig.int64(9),
        ProtoFieldConfig.string(10),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    code,
    log,
    info,
    index,
    key,
    value,
    proofOps,
    height,
    codespace,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'code': code,
      'log': log,
      'info': info,
      'index': config.encodeBigint(index),
      'key': config.encodeBinary(key),
      'value': config.encodeBinary(value),
      'proof_ops': config.encodeMessage(proofOps),
      'height': config.encodeBigint(height),
      'codespace': codespace,
    };
  }

  factory ABCIQueryResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ABCIQueryResponse(
      code: json.valueAsInt<int?>(
        'code',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      log: json.valueAsString<String?>(
        'log',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      info: json.valueAsString<String?>(
        'info',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      index: json.valueAsBigInt<BigInt?>(
        'index',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      key: config.decodeBinary<List<int>?>(
        json.valueAs('key', normalizeKeyLookup: config.normalizeKeys),
      ),
      value: config.decodeBinary<List<int>?>(
        json.valueAs('value', normalizeKeyLookup: config.normalizeKeys),
      ),
      proofOps: json.valueTo<ProofOps?, Object>(
        key: 'proof_ops',
        parse: (v) => ProofOps.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      codespace: json.valueAsString<String?>(
        'codespace',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ABCIQueryResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ABCIQueryResponse(
      code: decode.getInt<int?>(1),
      log: decode.getString<String?>(3),
      info: decode.getString<String?>(4),
      index: decode.getBigInt<BigInt?>(5),
      key: decode.getBytes<List<int>?>(6),
      value: decode.getBytes<List<int>?>(7),
      proofOps: decode.messageTo<ProofOps?>(8, (b) => ProofOps.deserialize(b)),
      height: decode.getBigInt<BigInt?>(9),
      codespace: decode.getString<String?>(10),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseTendermintV1beta1ABCIQueryResponse;
}

/// ProofOp defines an operation used for calculating Merkle root. The data could
/// be arbitrary format, providing necessary data for example neighbouring node
/// hash.
///
/// Note: This type is a duplicate of the ProofOp proto type defined in Tendermint.
class ProofOp extends CosmosProtoMessage {
  final String? type;

  final BuBytes? key;

  final BuBytes? data;

  ProofOp({this.type, List<int>? key, List<int>? data})
    : key = key?.asImmutableBytes,
      data = data?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.bytes(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [type, key, data];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'type': type,
      'key': config.encodeBinary(key),
      'data': config.encodeBinary(data),
    };
  }

  factory ProofOp.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ProofOp(
      type: json.valueAsString<String?>(
        'type',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      key: config.decodeBinary<List<int>?>(
        json.valueAs('key', normalizeKeyLookup: config.normalizeKeys),
      ),
      data: config.decodeBinary<List<int>?>(
        json.valueAs('data', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory ProofOp.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ProofOp(
      type: decode.getString<String?>(1),
      key: decode.getBytes<List<int>?>(2),
      data: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseTendermintV1beta1ProofOp;
}

/// ProofOps is Merkle proof defined by the list of ProofOps.
///
/// Note: This type is a duplicate of the ProofOps proto type defined in Tendermint.
class ProofOps extends CosmosProtoMessage {
  final List<ProofOp> ops;

  const ProofOps({this.ops = const []});

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
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [ops];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'ops': ops.map((e) => config.encodeMessage(e)).toList()};
  }

  factory ProofOps.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ProofOps(
      ops:
          (json.valueEnsureAsList<dynamic>(
                'ops',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<ProofOp, Object>(
                  value: e,
                  parse:
                      (v) => ProofOp.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory ProofOps.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ProofOps(
      ops: decode.getListOfBytes(1).map((b) => ProofOp.deserialize(b)).toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseTendermintV1beta1ProofOps;
}

/// GetBlockResultsRequest is the request type for the Query/GetBlockResults RPC method.
class GetBlockResultsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GetBlockResultsResponse> {
  final BigInt? height;

  const GetBlockResultsRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/base/tendermint/v1beta1/block_results/{height}",
        ),
      ],
      fields: [ProtoFieldConfig.int64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'height': config.encodeBigint(height)};
  }

  factory GetBlockResultsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GetBlockResultsRequest(
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory GetBlockResultsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetBlockResultsRequest(height: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseTendermintV1beta1GetBlockResultsRequest;
  @override
  GetBlockResultsResponse onQueryResponse(List<int> bytes) {
    return GetBlockResultsResponse.deserialize(bytes);
  }

  @override
  GetBlockResultsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return GetBlockResultsResponse.fromJson(json);
  }
}

/// GetLatestBlockResultsRequest is the request type for the Query/GetLatestBlockResults RPC method.
class GetLatestBlockResultsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GetLatestBlockResultsResponse> {
  const GetLatestBlockResultsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/base/tendermint/v1beta1/block_results/latest",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory GetLatestBlockResultsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GetLatestBlockResultsRequest();
  }

  factory GetLatestBlockResultsRequest.deserialize(List<int> bytes) {
    return GetLatestBlockResultsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseTendermintV1beta1GetLatestBlockResultsRequest;
  @override
  GetLatestBlockResultsResponse onQueryResponse(List<int> bytes) {
    return GetLatestBlockResultsResponse.deserialize(bytes);
  }

  @override
  GetLatestBlockResultsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return GetLatestBlockResultsResponse.fromJson(json);
  }
}

/// GetBlockResultsResponse is the response type for the Query/GetBlockResults RPC method.
class GetBlockResultsResponse extends CosmosProtoMessage {
  /// height is the block height.
  final BigInt? height;

  /// txs_results contains the results of each transaction execution.
  final List<tendermint_abci_types.ExecTxResult> txsResults;

  /// finalize_block_events contains consensus-level events emitted during block
  /// finalization, including slashing, jailing, and validator set updates.
  final List<tendermint_abci_types.Event> finalizeBlockEvents;

  /// validator_updates contains the validator updates for this block.
  final List<tendermint_abci_types.ValidatorUpdate> validatorUpdates;

  /// consensus_param_updates contains any consensus parameter updates for this block.
  final tendermint_types_params.ConsensusParams? consensusParamUpdates;

  /// app_hash is the app hash after processing this block.
  final BuBytes? appHash;

  GetBlockResultsResponse({
    this.height,
    this.txsResults = const [],
    this.finalizeBlockEvents = const [],
    this.validatorUpdates = const [],
    this.consensusParamUpdates,
    List<int>? appHash,
  }) : appHash = appHash?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.message(5),
        ProtoFieldConfig.bytes(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    height,
    txsResults,
    finalizeBlockEvents,
    validatorUpdates,
    consensusParamUpdates,
    appHash,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'height': config.encodeBigint(height),
      'txs_results': txsResults.map((e) => config.encodeMessage(e)).toList(),
      'finalize_block_events':
          finalizeBlockEvents.map((e) => config.encodeMessage(e)).toList(),
      'validator_updates':
          validatorUpdates.map((e) => config.encodeMessage(e)).toList(),
      'consensus_param_updates': config.encodeMessage(consensusParamUpdates),
      'app_hash': config.encodeBinary(appHash),
    };
  }

  factory GetBlockResultsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GetBlockResultsResponse(
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      txsResults:
          (json.valueEnsureAsList<dynamic>(
                'txs_results',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  tendermint_abci_types.ExecTxResult,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => tendermint_abci_types.ExecTxResult.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      finalizeBlockEvents:
          (json.valueEnsureAsList<dynamic>(
                'finalize_block_events',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<tendermint_abci_types.Event, Object>(
                  value: e,
                  parse:
                      (v) => tendermint_abci_types.Event.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      validatorUpdates:
          (json.valueEnsureAsList<dynamic>(
                'validator_updates',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  tendermint_abci_types.ValidatorUpdate,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => tendermint_abci_types.ValidatorUpdate.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      consensusParamUpdates: json
          .valueTo<tendermint_types_params.ConsensusParams?, Object>(
            key: 'consensus_param_updates',
            parse:
                (v) => tendermint_types_params.ConsensusParams.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      appHash: config.decodeBinary<List<int>?>(
        json.valueAs('app_hash', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory GetBlockResultsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetBlockResultsResponse(
      height: decode.getBigInt<BigInt?>(1),
      txsResults:
          decode
              .getListOfBytes(2)
              .map((b) => tendermint_abci_types.ExecTxResult.deserialize(b))
              .toList(),
      finalizeBlockEvents:
          decode
              .getListOfBytes(3)
              .map((b) => tendermint_abci_types.Event.deserialize(b))
              .toList(),
      validatorUpdates:
          decode
              .getListOfBytes(4)
              .map((b) => tendermint_abci_types.ValidatorUpdate.deserialize(b))
              .toList(),
      consensusParamUpdates: decode
          .messageTo<tendermint_types_params.ConsensusParams?>(
            5,
            (b) => tendermint_types_params.ConsensusParams.deserialize(b),
          ),
      appHash: decode.getBytes<List<int>?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseTendermintV1beta1GetBlockResultsResponse;
}

/// GetLatestBlockResultsResponse is the response type for the Query/GetLatestBlockResults RPC method.
class GetLatestBlockResultsResponse extends CosmosProtoMessage {
  /// height is the block height.
  final BigInt? height;

  /// txs_results contains the results of each transaction execution.
  final List<tendermint_abci_types.ExecTxResult> txsResults;

  /// finalize_block_events contains consensus-level events emitted during block
  /// finalization, including slashing, jailing, and validator set updates.
  final List<tendermint_abci_types.Event> finalizeBlockEvents;

  /// validator_updates contains the validator updates for this block.
  final List<tendermint_abci_types.ValidatorUpdate> validatorUpdates;

  /// consensus_param_updates contains any consensus parameter updates for this block.
  final tendermint_types_params.ConsensusParams? consensusParamUpdates;

  /// app_hash is the app hash after processing this block.
  final BuBytes? appHash;

  GetLatestBlockResultsResponse({
    this.height,
    this.txsResults = const [],
    this.finalizeBlockEvents = const [],
    this.validatorUpdates = const [],
    this.consensusParamUpdates,
    List<int>? appHash,
  }) : appHash = appHash?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.message(5),
        ProtoFieldConfig.bytes(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    height,
    txsResults,
    finalizeBlockEvents,
    validatorUpdates,
    consensusParamUpdates,
    appHash,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'height': config.encodeBigint(height),
      'txs_results': txsResults.map((e) => config.encodeMessage(e)).toList(),
      'finalize_block_events':
          finalizeBlockEvents.map((e) => config.encodeMessage(e)).toList(),
      'validator_updates':
          validatorUpdates.map((e) => config.encodeMessage(e)).toList(),
      'consensus_param_updates': config.encodeMessage(consensusParamUpdates),
      'app_hash': config.encodeBinary(appHash),
    };
  }

  factory GetLatestBlockResultsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GetLatestBlockResultsResponse(
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      txsResults:
          (json.valueEnsureAsList<dynamic>(
                'txs_results',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  tendermint_abci_types.ExecTxResult,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => tendermint_abci_types.ExecTxResult.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      finalizeBlockEvents:
          (json.valueEnsureAsList<dynamic>(
                'finalize_block_events',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<tendermint_abci_types.Event, Object>(
                  value: e,
                  parse:
                      (v) => tendermint_abci_types.Event.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      validatorUpdates:
          (json.valueEnsureAsList<dynamic>(
                'validator_updates',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  tendermint_abci_types.ValidatorUpdate,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => tendermint_abci_types.ValidatorUpdate.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      consensusParamUpdates: json
          .valueTo<tendermint_types_params.ConsensusParams?, Object>(
            key: 'consensus_param_updates',
            parse:
                (v) => tendermint_types_params.ConsensusParams.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      appHash: config.decodeBinary<List<int>?>(
        json.valueAs('app_hash', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory GetLatestBlockResultsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetLatestBlockResultsResponse(
      height: decode.getBigInt<BigInt?>(1),
      txsResults:
          decode
              .getListOfBytes(2)
              .map((b) => tendermint_abci_types.ExecTxResult.deserialize(b))
              .toList(),
      finalizeBlockEvents:
          decode
              .getListOfBytes(3)
              .map((b) => tendermint_abci_types.Event.deserialize(b))
              .toList(),
      validatorUpdates:
          decode
              .getListOfBytes(4)
              .map((b) => tendermint_abci_types.ValidatorUpdate.deserialize(b))
              .toList(),
      consensusParamUpdates: decode
          .messageTo<tendermint_types_params.ConsensusParams?>(
            5,
            (b) => tendermint_types_params.ConsensusParams.deserialize(b),
          ),
      appHash: decode.getBytes<List<int>?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseTendermintV1beta1GetLatestBlockResultsResponse;
}
