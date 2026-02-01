import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_twap_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'arithmetic_twap_to_now_response.dart';

/// Params holds parameters for the twap module.
class OsmosisTwapArithmeticTwapToNowRequest extends CosmosMessage
    with QueryMessage<OsmosisTwapArithmeticTwapToNowResponse> {
  final BigInt? poolId;
  final String? baseAsset;
  final String? quoteAsset;
  final ProtobufTimestamp startTime;

  OsmosisTwapArithmeticTwapToNowRequest({
    this.poolId,
    this.baseAsset,
    this.quoteAsset,
    required this.startTime,
  });
  factory OsmosisTwapArithmeticTwapToNowRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTwapArithmeticTwapToNowRequest(
      poolId: decode.getField(1),
      baseAsset: decode.getField(2),
      quoteAsset: decode.getField(3),
      startTime: ProtobufTimestamp.deserialize(decode.getField(4)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool_id": poolId?.toString(),
      "base_asset": baseAsset,
      "quote_asset": quoteAsset,
      "start_time": startTime.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisTwapV1beta1Types.arithmeticTwapToNowRequest;

  @override
  List get values => [poolId, baseAsset, quoteAsset, startTime];

  @override
  Map<String, String?> get queryParameters => {
    "pool_id": poolId?.toString(),
    "base_asset": baseAsset,
    "quote_asset": quoteAsset,
    "start_time": startTime.toString(),
  };

  @override
  OsmosisTwapArithmeticTwapToNowResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return OsmosisTwapArithmeticTwapToNowResponse.fromJson(json);
  }

  @override
  OsmosisTwapArithmeticTwapToNowResponse onResponse(List<int> bytes) {
    return OsmosisTwapArithmeticTwapToNowResponse.deserialize(bytes);
  }
}
