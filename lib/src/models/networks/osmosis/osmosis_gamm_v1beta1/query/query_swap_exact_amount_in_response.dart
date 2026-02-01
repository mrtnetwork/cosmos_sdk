import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';

class OsmosisGammQuerySwapExactAmountInResponse extends CosmosMessage {
  final BigInt tokenOutAmount;

  OsmosisGammQuerySwapExactAmountInResponse(this.tokenOutAmount);

  factory OsmosisGammQuerySwapExactAmountInResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQuerySwapExactAmountInResponse(
      BigInt.parse(decode.getField(1)),
    );
  }
  factory OsmosisGammQuerySwapExactAmountInResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisGammQuerySwapExactAmountInResponse(
      BigintUtils.parse(json["token_out_amount"]),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"token_out_amount": tokenOutAmount.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.querySwapExactAmountInResponse;

  @override
  List get values => [tokenOutAmount];
}
