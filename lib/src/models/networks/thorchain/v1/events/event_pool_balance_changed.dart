import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventPoolBalanceChanged extends CosmosMessage {
  final ThorchainPoolMode poolChange;
  final String? reason;
  const ThorchainEventPoolBalanceChanged({
    required this.poolChange,
    this.reason,
  });
  factory ThorchainEventPoolBalanceChanged.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventPoolBalanceChanged(
      poolChange: ThorchainPoolMode.deserialize(decode.getField(1)),
      reason: decode.getField(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"pool_change": poolChange.toJson(), "reason": reason};
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.eventPoolBalanceChanged;

  @override
  List get values => [poolChange, reason];
}
