import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_ibchooks/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisIbchooksParams extends CosmosMessage {
  final List<String> allowedSsyncAckContracts;
  OsmosisIbchooksParams(List<String> allowedSsyncAckContracts)
      : allowedSsyncAckContracts = allowedSsyncAckContracts.immutable;
  factory OsmosisIbchooksParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIbchooksParams(decode.getFields<String>(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"allowed_async_ack_contracts": allowedSsyncAckContracts};
  }

  @override
  TypeUrl get typeUrl => OsmosisIbchooksTypes.params;

  @override
  List get values => [allowedSsyncAckContracts];
}
