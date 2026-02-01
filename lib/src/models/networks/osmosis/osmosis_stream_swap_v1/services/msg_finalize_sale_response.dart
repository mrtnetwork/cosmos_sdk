import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisStreamSwapMsgFinalizeSaleResponse extends CosmosMessage {
  /// Income amount of token_in sent to the sale recipient.
  final BigInt income;

  OsmosisStreamSwapMsgFinalizeSaleResponse(this.income);
  factory OsmosisStreamSwapMsgFinalizeSaleResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapMsgFinalizeSaleResponse(
      BigInt.parse(decode.getField(1)),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"income": income};
  }

  @override
  TypeUrl get typeUrl => OsmosisStreamSwapV1Types.msgFinalizeSaleResponse;

  @override
  List get values => [income];
}
