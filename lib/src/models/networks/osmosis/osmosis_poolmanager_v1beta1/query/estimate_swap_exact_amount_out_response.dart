import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolManagerEstimateSwapExactAmountOutResponse
    extends CosmosMessage {
  final BigInt tokenInAmount;
  const OsmosisPoolManagerEstimateSwapExactAmountOutResponse(
      this.tokenInAmount);
  factory OsmosisPoolManagerEstimateSwapExactAmountOutResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerEstimateSwapExactAmountOutResponse(
        BigInt.parse(decode.getField(1)));
  }
  factory OsmosisPoolManagerEstimateSwapExactAmountOutResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerEstimateSwapExactAmountOutResponse(
        BigintUtils.parse(json["token_in_amount"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"token_in_amount": tokenInAmount.toString()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisPoolManagerV1beta1Types.estimateSwapExactAmountOutResponse;

  @override
  List get values => [tokenInAmount.toString()];
}
