import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventReserve extends CosmosMessage {
  final ThorchainReserveContributor reserveContributor;
  final ThorchainTx inTx;
  const ThorchainEventReserve({
    required this.reserveContributor,
    required this.inTx,
  });
  factory ThorchainEventReserve.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventReserve(
      reserveContributor: ThorchainReserveContributor.deserialize(
        decode.getField(1),
      ),
      inTx: ThorchainTx.deserialize(decode.getField(2)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "reserve_contributor": reserveContributor.toJson(),
      "in_tx": inTx.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.eventReserve;

  @override
  List get values => [reserveContributor, inTx];
}
