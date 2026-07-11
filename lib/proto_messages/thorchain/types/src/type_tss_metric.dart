import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class NodeTssTime extends CosmosProtoMessage {
  final List<int>? address;

  final BigInt? tssTime;

  const NodeTssTime({this.address, this.tssTime});

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
  Map<String, dynamic> toJson() {
    return {
      'address': switch (address) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'tss_time': tssTime?.toString(),
    };
  }

  factory NodeTssTime.fromJson(Map<String, dynamic> json) {
    return NodeTssTime(
      address: json.valueAsBytes<List<int>?>(
        'address',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      tssTime: json.valueAsBigInt<BigInt?>('tss_time', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'pub_key': pubKey,
      'node_tss_times': nodeTssTimes.map((e) => e.toJson()).toList(),
    };
  }

  factory TssKeygenMetric.fromJson(Map<String, dynamic> json) {
    return TssKeygenMetric(
      pubKey: json.valueAsString<String?>('pub_key', acceptCamelCase: true),
      nodeTssTimes:
          (json.valueEnsureAsList<dynamic>(
                'node_tss_times',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<NodeTssTime, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => NodeTssTime.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {
      'tx_id': txId,
      'node_tss_times': nodeTssTimes.map((e) => e.toJson()).toList(),
    };
  }

  factory TssKeysignMetric.fromJson(Map<String, dynamic> json) {
    return TssKeysignMetric(
      txId: json.valueAsString<String?>('tx_id', acceptCamelCase: true),
      nodeTssTimes:
          (json.valueEnsureAsList<dynamic>(
                'node_tss_times',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<NodeTssTime, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => NodeTssTime.fromJson(v),
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
