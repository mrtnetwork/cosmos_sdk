import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class SwapperClout extends CosmosProtoMessage {
  final String? address;

  final String? score;

  final String? reclaimed;

  final String? spent;

  final BigInt? lastSpentHeight;

  final BigInt? lastReclaimHeight;

  const SwapperClout({
    this.address,
    this.score,
    this.reclaimed,
    this.spent,
    this.lastSpentHeight,
    this.lastReclaimHeight,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.int64(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    address,
    score,
    reclaimed,
    spent,
    lastSpentHeight,
    lastReclaimHeight,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'address': address,
      'score': score,
      'reclaimed': reclaimed,
      'spent': spent,
      'last_spent_height': config.encodeBigint(lastSpentHeight),
      'last_reclaim_height': config.encodeBigint(lastReclaimHeight),
    };
  }

  factory SwapperClout.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SwapperClout(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      score: json.valueAsString<String?>(
        'score',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      reclaimed: json.valueAsString<String?>(
        'reclaimed',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      spent: json.valueAsString<String?>(
        'spent',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lastSpentHeight: json.valueAsBigInt<BigInt?>(
        'last_spent_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lastReclaimHeight: json.valueAsBigInt<BigInt?>(
        'last_reclaim_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory SwapperClout.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SwapperClout(
      address: decode.getString<String?>(1),
      score: decode.getString<String?>(2),
      reclaimed: decode.getString<String?>(3),
      spent: decode.getString<String?>(4),
      lastSpentHeight: decode.getBigInt<BigInt?>(5),
      lastReclaimHeight: decode.getBigInt<BigInt?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesSwapperClout;
}
