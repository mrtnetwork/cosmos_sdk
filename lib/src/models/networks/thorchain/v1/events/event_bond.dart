import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventBond extends CosmosMessage {
  final BigInt amount;
  final ThorchainBondType? bondType;
  final ThorchainTx txIn;
  const ThorchainEventBond(
      {required this.amount, this.bondType, required this.txIn});
  factory ThorchainEventBond.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventBond(
      amount: BigInt.parse(decode.getField(1)),
      bondType: decode
          .getResult(2)
          ?.to<ThorchainBondType, int>((e) => ThorchainBondType.fromValue(e)),
      txIn: ThorchainTx.deserialize(decode.getField(3)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "amount": amount.toString(),
      "bond_type": bondType?.value,
      "tx_in": txIn.toJson()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.eventBond.typeUrl;

  @override
  List get values => [amount.toString(), bondType?.value, txIn];
}
