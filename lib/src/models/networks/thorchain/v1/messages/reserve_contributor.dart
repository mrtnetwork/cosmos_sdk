import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainReserveContributor extends CosmosMessage {
  final String? address;
  final BigInt amount;
  const ThorchainReserveContributor({this.address, required this.amount});
  factory ThorchainReserveContributor.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainReserveContributor(
      address: decode.getField(1),
      amount: BigintUtils.parse(decode.getField<String>(2)),
    );
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "address": address,
      "amount": amount.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.reserveContributor;

  @override
  List get values => [address, amount.toString()];
}
