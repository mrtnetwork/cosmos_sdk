import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';

import 'module_balance_response.dart';

class OsmosisLockupModuleBalanceRequest extends CosmosMessage
    with
        QueryMessage<OsmosisLockupModuleBalanceResponse>,
        RPCMessage<OsmosisLockupModuleBalanceResponse> {
  const OsmosisLockupModuleBalanceRequest();
  factory OsmosisLockupModuleBalanceRequest.deserialize(List<int> bytes) {
    return OsmosisLockupModuleBalanceRequest();
  }
  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl => OsmosisLockupTypes.moduleBalance.typeUrl;

  @override
  List get values => [];

  @override
  OsmosisLockupModuleBalanceResponse onResponse(List<int> bytes) {
    return OsmosisLockupModuleBalanceResponse.deserialize(bytes);
  }

  @override
  String get queryPath => OsmosisLockupTypes.moduleBalance.typeUrl;

  @override
  OsmosisLockupModuleBalanceResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisLockupModuleBalanceResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get rpcPath => OsmosisLockupTypes.moduleBalance.rpcUrl();
}
