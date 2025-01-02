import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'exit_swap_share_amount_in_response.dart';

class OsmosisGammMsgExitSwapShareAmountIn extends CosmosMessage
    with ServiceMessage<OsmosisGammMsgExitSwapShareAmountInResponse> {
  final String? sender;
  final BigInt? poolId;
  final String? tokenOutDenom;
  final BigInt shareInAmount;
  final BigInt tokenOutMinAmount;
  OsmosisGammMsgExitSwapShareAmountIn(
      {this.sender,
      this.poolId,
      this.tokenOutDenom,
      required this.shareInAmount,
      required this.tokenOutMinAmount});
  factory OsmosisGammMsgExitSwapShareAmountIn.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammMsgExitSwapShareAmountIn(
      sender: decode.getField(1),
      poolId: decode.getField(2),
      tokenOutDenom: decode.getField(3),
      shareInAmount: BigInt.parse(decode.getField(4)),
      tokenOutMinAmount: BigInt.parse(decode.getField(5)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  OsmosisGammMsgExitSwapShareAmountInResponse onResponse(List<int> bytes) {
    return OsmosisGammMsgExitSwapShareAmountInResponse.deserialize(bytes);
  }

  @override
  TypeUrl get service => OsmosisGammV1beta1Types.exitSwapShareAmountIn;

  @override
  List<String?> get signers => [sender];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "pool_id": poolId?.toString(),
      "token_out_denom": tokenOutDenom,
      "share_in_amount": shareInAmount.toString(),
      "token_out_min_amount": tokenOutMinAmount.toString()
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.msgExitSwapShareAmountIn;

  @override
  List get values => [
        sender,
        poolId,
        tokenOutDenom,
        shareInAmount,
        tokenOutMinAmount.toString()
      ];
}
