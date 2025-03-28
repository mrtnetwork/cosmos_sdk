import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class ThorchainTx extends CosmosMessage {
  final String? id;
  final String? chain;
  final String? fromAddress;
  final String? toAddress;
  final List<ThorchainCoin> coins;
  final List<ThorchainCoin> gas;
  final String? memo;
  ThorchainTx(
      {this.id,
      this.chain,
      this.fromAddress,
      this.toAddress,
      required List<ThorchainCoin> coins,
      required List<ThorchainCoin> gas,
      this.memo})
      : coins = coins.immutable,
        gas = gas.immutable;
  factory ThorchainTx.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainTx(
        id: decode.getField(1),
        chain: decode.getField(2),
        fromAddress: decode.getField(3),
        toAddress: decode.getField(4),
        coins: decode
            .getFields<List<int>>(5)
            .map((e) => ThorchainCoin.deserialize(e))
            .toList(),
        gas: decode
            .getFields<List<int>>(6)
            .map((e) => ThorchainCoin.deserialize(e))
            .toList(),
        memo: decode.getField(7));
  }
  factory ThorchainTx.fromJson(Map<String, dynamic> json) {
    return ThorchainTx(
        id: json.as("id"),
        chain: json.as("chain"),
        fromAddress: json.as("from_address"),
        toAddress: json.as("to_address"),
        coins: json
                .asListOfMap("coins")
                ?.map((e) => ThorchainCoin.fromJson(e))
                .toList() ??
            [],
        gas: json
                .asListOfMap("gas")
                ?.map((e) => ThorchainCoin.fromJson(e))
                .toList() ??
            [],
        memo: json.as("memo"));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "chain": chain,
      "from_address": fromAddress,
      "to_address": toAddress,
      "coins": coins.map((e) => e.toJson()).toList(),
      "gas": gas.map((e) => e.toJson())..toList(),
      "memo": memo
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.tx;

  @override
  List get values => [id, chain, fromAddress, toAddress, coins, gas, memo];
}
