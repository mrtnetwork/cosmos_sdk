import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainPoolAmt extends CosmosMessage {
  final ThorchainAsset asset;
  final BigInt? amount;
  const ThorchainPoolAmt({required this.asset, this.amount});
  factory ThorchainPoolAmt.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainPoolAmt(
        asset: ThorchainAsset.deserialize(decode.getField(1)),
        amount: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"asset": asset.toJson(), "amount": amount?.toString()};
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.poolAmt;

  @override
  List get values => [asset, amount];
}
