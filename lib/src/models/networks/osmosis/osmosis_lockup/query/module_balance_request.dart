import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';

import 'module_balance_response.dart';

class OsmosisLockupModuleBalanceRequest extends CosmosMessage
    with QueryMessage<OsmosisLockupModuleBalanceResponse> {
  const OsmosisLockupModuleBalanceRequest();
  factory OsmosisLockupModuleBalanceRequest.deserialize(List<int> bytes) {
    return const OsmosisLockupModuleBalanceRequest();
  }
  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => OsmosisLockupTypes.moduleBalanceRequest;

  @override
  List get values => [];

  @override
  OsmosisLockupModuleBalanceResponse onResponse(List<int> bytes) {
    return OsmosisLockupModuleBalanceResponse.deserialize(bytes);
  }

  @override
  OsmosisLockupModuleBalanceResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisLockupModuleBalanceResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters => {};
}
