import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventMintBurn extends CosmosMessage {
  final ThorchainMintBurnSupplyType? supply;
  final String? denom;
  final BigInt amount;
  final String? reason;
  const ThorchainEventMintBurn({
    this.supply,
    this.denom,
    required this.amount,
    this.reason,
  });
  factory ThorchainEventMintBurn.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventMintBurn(
      supply: decode
          .getResult(1)
          ?.to<ThorchainMintBurnSupplyType, int>(
            (e) => ThorchainMintBurnSupplyType.fromValue(e),
          ),
      denom: decode.getField(2),
      amount: BigInt.parse(decode.getField(3)),
      reason: decode.getField(4),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "supply": supply?.value,
      "denom": denom,
      "amount": amount.toString(),
      "reason": reason,
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.eventMintBurn;

  @override
  List get values => [supply?.value, denom, amount.toString(), reason];
}
