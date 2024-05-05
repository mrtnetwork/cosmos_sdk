import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis%D9%80stream_swap%D9%80v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisStreamSwapMsgFinalizeSaleResponse extends CosmosMessage {
  /// Income amount of token_in sent to the sale recipient.
  final BigInt income;

  OsmosisStreamSwapMsgFinalizeSaleResponse(this.income);
  factory OsmosisStreamSwapMsgFinalizeSaleResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapMsgFinalizeSaleResponse(
        BigInt.parse(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"income": income};
  }

  @override
  String get typeUrl =>
      OsmosisStreamSwapV1Types.msgFinalizeSaleResponse.typeUrl;

  @override
  List get values => [income];
}
