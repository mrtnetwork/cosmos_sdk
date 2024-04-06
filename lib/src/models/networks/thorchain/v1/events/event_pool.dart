import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventPool extends CosmosMessage {
  final ThorchainAsset pool;
  final ThorchainPoolStatus? status;
  const ThorchainEventPool({required this.pool, this.status});
  factory ThorchainEventPool.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventPool(
        pool: ThorchainAsset.deserialize(decode.getField(1)),
        status: decode.getResult(2)?.to<ThorchainPoolStatus, int>(
            (e) => ThorchainPoolStatus.fromValue(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"pool": pool.toJson(), "status": status?.value};
  }

  @override
  String get typeUrl => ThorchainV1Types.eventPool.typeUrl;

  @override
  List get values => [pool, status?.value];
}
