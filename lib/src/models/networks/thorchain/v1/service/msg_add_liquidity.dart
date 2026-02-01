import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/address/address/address.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/common/asset.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/common/tx.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

class ThorchainMsgAddLiquidity
    extends ThorchainV1Service<EmptyServiceRequestResponse> {
  final ThorchainTx tx;
  final ThorchainAsset asset;
  final BigInt assetAmount;
  final BigInt runeAmount;
  final String? runeAddress;
  final String? assetAddress;
  final String? affiliateAddress;
  final String affiliateBasisPoints;
  final CosmosBaseAddress? signer;
  ThorchainMsgAddLiquidity({
    required this.tx,
    required this.asset,
    required this.assetAmount,
    required this.runeAmount,
    this.runeAddress,
    this.assetAddress,
    this.affiliateAddress,
    required this.affiliateBasisPoints,
    this.signer,
  });
  factory ThorchainMsgAddLiquidity.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgAddLiquidity(
      tx: ThorchainTx.deserialize(decode.getField(1)),
      asset: ThorchainAsset.deserialize(decode.getField(2)),
      assetAmount: BigintUtils.parse(decode.getField<String>(3)),
      runeAmount: BigintUtils.parse(decode.getField<String>(4)),
      runeAddress: decode.getField(5),
      assetAddress: decode.getField(6),
      affiliateAddress: decode.getField(7),
      affiliateBasisPoints: decode.getField(8),
      signer: decode
          .getResult(9)
          ?.to<CosmosBaseAddress, List<int>>(
            (e) => CosmosBaseAddress.fromBytes(e),
          ),
    );
  }
  factory ThorchainMsgAddLiquidity.fromJson(Map<String, dynamic> json) {
    return ThorchainMsgAddLiquidity(
      tx: ThorchainTx.fromJson(json.asMap("tx")),
      asset: ThorchainAsset.fromJson(json.asMap("asset")),
      assetAmount: json.asBigInt("asset_amount"),
      runeAmount: json.asBigInt("rune_amount"),
      runeAddress: json.as("rune_address"),
      assetAddress: json.as("asset_address"),
      affiliateAddress: json.as("affiliate_address"),
      affiliateBasisPoints: json.as("affiliate_basis_points"),
      signer: json.maybeAs<CosmosBaseAddress, String>(
        key: "signer",
        onValue: (e) {
          return CosmosBaseAddress.fromBytes(CosmosUtils.toBytes(e));
        },
      ),
    );
  }
  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx": tx.toJson(),
      "asset": asset.toJson(),
      "asset_amount": assetAmount.toString(),
      "rune_amount": runeAmount.toString(),
      "rune_address": runeAddress,
      "asset_address": assetAddress,
      "affiliate_address": affiliateAddress,
      "affiliate_basis_points": affiliateBasisPoints,
      "signer": signer?.address,
    };
  }

  @override
  ThorchainV1Types get typeUrl => ThorchainV1Types.msgAddLiquidity;

  @override
  List get values => [
    tx,
    asset,
    assetAmount.toString(),
    runeAmount.toString(),
    runeAddress,
    assetAddress,
    affiliateAddress,
    affiliateBasisPoints,
    signer?.toBytes(),
  ];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(typeUrl);
  }

  @override
  List<String?> get signers => [signer?.address];
}
