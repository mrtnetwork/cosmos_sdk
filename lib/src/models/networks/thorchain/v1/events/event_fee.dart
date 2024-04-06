import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventFee extends CosmosMessage {
  final String? txId;
  final ThorchainFee fee;
  final BigInt synthUnits;
  const ThorchainEventFee(
      {this.txId, required this.fee, required this.synthUnits});
  factory ThorchainEventFee.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventFee(
      txId: decode.getField(1),
      fee: ThorchainFee.deserialize(decode.getField(2)),
      synthUnits: BigInt.parse(decode.getField(3)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx_id": txId,
      "fee": fee.toJson(),
      "synth_units": synthUnits.toString()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.eventFee.typeUrl;

  @override
  List get values => [txId, fee, synthUnits.toString()];
}
