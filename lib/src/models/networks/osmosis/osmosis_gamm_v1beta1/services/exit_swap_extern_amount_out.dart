import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/sdk_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'exit_swap_extern_amount_out_response.dart';

class OsmosisGammMsgExitSwapExternAmountOut extends CosmosMessage
    with ServiceMessage<OsmosisGammMsgExitSwapExternAmountOutResponse> {
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
  String get typeUrl =>
      OsmosisGammV1beta1Types.msgExitSwapExternAmountOut.typeUrl;

  @override
  List get values => [sender, poolId, tokenOut, shareInMaxAmount.toString()];

  @override
  OsmosisGammMsgExitSwapExternAmountOutResponse onResponse(List<int> bytes) {
    return OsmosisGammMsgExitSwapExternAmountOutResponse.deserialize(bytes);
  }

  @override
  String get service => OsmosisGammV1beta1Types.exitSwapExternAmountOut.typeUrl;

  @override
  List<String?> get signers => [sender];
}
