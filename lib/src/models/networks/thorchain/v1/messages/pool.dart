import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainPool extends CosmosMessage {
  final BigInt balanceRune;
  final BigInt balanceAsset;
  final ThorchainAsset asset;
  final BigInt lpUnits;
  final ThorchainPoolStatus? status;
  final BigInt? statusSince;
  final BigInt? decimals;
  final BigInt synthUnits;
  final BigInt pendingInboundRune;
  final BigInt pendingInboundAsset;
  const ThorchainPool(
      {required this.balanceRune,
      required this.balanceAsset,
      required this.asset,
      required this.lpUnits,
      this.status,
      this.statusSince,
      this.decimals,
      required this.synthUnits,
      required this.pendingInboundRune,
      required this.pendingInboundAsset});
  factory ThorchainPool.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainPool(
      balanceRune: BigInt.parse(decode.getField(1)),
      balanceAsset: BigInt.parse(decode.getField(2)),
      asset: ThorchainAsset.deserialize(decode.getField(3)),
      lpUnits: BigInt.parse(decode.getField(4)),
      status: decode.getResult(5)?.to<ThorchainPoolStatus, int>(
          (e) => ThorchainPoolStatus.fromValue(e)),
      statusSince: decode.getField(10),
      decimals: decode.getField(6),
      synthUnits: BigInt.parse(decode.getField(7)),
      pendingInboundRune: BigInt.parse(decode.getField(8)),
      pendingInboundAsset: BigInt.parse(decode.getField(9)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Map<String, dynamic> toJson() {
    return {
      "balance_rune": balanceRune.toString(),
      "balance_asset": balanceAsset.toString(),
      "asset": asset.toJson(),
      "LP_units": lpUnits.toString(),
      "status": status?.value,
      "status_since": statusSince?.toString(),
      "decimals": decimals?.toString(),
      "synth_units": synthUnits.toString(),
      "pending_inbound_rune": pendingInboundRune.toString(),
      "pending_inbound_asset": pendingInboundAsset.toString()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.pool.typeUrl;

  @override
  List get values => [
        balanceRune.toString(),
        balanceAsset.toString(),
        asset,
        lpUnits.toString(),
        status?.value,
        decimals,
        synthUnits.toString(),
        pendingInboundRune.toString(),
        pendingInboundAsset.toString(),
        statusSince
      ];
}
