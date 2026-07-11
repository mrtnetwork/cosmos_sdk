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
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'score': score,
      'reclaimed': reclaimed,
      'spent': spent,
      'last_spent_height': lastSpentHeight?.toString(),
      'last_reclaim_height': lastReclaimHeight?.toString(),
    };
  }

  factory SwapperClout.fromJson(Map<String, dynamic> json) {
    return SwapperClout(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      score: json.valueAsString<String?>('score', acceptCamelCase: true),
      reclaimed: json.valueAsString<String?>(
        'reclaimed',
        acceptCamelCase: true,
      ),
      spent: json.valueAsString<String?>('spent', acceptCamelCase: true),
      lastSpentHeight: json.valueAsBigInt<BigInt?>(
        'last_spent_height',
        acceptCamelCase: true,
      ),
      lastReclaimHeight: json.valueAsBigInt<BigInt?>(
        'last_reclaim_height',
        acceptCamelCase: true,
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
