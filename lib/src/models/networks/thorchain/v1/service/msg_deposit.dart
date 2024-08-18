import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/common/coin.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class ThorchainMsgDeposit extends CosmosMessage with ServiceMessage {
  final List<ThorchainCoin> coins;
  final String memo;
  final CosmosBaseAddress signer;
  ThorchainMsgDeposit(
      {required List<ThorchainCoin> coins,
      required this.memo,
      required this.signer})
      : coins = coins.immutable;
  factory ThorchainMsgDeposit.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgDeposit(
        coins: decode
            .getFields<List<int>>(1)
            .map((e) => ThorchainCoin.deserialize(e))
            .toList(),
        memo: decode.getField(2),
        signer: CosmosBaseAddress.fromBytes(decode.getField(3)));
  }
  factory ThorchainMsgDeposit.create(
      {required List<ThorchainCoin> coins,
      required CosmosBaseAddress signer,
      required CosmosBaseAddress ownerAddress,
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
      "signer": signer.address
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgDeposit.typeUrl;

  @override
  List get values => [coins, memo, signer.toBytes()];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(typeUrl);
  }

  @override
  String get service => typeUrl;

  @override
  List<String?> get signers => [signer.address];
}
