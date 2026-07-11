import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// MetricStatus indicates whether the Metric update ICA has been sent
enum MetricStatus implements ProtoEnumVariant {
  metricStatusUnspecified(0, 'METRIC_STATUS_UNSPECIFIED'),
  metricStatusQueued(1, 'METRIC_STATUS_QUEUED'),
  metricStatusInProgress(2, 'METRIC_STATUS_IN_PROGRESS');

  const MetricStatus(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static MetricStatus fromValue(int? value) {
    return MetricStatus.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () => throw ItemNotFoundException(name: "MetricStatus", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static MetricStatus from(Object? value) {
    return MetricStatus.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () => throw ItemNotFoundException(name: "MetricStatus", value: value),
    );
  }
}

/// Oracle structure stores context about the CW oracle sitting a different chain
class Oracle extends CosmosProtoMessage {
  final String? chainId;

  final String? connectionId;

  final String? channelId;

  final String? portId;

  final String? icaAddress;

  final String? contractAddress;

  final bool? active;

  const Oracle({
    this.chainId,
    this.connectionId,
    this.channelId,
    this.portId,
    this.icaAddress,
    this.contractAddress,
    this.active,
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
        ProtoFieldConfig.bool(7),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    chainId,
    connectionId,
    channelId,
    portId,
    icaAddress,
    contractAddress,
    active,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'chain_id': chainId,
      'connection_id': connectionId,
      'channel_id': channelId,
      'port_id': portId,
      'ica_address': icaAddress,
      'contract_address': contractAddress,
      'active': active,
    };
  }

  factory Oracle.fromJson(Map<String, dynamic> json) {
    return Oracle(
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      connectionId: json.valueAsString<String?>(
        'connection_id',
        acceptCamelCase: true,
      ),
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
      icaAddress: json.valueAsString<String?>(
        'ica_address',
        acceptCamelCase: true,
      ),
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        acceptCamelCase: true,
      ),
      active: json.valueAsBool<bool?>('active', acceptCamelCase: true),
    );
  }

  factory Oracle.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Oracle(
      chainId: decode.getString<String?>(1),
      connectionId: decode.getString<String?>(2),
      channelId: decode.getString<String?>(3),
      portId: decode.getString<String?>(4),
      icaAddress: decode.getString<String?>(5),
      contractAddress: decode.getString<String?>(6),
      active: decode.getBool<bool?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcaoracleOracle;
}

/// Metric structure stores a generic metric using a key value structure
/// along with additional context
class Metric extends CosmosProtoMessage {
  final String? key;

  final String? value;

  final String? metricType;

  final BigInt? updateTime;

  final BigInt? blockHeight;

  final String? attributes;

  final String? destinationOracle;

  final MetricStatus? status;

  const Metric({
    this.key,
    this.value,
    this.metricType,
    this.updateTime,
    this.blockHeight,
    this.attributes,
    this.destinationOracle,
    this.status,
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
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.string(7),
        ProtoFieldConfig.enumType(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    key,
    value,
    metricType,
    updateTime,
    blockHeight,
    attributes,
    destinationOracle,
    status,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'value': value,
      'metric_type': metricType,
      'update_time': updateTime?.toString(),
      'block_height': blockHeight?.toString(),
      'attributes': attributes,
      'destination_oracle': destinationOracle,
      'status': status?.protoName,
    };
  }

  factory Metric.fromJson(Map<String, dynamic> json) {
    return Metric(
      key: json.valueAsString<String?>('key', acceptCamelCase: true),
      value: json.valueAsString<String?>('value', acceptCamelCase: true),
      metricType: json.valueAsString<String?>(
        'metric_type',
        acceptCamelCase: true,
      ),
      updateTime: json.valueAsBigInt<BigInt?>(
        'update_time',
        acceptCamelCase: true,
      ),
      blockHeight: json.valueAsBigInt<BigInt?>(
        'block_height',
        acceptCamelCase: true,
      ),
      attributes: json.valueAsString<String?>(
        'attributes',
        acceptCamelCase: true,
      ),
      destinationOracle: json.valueAsString<String?>(
        'destination_oracle',
        acceptCamelCase: true,
      ),
      status: json.valueTo<MetricStatus?, Object?>(
        key: 'status',
        parse: (v) => MetricStatus.from(v),
      ),
    );
  }

  factory Metric.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Metric(
      key: decode.getString<String?>(1),
      value: decode.getString<String?>(2),
      metricType: decode.getString<String?>(3),
      updateTime: decode.getBigInt<BigInt?>(4),
      blockHeight: decode.getBigInt<BigInt?>(5),
      attributes: decode.getString<String?>(6),
      destinationOracle: decode.getString<String?>(7),
      status: decode.getEnum<MetricStatus?>(8, MetricStatus.values),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcaoracleMetric;
}
