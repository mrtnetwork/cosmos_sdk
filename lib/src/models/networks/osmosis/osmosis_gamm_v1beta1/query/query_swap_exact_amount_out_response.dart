import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';

class OsmosisGammQuerySwapExactAmountOutResponse extends CosmosMessage {
  final BigInt tokenInAmount;

  OsmosisGammQuerySwapExactAmountOutResponse(this.tokenInAmount);

  factory OsmosisGammQuerySwapExactAmountOutResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQuerySwapExactAmountOutResponse(
      BigInt.parse(decode.getField(1)),
    );
  }
  factory OsmosisGammQuerySwapExactAmountOutResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisGammQuerySwapExactAmountOutResponse(
      BigintUtils.parse(json["token_in_amount"]),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"token_in_amount": tokenInAmount.toString()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisGammV1beta1Types.querySwapExactAmountOutResponse;

  @override
  List get values => [tokenInAmount.toString()];
}
