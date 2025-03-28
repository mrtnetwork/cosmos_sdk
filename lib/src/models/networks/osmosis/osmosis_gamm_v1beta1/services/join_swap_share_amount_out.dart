import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'join_swap_extern_amount_in_response.dart';

class OsmosisGammMsgJoinSwapShareAmountOut
    extends OsmosisGammV1Beta1<OsmosisGammMsgJoinSwapExternAmountInResponse> {
  final String? sender;
  final BigInt? poolId;
  final String? tokenInDenom;
  final BigInt shareOutAmout;
  final BigInt tokenInMaxAmount;

  OsmosisGammMsgJoinSwapShareAmountOut(
      {this.sender,
      this.poolId,
      this.tokenInDenom,
      required this.shareOutAmout,
      required this.tokenInMaxAmount});
  factory OsmosisGammMsgJoinSwapShareAmountOut.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammMsgJoinSwapShareAmountOut(
      sender: decode.getField(1),
      poolId: decode.getField(2),
      tokenInDenom: decode.getField(3),
      shareOutAmout: BigInt.parse(decode.getField(4)),
      tokenInMaxAmount: BigInt.parse(decode.getField(5)),
    );
  }
  factory OsmosisGammMsgJoinSwapShareAmountOut.fromJson(
      Map<String, dynamic> json) {
    return OsmosisGammMsgJoinSwapShareAmountOut(
      sender: json.as("sender"),
      poolId: json.asBigInt("pool_id"),
      tokenInDenom: json.as("token_in_denom"),
      shareOutAmout: json.asBigInt("share_out_amount"),
      tokenInMaxAmount: json.asBigInt("token_in_max_amount"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "pool_id": poolId?.toString(),
      "token_in_denom": tokenInDenom,
      "share_out_amount": shareOutAmout.toString(),
      "token_in_max_amount": tokenInMaxAmount.toString()
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.msgJoinSwapShareAmountOut;

  @override
  List get values => [
        sender,
        poolId,
        tokenInDenom,
        shareOutAmout.toString(),
        tokenInMaxAmount.toString()
      ];

  @override
  OsmosisGammMsgJoinSwapExternAmountInResponse onResponse(List<int> bytes) {
    return OsmosisGammMsgJoinSwapExternAmountInResponse.deserialize(bytes);
  }

  @override
  List<String?> get signers => [sender];
}
