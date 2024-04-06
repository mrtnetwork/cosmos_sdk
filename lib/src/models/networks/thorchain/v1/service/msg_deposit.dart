import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/common/coin.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class ThorchainMsgDeposit extends CosmosMessage {
  final List<ThorchainCoin> coins;
  final String memo;
  final List<int> signer;
  ThorchainMsgDeposit(
      {required List<ThorchainCoin> coins,
      required this.memo,
      required List<int> signer})
      : signer = BytesUtils.toBytes(signer, unmodifiable: true),
        coins = coins.mutable;
  factory ThorchainMsgDeposit.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgDeposit(
        coins: decode
            .getFields<List<int>>(1)
            .map((e) => ThorchainCoin.deserialize(e))
            .toList(),
        memo: decode.getField(2),
        signer: decode.getField(3));
  }
  factory ThorchainMsgDeposit.create(
      {required List<ThorchainCoin> coins,
      required List<int> signer,
      required BaseAddress ownerAddress,
      required String chainName,
      required String chainAddress,
      required String chainAsset,
      required String name}) {
    final String memo =
        "~:$name:$chainName:$chainAddress:${ownerAddress.address}:$chainAsset";
    return ThorchainMsgDeposit(coins: coins, signer: signer, memo: memo);
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "coins": coins.map((e) => e.toJson()).toList(),
      "memo": memo,
      "signer": BytesUtils.tryToHexString(signer)
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgDeposit.typeUrl;

  @override
  List get values => [coins, memo, signer];
}
