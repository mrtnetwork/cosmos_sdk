import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class ThorchainEventErrata extends CosmosMessage {
  final String? txId;
  final List<ThorchainPoolMode> pools;
  ThorchainEventErrata({this.txId, required List<ThorchainPoolMode> pools})
      : pools = pools.mutable;
  factory ThorchainEventErrata.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventErrata(
        txId: decode.getField(1),
        pools: decode
            .getFields(2)
            .map((e) => ThorchainPoolMode.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"tx_id": txId, "pools": pools.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl => ThorchainV1Types.eventErrata.typeUrl;

  @override
  List get values => [txId, pools];
}
