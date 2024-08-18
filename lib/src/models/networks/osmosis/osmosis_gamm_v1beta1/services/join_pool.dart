import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/sdk_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

import 'join_pool_response.dart';

class OsmosisGammMsgJoinPool extends CosmosMessage
    with ServiceMessage<OsmosisGammMsgJoinPoolResponse> {
  final String? sender;
  final BigInt? poolId;
  final String shareOutAmount;
  final List<Coin> tokenInMaxs;
  OsmosisGammMsgJoinPool(
      {this.sender,
      this.poolId,
      required this.shareOutAmount,
      required List<Coin> tokenInMaxs})
      : tokenInMaxs = tokenInMaxs.immutable;
  factory OsmosisGammMsgJoinPool.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammMsgJoinPool(
      sender: decode.getField(1),
      poolId: decode.getField(2),
      shareOutAmount: decode.getField(3),
      tokenInMaxs: decode.getFields(4).map((e) => Coin.deserialize(e)).toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "pool_id": poolId?.toString(),
      "share_out_amount": shareOutAmount,
      "token_in_maxs": tokenInMaxs.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => OsmosisGammV1beta1Types.msgJoinPool.typeUrl;

  @override
  List get values => [sender, poolId, shareOutAmount, tokenInMaxs];

  @override
  OsmosisGammMsgJoinPoolResponse onResponse(List<int> bytes) {
    return OsmosisGammMsgJoinPoolResponse.deserialize(bytes);
  }

  @override
  String get service => OsmosisGammV1beta1Types.joinPool.typeUrl;

  @override
  List<String?> get signers => [sender];
}
