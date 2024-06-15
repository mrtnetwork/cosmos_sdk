import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgWithdrawLiquidity extends CosmosMessage {
  final ThorchainTx tx;
  final String? withdrawAddress;
  final BigInt basisPoints;
  final ThorchainAsset asset;
  final ThorchainAsset withdrawalAsset;
  final List<int>? signer;
  ThorchainMsgWithdrawLiquidity({
    required this.tx,
    this.withdrawAddress,
    required this.basisPoints,
    required this.asset,
    required this.withdrawalAsset,
    List<int>? signer,
  }) : signer = BytesUtils.tryToBytes(signer, unmodifiable: true);

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx": tx.toJson(),
      "withdraw_address": withdrawAddress,
      "basis_points": basisPoints.toString(),
      "asset": asset.toJson(),
      "withdrawal_asset": withdrawalAsset.toJson(),
      "signer": BytesUtils.tryToHexString(signer)
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.mxgWithdrawLiquidity.typeUrl;

  @override
  List get values => [
        tx,
        withdrawAddress,
        basisPoints.toString(),
        asset,
        withdrawalAsset,
        signer
      ];
}
