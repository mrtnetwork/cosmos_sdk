import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisGammMsgExitPoolResponse extends CosmosMessage {
  final List<Coin> tokenOut;
  OsmosisGammMsgExitPoolResponse({required List<Coin> tokenOut})
    : tokenOut = tokenOut.immutable;
  factory OsmosisGammMsgExitPoolResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammMsgExitPoolResponse(
      tokenOut:
          decode
              .getFields<List<int>>(1)
              .map((e) => Coin.deserialize(e))
              .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"token_out": tokenOut.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.msgExitPoolResponse;

  @override
  List get values => [tokenOut];
}
