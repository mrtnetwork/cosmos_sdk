import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainRagnarokWithdrawPosition extends CosmosMessage {
  final BigInt? number;
  final ThorchainAsset pool;
  const ThorchainRagnarokWithdrawPosition({this.number, required this.pool});
  factory ThorchainRagnarokWithdrawPosition.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainRagnarokWithdrawPosition(
      number: decode.getField(1),
      pool: ThorchainAsset.deserialize(decode.getField(2)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"number": number?.toString(), "pool": pool.toJson()};
  }

  @override
  String get typeUrl => ThorchainV1Types.ragnarokWithdrawPosition.typeUrl;

  @override
  List get values => [number, pool];
}
