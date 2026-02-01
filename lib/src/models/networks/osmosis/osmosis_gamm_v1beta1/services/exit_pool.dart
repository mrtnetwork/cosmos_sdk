import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/sdk_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'exit_pool_response.dart';

class OsmosisGammMsgExitPool
    extends OsmosisGammV1Beta1<OsmosisGammMsgExitPoolResponse> {
  final String? sender;
  final BigInt? poolId;
  final String shareInAmount;
  final List<Coin> tokenOutMins;
  OsmosisGammMsgExitPool({
    this.sender,
    this.poolId,
    required this.shareInAmount,
    required List<Coin> tokenOutMins,
  }) : tokenOutMins = tokenOutMins.immutable;
  factory OsmosisGammMsgExitPool.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammMsgExitPool(
      sender: decode.getField(1),
      poolId: decode.getField(2),
      shareInAmount: decode.getField(3),
      tokenOutMins:
          decode
              .getFields<List<int>>(4)
              .map((e) => Coin.deserialize(e))
              .toList(),
    );
  }
  factory OsmosisGammMsgExitPool.fromJson(Map<String, dynamic> json) {
    return OsmosisGammMsgExitPool(
      sender: json.asMap("sender"),
      poolId: json.asBigInt("pool_id"),
      shareInAmount: json.as("share_in_amount"),
      tokenOutMins:
          json
              .asListOfMap("token_out_mins")
              ?.map((e) => Coin.fromJson(e))
              .toList() ??
          [],
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "pool_id": poolId?.toString(),
      "share_in_amount": shareInAmount,
      "token_out_mins": tokenOutMins.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.msgExitPool;

  @override
  List get values => [sender, poolId, shareInAmount, tokenOutMins];

  @override
  OsmosisGammMsgExitPoolResponse onResponse(List<int> bytes) {
    return OsmosisGammMsgExitPoolResponse.deserialize(bytes);
  }

  @override
  List<String?> get signers => [sender];
}
