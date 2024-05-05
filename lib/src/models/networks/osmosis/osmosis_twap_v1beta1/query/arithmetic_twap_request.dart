import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_twap_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'arithmetic_twap_response.dart';

/// Params holds parameters for the twap module.
class OsmosisTwapArithmeticTwapRequest extends CosmosMessage
    with
        QueryMessage<OsmosisTwapArithmeticTwapResponse>,
        RPCMessage<OsmosisTwapArithmeticTwapResponse> {
  final BigInt? poolId;
  final String? baseAsset;
  final String? quoteAsset;
  final ProtobufTimestamp startTime;
  final ProtobufTimestamp? endTime;

  OsmosisTwapArithmeticTwapRequest(
      {this.poolId,
      this.baseAsset,
      this.quoteAsset,
      required this.startTime,
      this.endTime});
  factory OsmosisTwapArithmeticTwapRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTwapArithmeticTwapRequest(
        poolId: decode.getField(1),
        baseAsset: decode.getField(2),
        quoteAsset: decode.getField(3),
        startTime: ProtobufTimestamp.deserialize(decode.getField(4)),
        endTime: decode.getResult(5)?.to<ProtobufTimestamp, List<int>>(
            (e) => ProtobufTimestamp.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool_id": poolId?.toString(),
      "base_asset": baseAsset,
      "quote_asset": quoteAsset,
      "start_time": startTime.toJson(),
      "end_time": endTime?.toJson()
    };
  }

  @override
  String get typeUrl => OsmosisTwapV1beta1Types.arithmeticTwapRequest.typeUrl;

  @override
  List get values => [poolId, baseAsset, quoteAsset, startTime, endTime];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath => OsmosisTwapV1beta1Types.arithmeticTwap.typeUrl;

  @override
  String get rpcPath => OsmosisTwapV1beta1Types.arithmeticTwap.rpcUrl();

  @override
  OsmosisTwapArithmeticTwapResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisTwapArithmeticTwapResponse.fromRpc(json);
  }

  @override
  OsmosisTwapArithmeticTwapResponse onResponse(List<int> bytes) {
    return OsmosisTwapArithmeticTwapResponse.deserialize(bytes);
  }
}
