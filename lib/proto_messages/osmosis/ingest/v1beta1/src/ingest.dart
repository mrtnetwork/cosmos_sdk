import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// PoolData represents a structure encapsulating an Osmosis liquidity pool.
class PoolData extends CosmosProtoMessage {
  /// ChainModel is the chain representation model of the pool.
  final List<int>? chainModel;

  /// SqsModel is additional pool data used by the sidecar query server.
  final List<int>? sqsModel;

  /// TickModel is the tick data of a concentrated liquidity pool.
  /// This field is only valid and set for concentrated pools. It is nil
  /// otherwise.
  final List<int>? tickModel;

  const PoolData({this.chainModel, this.sqsModel, this.tickModel});

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
  Map<String, dynamic> toJson() {
    return {
      'chain_model': switch (chainModel) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'sqs_model': switch (sqsModel) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'tick_model': switch (tickModel) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory PoolData.fromJson(Map<String, dynamic> json) {
    return PoolData(
      chainModel: json.valueAsBytes<List<int>?>(
        'chain_model',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      sqsModel: json.valueAsBytes<List<int>?>(
        'sqs_model',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      tickModel: json.valueAsBytes<List<int>?>(
        'tick_model',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  final List<int>? takerFeesMap;

  /// pools in the block.
  final List<PoolData> pools;

  const ProcessBlockRequest({
    this.blockHeight,
    this.takerFeesMap,
    this.pools = const [],
  });

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
  Map<String, dynamic> toJson() {
    return {
      'block_height': blockHeight?.toString(),
      'taker_fees_map': switch (takerFeesMap) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'pools': pools.map((e) => e.toJson()).toList(),
    };
  }

  factory ProcessBlockRequest.fromJson(Map<String, dynamic> json) {
    return ProcessBlockRequest(
      blockHeight: json.valueAsBigInt<BigInt?>(
        'block_height',
        acceptCamelCase: true,
      ),
      takerFeesMap: json.valueAsBytes<List<int>?>(
        'taker_fees_map',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      pools:
          (json.valueEnsureAsList<dynamic>('pools', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<PoolData, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => PoolData.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory ProcessBlockReply.fromJson(Map<String, dynamic> json) {
    return ProcessBlockReply();
  }

  factory ProcessBlockReply.deserialize(List<int> bytes) {
    return ProcessBlockReply();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIngestV1beta1ProcessBlockReply;
}
