import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_ibchooks/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisIbchooksParams extends CosmosMessage {
  final List<String> allowedSsyncAckContracts;
  OsmosisIbchooksParams(List<String> allowedSsyncAckContracts)
      : allowedSsyncAckContracts = allowedSsyncAckContracts.mutable;
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
  String get typeUrl => OsmosisIbchooksTypes.params.typeUrl;

  @override
  List get values => [allowedSsyncAckContracts];
}
