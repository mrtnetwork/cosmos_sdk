import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/sdk_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'exit_swap_extern_amount_out_response.dart';

class OsmosisGammMsgExitSwapExternAmountOut
    extends OsmosisGammV1Beta1<OsmosisGammMsgExitSwapExternAmountOutResponse> {
  final String? sender;
  final BigInt? poolId;
  final Coin tokenOut;
  final BigInt shareInMaxAmount;

  OsmosisGammMsgExitSwapExternAmountOut(
      {this.sender,
      this.poolId,
      required this.tokenOut,
      required this.shareInMaxAmount});
  factory OsmosisGammMsgExitSwapExternAmountOut.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammMsgExitSwapExternAmountOut(
      sender: decode.getField(1),
      poolId: decode.getField(2),
      shareInMaxAmount: BigInt.parse(decode.getField(4)),
      tokenOut: Coin.deserialize(decode.getField(3)),
    );
  }
  factory OsmosisGammMsgExitSwapExternAmountOut.fromJson(
      Map<String, dynamic> json) {
    return OsmosisGammMsgExitSwapExternAmountOut(
      sender: json.as("sender"),
      poolId: json.asBigInt("pool_id"),
      shareInMaxAmount: json.asBigInt("share_in_max_amount"),
      tokenOut: Coin.fromJson(json.asMap("token_out")),
    );
  }
  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "pool_id": poolId?.toString(),
      "token_out": tokenOut.toJson(),
      "share_in_max_amount": shareInMaxAmount.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.msgExitSwapExternAmountOut;

  @override
  List get values => [sender, poolId, tokenOut, shareInMaxAmount.toString()];

  @override
  OsmosisGammMsgExitSwapExternAmountOutResponse onResponse(List<int> bytes) {
    return OsmosisGammMsgExitSwapExternAmountOutResponse.deserialize(bytes);
  }

  @override
  List<String?> get signers => [sender];
}
