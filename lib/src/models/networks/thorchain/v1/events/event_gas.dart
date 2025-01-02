import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainEventGas extends CosmosMessage {
  final List<ThorchainGasPool> pools;
  ThorchainEventGas(List<ThorchainGasPool> pools) : pools = pools.immutable;
  factory ThorchainEventGas.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventGas(decode
        .getFields<List<int>>(1)
        .map((e) => ThorchainGasPool.deserialize(e))
        .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pools": pools.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.eventGas;

  @override
  List get values => [pools];
}
