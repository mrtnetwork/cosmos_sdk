import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class NodeTssTime extends CosmosProtoMessage {
  final BuBytes? address;

  final BigInt? tssTime;

  NodeTssTime({List<int>? address, this.tssTime})
    : address = address?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(1, options: const []),
        ProtoFieldConfig.int64(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, tssTime];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'address': config.encodeBinary(address),
      'tss_time': config.encodeBigint(tssTime),
    };
  }

  factory NodeTssTime.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return NodeTssTime(
      address: config.decodeBinary<List<int>?>(
        json.valueAs('address', normalizeKeyLookup: config.normalizeKeys),
      ),
      tssTime: json.valueAsBigInt<BigInt?>(
        'tss_time',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory NodeTssTime.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return NodeTssTime(
      address: decode.getBytes<List<int>?>(1),
      tssTime: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesNodeTssTime;
}

class TssKeygenMetric extends CosmosProtoMessage {
  final String? pubKey;

  final List<NodeTssTime> nodeTssTimes;

  const TssKeygenMetric({this.pubKey, this.nodeTssTimes = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [pubKey, nodeTssTimes];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pub_key': pubKey,
      'node_tss_times':
          nodeTssTimes.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory TssKeygenMetric.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TssKeygenMetric(
      pubKey: json.valueAsString<String?>(
        'pub_key',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      nodeTssTimes:
          (json.valueEnsureAsList<dynamic>(
                'node_tss_times',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<NodeTssTime, Object>(
                  value: e,
                  parse:
                      (v) => NodeTssTime.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory TssKeygenMetric.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TssKeygenMetric(
      pubKey: decode.getString<String?>(1),
      nodeTssTimes:
          decode
              .getListOfBytes(2)
              .map((b) => NodeTssTime.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesTssKeygenMetric;
}

class TssKeysignMetric extends CosmosProtoMessage {
  final String? txId;

  final List<NodeTssTime> nodeTssTimes;

  const TssKeysignMetric({this.txId, this.nodeTssTimes = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [txId, nodeTssTimes];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'tx_id': txId,
      'node_tss_times':
          nodeTssTimes.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory TssKeysignMetric.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TssKeysignMetric(
      txId: json.valueAsString<String?>(
        'tx_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      nodeTssTimes:
          (json.valueEnsureAsList<dynamic>(
                'node_tss_times',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<NodeTssTime, Object>(
                  value: e,
                  parse:
                      (v) => NodeTssTime.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory TssKeysignMetric.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TssKeysignMetric(
      txId: decode.getString<String?>(1),
      nodeTssTimes:
          decode
              .getListOfBytes(2)
              .map((b) => NodeTssTime.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesTssKeysignMetric;
}
