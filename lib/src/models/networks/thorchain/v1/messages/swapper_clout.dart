import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainSwapperClout extends CosmosMessage {
  final String? address;
  final BigInt score;
  final BigInt reclaimed;
  final BigInt spent;
  final BigInt? lastSpentHeight;
  final BigInt? lastReclaimHeight;
  const ThorchainSwapperClout(
      {this.address,
      required this.score,
      required this.reclaimed,
      required this.spent,
      this.lastSpentHeight,
      this.lastReclaimHeight});
  factory ThorchainSwapperClout.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainSwapperClout(
      address: decode.getField(1),
      score: BigintUtils.parse(decode.getField<String>(2)),
      reclaimed: BigintUtils.parse(decode.getField<String>(3)),
      spent: BigintUtils.parse(decode.getField<String>(4)),
      lastSpentHeight: decode.getField(5),
      lastReclaimHeight: decode.getField(6),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "address": address,
      "score": score.toString(),
      "reclaimed": reclaimed.toString(),
      "spent": spent.toString(),
      "last_spent_height": lastSpentHeight?.toString(),
      "last_reclaim_height": lastReclaimHeight?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.swapperClout;

  @override
  List get values => [
        address,
        score.toString(),
        reclaimed.toString(),
        spent.toString(),
        lastSpentHeight,
        lastReclaimHeight
      ];
}
