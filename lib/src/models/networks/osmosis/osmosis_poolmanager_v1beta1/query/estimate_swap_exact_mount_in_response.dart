import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolManagerEstimateSwapExactAmountInResponse
    extends CosmosMessage {
  final BigInt tokenOutAmount;
  const OsmosisPoolManagerEstimateSwapExactAmountInResponse(
      this.tokenOutAmount);
  factory OsmosisPoolManagerEstimateSwapExactAmountInResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerEstimateSwapExactAmountInResponse(
        BigInt.parse(decode.getField(1)));
  }
  factory OsmosisPoolManagerEstimateSwapExactAmountInResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerEstimateSwapExactAmountInResponse(
        BigintUtils.parse(json["token_out_amount"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"token_out_amount": tokenOutAmount.toString()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisPoolManagerV1beta1Types.estimateSwapExactAmountInResponse;

  @override
  List get values => [tokenOutAmount.toString()];
}
