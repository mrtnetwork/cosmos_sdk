import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventWithdraw extends CosmosMessage {
  final ThorchainAsset pool;
  final BigInt providerUnits;
  final BigInt? basisPoints;
  final List<int> asymmetry;
  final ThorchainTx inTx;
  final BigInt emitAsset;
  final BigInt emitRune;
  final BigInt impLossProtection;
  ThorchainEventWithdraw(
      {required this.pool,
      required this.providerUnits,
      this.basisPoints,
      required List<int> asymmetry,
      required this.inTx,
      required this.emitAsset,
      required this.emitRune,
      required this.impLossProtection})
      : asymmetry = BytesUtils.toBytes(asymmetry, unmodifiable: true);
  factory ThorchainEventWithdraw.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventWithdraw(
        pool: ThorchainAsset.deserialize(decode.getField(1)),
        providerUnits: BigInt.parse(decode.getField(2)),
        basisPoints: decode.getField(3),
        asymmetry: decode.getField(4),
        inTx: ThorchainTx.deserialize(decode.getField(5)),
        emitAsset: BigInt.parse(decode.getField(6)),
        emitRune: BigInt.parse(decode.getField(7)),
        impLossProtection: BigInt.parse(decode.getField(8)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool": pool.toJson(),
      "provider_units": providerUnits.toString(),
      "basis_points": basisPoints?.toString(),
      "asymmetry": BytesUtils.toHexString(asymmetry),
      "in_tx": inTx.toJson(),
      "emit_asset": emitAsset.toString(),
      "emit_rune": emitRune.toString(),
      "imp_loss_protection": impLossProtection.toString()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.eventWithdraw.typeUrl;

  @override
  List get values => [
        pool,
        providerUnits.toString(),
        basisPoints,
        asymmetry,
        inTx,
        emitAsset.toString(),
        emitRune.toString(),
        impLossProtection.toString()
      ];
}
