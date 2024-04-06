import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventRefund extends CosmosMessage {
  final int? code;
  final String? reason;
  final ThorchainTx inTx;
  final ThorchainFee fee;
  const ThorchainEventRefund(
      {this.code, this.reason, required this.inTx, required this.fee});
  factory ThorchainEventRefund.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventRefund(
      code: decode.getField(1),
      reason: decode.getField(2),
      inTx: ThorchainTx.deserialize(decode.getField(3)),
      fee: ThorchainFee.deserialize(decode.getField(4)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "reason": reason,
      "in_tx": inTx.toJson(),
      "fee": fee.toJson()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.eventRefund.typeUrl;

  @override
  List get values => [code, reason, inTx, fee];
}
