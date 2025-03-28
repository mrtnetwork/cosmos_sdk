import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/sdk_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'join_swap_share_amount_out_response.dart';

class OsmosisGammMsgJoinSwapExternAmountIn
    extends OsmosisGammV1Beta1<OsmosisGammMsgJoinSwapShareAmountOutResponse> {
  final String? sender;
  final BigInt? poolId;
  final Coin tokenIn;
  final BigInt shareOutMintAmount;

  OsmosisGammMsgJoinSwapExternAmountIn(
      {this.sender,
      required this.poolId,
      required this.tokenIn,
      required this.shareOutMintAmount});
  factory OsmosisGammMsgJoinSwapExternAmountIn.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammMsgJoinSwapExternAmountIn(
        sender: decode.getField(1),
        poolId: decode.getField(2),
        tokenIn: Coin.deserialize(decode.getField(3)),
        shareOutMintAmount: BigInt.parse(decode.getField(4)));
  }
  factory OsmosisGammMsgJoinSwapExternAmountIn.fromJson(
      Map<String, dynamic> json) {
    return OsmosisGammMsgJoinSwapExternAmountIn(
        sender: json.as("sender"),
        poolId: json.asBigInt("pool_id"),
        tokenIn: Coin.fromJson(json.asMap("token_in")),
        shareOutMintAmount: json.asBigInt("share_out_min_amount"));
  }
  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "pool_id": poolId?.toString(),
      "token_in": tokenIn.toJson(),
      "share_out_min_amount": shareOutMintAmount.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.msgJoinSwapExternAmountIn;

  @override
  List get values => [sender, poolId, tokenIn, shareOutMintAmount.toString()];

  @override
  OsmosisGammMsgJoinSwapShareAmountOutResponse onResponse(List<int> bytes) {
    return OsmosisGammMsgJoinSwapShareAmountOutResponse.deserialize(bytes);
  }

  @override
  List<String?> get signers => [sender];
}
