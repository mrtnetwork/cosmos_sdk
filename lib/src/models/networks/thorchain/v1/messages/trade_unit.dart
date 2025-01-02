import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainTradeUnit extends CosmosMessage {
  final ThorchainAsset asset;
  final BigInt units;
  final BigInt depth;
  const ThorchainTradeUnit(
      {required this.asset, required this.units, required this.depth});
  factory ThorchainTradeUnit.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainTradeUnit(
      asset: ThorchainAsset.deserialize(decode.getField(1)),
      units: BigInt.parse(decode.getField(2)),
      depth: BigInt.parse(decode.getField(3)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "asset": asset.toJson(),
      "units": units.toString(),
      "depth": depth.toString()
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.tradeUnit;

  @override
  List get values => [asset, units, depth];
}
