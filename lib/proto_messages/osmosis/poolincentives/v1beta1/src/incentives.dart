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
  Map<String, dynamic> toJson() {
    return {'minted_denom': mintedDenom};
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      mintedDenom: json.valueAsString<String?>(
        'minted_denom',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'total_weight': totalWeight,
      'records': records.map((e) => e.toJson()).toList(),
    };
  }

  factory DistrInfo.fromJson(Map<String, dynamic> json) {
    return DistrInfo(
      totalWeight: json.valueAsString<String?>(
        'total_weight',
        acceptCamelCase: true,
      ),
      records:
          (json.valueEnsureAsList<dynamic>('records', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<DistrRecord, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => DistrRecord.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {'gauge_id': gaugeId?.toString(), 'weight': weight};
  }

  factory DistrRecord.fromJson(Map<String, dynamic> json) {
    return DistrRecord(
      gaugeId: json.valueAsBigInt<BigInt?>('gauge_id', acceptCamelCase: true),
      weight: json.valueAsString<String?>('weight', acceptCamelCase: true),
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
