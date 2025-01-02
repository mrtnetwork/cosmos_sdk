import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainTxOutItem extends CosmosMessage {
  final String? chain;
  final String? toAddress;
  final String? vaultPubKey;
  final ThorchainCoin coin;
  final String? memo;
  final List<ThorchainCoin> maxGas;
  final BigInt? gasRate;
  final String? inHash;
  final String? outHash;
  final String? moduleName;
  final String? aggregator;
  final String? aggregatorTargetAsset;
  final String aggregatorTargetLimit;
  final String cloutSpent;
  ThorchainTxOutItem(
      {this.chain,
      this.toAddress,
      this.vaultPubKey,
      required this.coin,
      this.memo,
      required List<ThorchainCoin> maxGas,
      this.gasRate,
      this.inHash,
      this.outHash,
      this.moduleName,
      this.aggregator,
      this.aggregatorTargetAsset,
      required this.aggregatorTargetLimit,
      required this.cloutSpent})
      : maxGas = maxGas.immutable;
  factory ThorchainTxOutItem.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainTxOutItem(
      chain: decode.getField(1),
      toAddress: decode.getField(2),
      vaultPubKey: decode.getField(3),
      coin: ThorchainCoin.deserialize(decode.getField(4)),
      memo: decode.getField(5),
      maxGas: decode
          .getFields<List<int>>(6)
          .map((e) => ThorchainCoin.deserialize(e))
          .toList(),
      gasRate: decode.getField(7),
      inHash: decode.getField(8),
      outHash: decode.getField(9),
      moduleName: decode.getField(10),
      aggregator: decode.getField(11),
      aggregatorTargetAsset: decode.getField(12),
      aggregatorTargetLimit: decode.getField(13),
      cloutSpent: decode.getField(14),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];

  @override
  Map<String, dynamic> toJson() {
    return {
      "chain": chain,
      "to_address": toAddress,
      "vault_pub_key": vaultPubKey,
      "coin": coin.toJson(),
      "memo": memo,
      "max_gas": maxGas.map((e) => e.toJson()).toList(),
      "gas_rate": gasRate?.toString(),
      "in_hash": inHash,
      "out_hash": outHash,
      "module_name": moduleName,
      "aggregator": aggregator,
      "aggregator_target_asset": aggregatorTargetAsset,
      "aggregator_target_limit": aggregatorTargetLimit,
      "clout_spent": cloutSpent
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.txOutItem;

  @override
  List get values => [
        chain,
        toAddress,
        vaultPubKey,
        coin,
        memo,
        maxGas,
        gasRate,
        inHash,
        outHash,
        moduleName,
        aggregator,
        aggregatorTargetAsset,
        aggregatorTargetLimit,
        cloutSpent
      ];
}
