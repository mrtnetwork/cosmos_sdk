import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/tendermint/abci/src/types.dart"
    as tendermint_abci_types;
import "package:cosmos_sdk/proto_messages/cosmos/store/v1beta1/src/listening.dart"
    as cosmos_store_v1beta1_listening;

/// ListenEndBlockRequest is the request type for the ListenEndBlock RPC method
class ListenFinalizeBlockRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ListenFinalizeBlockResponse> {
  final tendermint_abci_types.RequestFinalizeBlock? req;

  final tendermint_abci_types.ResponseFinalizeBlock? res;

  const ListenFinalizeBlockRequest({this.req, this.res});

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
  List<Object?> get protoValues => [req, res];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'req': config.encodeMessage(req), 'res': config.encodeMessage(res)};
  }

  factory ListenFinalizeBlockRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ListenFinalizeBlockRequest(
      req: json.valueTo<tendermint_abci_types.RequestFinalizeBlock?, Object>(
        key: 'req',
        parse:
            (v) => tendermint_abci_types.RequestFinalizeBlock.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      res: json.valueTo<tendermint_abci_types.ResponseFinalizeBlock?, Object>(
        key: 'res',
        parse:
            (v) => tendermint_abci_types.ResponseFinalizeBlock.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ListenFinalizeBlockRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ListenFinalizeBlockRequest(
      req: decode.messageTo<tendermint_abci_types.RequestFinalizeBlock?>(
        1,
        (b) => tendermint_abci_types.RequestFinalizeBlock.deserialize(b),
      ),
      res: decode.messageTo<tendermint_abci_types.ResponseFinalizeBlock?>(
        2,
        (b) => tendermint_abci_types.ResponseFinalizeBlock.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosStoreStreamingAbciListenFinalizeBlockRequest;
  @override
  ListenFinalizeBlockResponse onQueryResponse(List<int> bytes) {
    return ListenFinalizeBlockResponse.deserialize(bytes);
  }

  @override
  ListenFinalizeBlockResponse onQueryResponseJson(Map<String, dynamic> json) {
    return ListenFinalizeBlockResponse.fromJson(json);
  }
}

/// ListenEndBlockResponse is the response type for the ListenEndBlock RPC method
class ListenFinalizeBlockResponse extends CosmosProtoMessage {
  const ListenFinalizeBlockResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
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

  factory ListenFinalizeBlockResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ListenFinalizeBlockResponse();
  }

  factory ListenFinalizeBlockResponse.deserialize(List<int> bytes) {
    return ListenFinalizeBlockResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosStoreStreamingAbciListenFinalizeBlockResponse;
}

/// ListenCommitRequest is the request type for the ListenCommit RPC method
class ListenCommitRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ListenCommitResponse> {
  /// explicitly pass in block height as ResponseCommit does not contain this info
  final BigInt? blockHeight;

  final tendermint_abci_types.ResponseCommit? res;

  final List<cosmos_store_v1beta1_listening.StoreKVPair> changeSet;

  const ListenCommitRequest({
    this.blockHeight,
    this.res,
    this.changeSet = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [blockHeight, res, changeSet];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'block_height': config.encodeBigint(blockHeight),
      'res': config.encodeMessage(res),
      'change_set': changeSet.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory ListenCommitRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ListenCommitRequest(
      blockHeight: json.valueAsBigInt<BigInt?>(
        'block_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      res: json.valueTo<tendermint_abci_types.ResponseCommit?, Object>(
        key: 'res',
        parse:
            (v) => tendermint_abci_types.ResponseCommit.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      changeSet:
          (json.valueEnsureAsList<dynamic>(
                'change_set',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_store_v1beta1_listening.StoreKVPair,
                  Object
                >(
                  value: e,
                  parse:
                      (v) =>
                          cosmos_store_v1beta1_listening.StoreKVPair.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                ),
              )
              .toList(),
    );
  }

  factory ListenCommitRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ListenCommitRequest(
      blockHeight: decode.getBigInt<BigInt?>(1),
      res: decode.messageTo<tendermint_abci_types.ResponseCommit?>(
        2,
        (b) => tendermint_abci_types.ResponseCommit.deserialize(b),
      ),
      changeSet:
          decode
              .getListOfBytes(3)
              .map(
                (b) =>
                    cosmos_store_v1beta1_listening.StoreKVPair.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosStoreStreamingAbciListenCommitRequest;
  @override
  ListenCommitResponse onQueryResponse(List<int> bytes) {
    return ListenCommitResponse.deserialize(bytes);
  }

  @override
  ListenCommitResponse onQueryResponseJson(Map<String, dynamic> json) {
    return ListenCommitResponse.fromJson(json);
  }
}

/// ListenCommitResponse is the response type for the ListenCommit RPC method
class ListenCommitResponse extends CosmosProtoMessage {
  const ListenCommitResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
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

  factory ListenCommitResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ListenCommitResponse();
  }

  factory ListenCommitResponse.deserialize(List<int> bytes) {
    return ListenCommitResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosStoreStreamingAbciListenCommitResponse;
}
