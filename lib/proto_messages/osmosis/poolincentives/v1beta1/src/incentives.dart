import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class Params extends CosmosProtoMessage {
  /// minted_denom is the denomination of the coin expected to be minted by the
  /// minting module. Pool-incentives module doesn’t actually mint the coin
  /// itself, but rather manages the distribution of coins that matches the
  /// defined minted_denom.
  final String? mintedDenom;

  const Params({this.mintedDenom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [mintedDenom];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'minted_denom': mintedDenom};
  }

  factory Params.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Params(
      mintedDenom: json.valueAsString<String?>(
        'minted_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(mintedDenom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolincentivesV1beta1Params;
}

class DistrInfo extends CosmosProtoMessage {
  final String? totalWeight;

  final List<DistrRecord> records;

  const DistrInfo({this.totalWeight, this.records = const []});

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
  List<Object?> get protoValues => [totalWeight, records];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'total_weight': totalWeight,
      'records': records.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory DistrInfo.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return DistrInfo(
      totalWeight: json.valueAsString<String?>(
        'total_weight',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      records:
          (json.valueEnsureAsList<dynamic>(
                'records',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<DistrRecord, Object>(
                  value: e,
                  parse:
                      (v) => DistrRecord.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory DistrInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DistrInfo(
      totalWeight: decode.getString<String?>(1),
      records:
          decode
              .getListOfBytes(2)
              .map((b) => DistrRecord.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolincentivesV1beta1DistrInfo;
}

class DistrRecord extends CosmosProtoMessage {
  final BigInt? gaugeId;

  final String? weight;

  const DistrRecord({this.gaugeId, this.weight});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [gaugeId, weight];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'gauge_id': config.encodeBigint(gaugeId), 'weight': weight};
  }

  factory DistrRecord.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return DistrRecord(
      gaugeId: json.valueAsBigInt<BigInt?>(
        'gauge_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      weight: json.valueAsString<String?>(
        'weight',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory DistrRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DistrRecord(
      gaugeId: decode.getBigInt<BigInt?>(1),
      weight: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolincentivesV1beta1DistrRecord;
}
