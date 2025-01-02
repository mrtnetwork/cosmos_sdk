import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainFee extends CosmosMessage {
  final List<ThorchainCoin> coins;
  final String poolDeduct;
  ThorchainFee({required List<ThorchainCoin> coins, required this.poolDeduct})
      : coins = coins.immutable;
  factory ThorchainFee.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainFee(
      coins: decode
          .getFields<List<int>>(1)
          .map((e) => ThorchainCoin.deserialize(e))
          .toList(),
      poolDeduct: decode.getField(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "coins": coins.map((e) => e.toJson()).toList(),
      "pool_deduct": poolDeduct
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.fee;

  @override
  List get values => [coins, poolDeduct];
}
