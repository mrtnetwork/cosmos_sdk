import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainEventSlash extends CosmosMessage {
  final ThorchainAsset pool;
  final List<ThorchainPoolAmt> slashAmount;
  ThorchainEventSlash(
      {required this.pool, required List<ThorchainPoolAmt> slashAmount})
      : slashAmount = slashAmount.immutable;
  factory ThorchainEventSlash.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventSlash(
        pool: ThorchainAsset.deserialize(decode.getField(1)),
        slashAmount: decode
            .getFields<List<int>>(2)
            .map((e) => ThorchainPoolAmt.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool": pool.toJson(),
      "slash_amount": slashAmount.map((e) => e.toJson()).toList()
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.eventSlash;

  @override
  List get values => [pool, slashAmount];
}
