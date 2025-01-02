import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_ibchooks/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisIbchooksMsgEmitIBCAckResponse extends CosmosMessage {
  final String? contractResult;
  final String? ibcAck;
  OsmosisIbchooksMsgEmitIBCAckResponse({this.contractResult, this.ibcAck});
  factory OsmosisIbchooksMsgEmitIBCAckResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIbchooksMsgEmitIBCAckResponse(
        contractResult: decode.getField(1), ibcAck: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"contract_result": contractResult?.toString(), "ibc_ack": ibcAck};
  }

  @override
  TypeUrl get typeUrl => OsmosisIbchooksTypes.msgEmitIBCAckResponse;

  @override
  List get values => [contractResult, ibcAck];
}
