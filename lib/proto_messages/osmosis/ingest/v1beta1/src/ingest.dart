import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// PoolData represents a structure encapsulating an Osmosis liquidity pool.
class PoolData extends CosmosProtoMessage {
  /// ChainModel is the chain representation model of the pool.
  final BuBytes? chainModel;

  /// SqsModel is additional pool data used by the sidecar query server.
  final BuBytes? sqsModel;

  /// TickModel is the tick data of a concentrated liquidity pool.
  /// This field is only valid and set for concentrated pools. It is nil
  /// otherwise.
  final BuBytes? tickModel;

  PoolData({List<int>? chainModel, List<int>? sqsModel, List<int>? tickModel})
    : chainModel = chainModel?.asImmutableBytes,
      sqsModel = sqsModel?.asImmutableBytes,
      tickModel = tickModel?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.bytes(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [chainModel, sqsModel, tickModel];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'chain_model': config.encodeBinary(chainModel),
      'sqs_model': config.encodeBinary(sqsModel),
      'tick_model': config.encodeBinary(tickModel),
    };
  }

  factory PoolData.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PoolData(
      chainModel: config.decodeBinary<List<int>?>(
        json.valueAs('chain_model', normalizeKeyLookup: config.normalizeKeys),
      ),
      sqsModel: config.decodeBinary<List<int>?>(
        json.valueAs('sqs_model', normalizeKeyLookup: config.normalizeKeys),
      ),
      tickModel: config.decodeBinary<List<int>?>(
        json.valueAs('tick_model', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory PoolData.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PoolData(
      chainModel: decode.getBytes<List<int>?>(1),
      sqsModel: decode.getBytes<List<int>?>(2),
      tickModel: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIngestV1beta1PoolData;
}

/// ProcessBlock
/// //////////////////////////////////////////////////////////////////
/// The block process request.
/// Sends taker fees, block height and pools.
class ProcessBlockRequest extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<ProcessBlockReply> {
  /// block height is the height of the block being processed.
  final BigInt? blockHeight;

  /// taker_fees_map is the map of taker fees for the block.
  final BuBytes? takerFeesMap;

  /// pools in the block.
  final List<PoolData> pools;

  ProcessBlockRequest({
    this.blockHeight,
    List<int>? takerFeesMap,
    this.pools = const [],
  }) : takerFeesMap = takerFeesMap?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [blockHeight, takerFeesMap, pools];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'block_height': config.encodeBigint(blockHeight),
      'taker_fees_map': config.encodeBinary(takerFeesMap),
      'pools': pools.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory ProcessBlockRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ProcessBlockRequest(
      blockHeight: json.valueAsBigInt<BigInt?>(
        'block_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      takerFeesMap: config.decodeBinary<List<int>?>(
        json.valueAs(
          'taker_fees_map',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      pools:
          (json.valueEnsureAsList<dynamic>(
                'pools',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<PoolData, Object>(
                  value: e,
                  parse:
                      (v) => PoolData.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory ProcessBlockRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ProcessBlockRequest(
      blockHeight: decode.getBigInt<BigInt?>(1),
      takerFeesMap: decode.getBytes<List<int>?>(2),
      pools:
          decode.getListOfBytes(3).map((b) => PoolData.deserialize(b)).toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIngestV1beta1ProcessBlockRequest;
  @override
  ProcessBlockReply onServiceResponse(List<int> bytes) {
    return ProcessBlockReply.deserialize(bytes);
  }

  @override
  ProcessBlockReply onServiceResponseJson(Map<String, dynamic> json) {
    return ProcessBlockReply.fromJson(json);
  }
}

/// The response after completing the block processing.
class ProcessBlockReply extends CosmosProtoMessage {
  const ProcessBlockReply();

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

  factory ProcessBlockReply.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ProcessBlockReply();
  }

  factory ProcessBlockReply.deserialize(List<int> bytes) {
    return ProcessBlockReply();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIngestV1beta1ProcessBlockReply;
}
