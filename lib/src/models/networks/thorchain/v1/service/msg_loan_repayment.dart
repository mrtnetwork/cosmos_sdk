import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgLoanRepayment extends CosmosMessage {
  final String? owner;
  final ThorchainAsset collateralAsset;
  final ThorchainCoin coin;
  final BigInt minOut;
  final List<int>? signer;
  final String? from;
  final String? txId;
  ThorchainMsgLoanRepayment({
    this.owner,
    required this.collateralAsset,
    required this.coin,
    required this.minOut,
    List<int>? signer,
    this.from,
    this.txId,
  }) : signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgLoanRepayment.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgLoanRepayment(
      owner: decode.getField(1),
      collateralAsset: ThorchainAsset.deserialize(decode.getField(2)),
      coin: ThorchainCoin.deserialize(decode.getField(3)),
      minOut: BigintUtils.parse(decode.getField<String>(4)),
      signer: decode.getField(5),
      from: decode.getField(6),
      txId: decode.getField(7),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  Map<String, dynamic> toJson() {
    return {
      "owner": owner,
      "collateral_asset": collateralAsset.toJson(),
      "coin": coin.toJson(),
      "min_out": minOut.toString(),
      "signer": BytesUtils.tryToHexString(signer),
      "from": from,
      "tx_id": txId,
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.msgLoanRepayment;

  @override
  List get values => [
    owner,
    collateralAsset,
    coin,
    minOut.toString(),
    signer,
    from,
    txId,
  ];
}
