import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainEventRewards extends CosmosMessage {
  final BigInt bondReward;
  final List<ThorchainPoolAmt> poolRewards;
  ThorchainEventRewards(
      {required this.bondReward, required List<ThorchainPoolAmt> poolRewards})
      : poolRewards = poolRewards.immutable;
  factory ThorchainEventRewards.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventRewards(
      bondReward: BigInt.parse(decode.getField(1)),
      poolRewards: decode
          .getFields<List<int>>(2)
          .map((e) => ThorchainPoolAmt.deserialize(e))
          .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "bond_reward": bondReward.toString(),
      "pool_rewards": poolRewards.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.eventRewards.typeUrl;

  @override
  List get values => [bondReward.toString(), poolRewards];
}
