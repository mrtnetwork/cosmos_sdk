import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisGammMsgJoinPoolResponse extends CosmosMessage {
  final String shareOutAmount;
  final List<Coin> tokenInMaxs;
  OsmosisGammMsgJoinPoolResponse(
      {required this.shareOutAmount, required List<Coin> tokenInMaxs})
      : tokenInMaxs = tokenInMaxs.immutable;
  factory OsmosisGammMsgJoinPoolResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammMsgJoinPoolResponse(
        shareOutAmount: decode.getField(1),
        tokenInMaxs:
            decode.getFields(2).map((e) => Coin.deserialize(e)).toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "share_out_amount": shareOutAmount,
      "token_in": tokenInMaxs.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => OsmosisGammV1beta1Types.msgJoinPoolResponse.typeUrl;

  @override
  List get values => [shareOutAmount, tokenInMaxs];
}
