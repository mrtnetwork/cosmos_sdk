import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/common/asset.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/common/tx.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgTradeAccountDeposit extends CosmosMessage {
  final ThorchainTx tx;
  final ThorchainAsset asset;
  final BigInt amount;
  final List<int>? address;
  final List<int>? signer;
  ThorchainMsgTradeAccountDeposit({
    required this.tx,
    required this.asset,
    required this.amount,
    List<int>? address,
    List<int>? signer,
  }) : address = BytesUtils.tryToBytes(address, unmodifiable: true),
       signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgTradeAccountDeposit.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgTradeAccountDeposit(
      tx: ThorchainTx.deserialize(decode.getField(1)),
      asset: ThorchainAsset.deserialize(decode.getField(2)),
      amount: BigintUtils.parse(decode.getField<String>(3)),
      address: decode.getField(4),
      signer: decode.getField(5),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx": tx.toJson(),
      "asset": asset.toJson(),
      "amount": amount.toString(),
      "address": BytesUtils.tryToHexString(address),
      "signer": BytesUtils.tryToHexString(signer),
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.msgTradeAccountDeposit;

  @override
  List get values => [tx, asset, amount.toString(), address, signer];
}
