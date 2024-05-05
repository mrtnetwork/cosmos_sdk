import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'module_locked_amount_response.dart';

class OsmosisLockupModuleLockedAmountRequest extends CosmosMessage
    with
        QueryMessage<OsmosisLockupModuleLockedAmountResponse>,
        RPCMessage<OsmosisLockupModuleLockedAmountResponse> {
  const OsmosisLockupModuleLockedAmountRequest();
  factory OsmosisLockupModuleLockedAmountRequest.deserialize(List<int> bytes) {
    return OsmosisLockupModuleLockedAmountRequest();
  }
  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl => OsmosisLockupTypes.moduleLockedAmountRequest.typeUrl;

  @override
  List get values => [];

  @override
  OsmosisLockupModuleLockedAmountResponse onResponse(List<int> bytes) {
    return OsmosisLockupModuleLockedAmountResponse.deserialize(bytes);
  }

  @override
  String get queryPath => OsmosisLockupTypes.moduleLockedAmount.typeUrl;

  @override
  OsmosisLockupModuleLockedAmountResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisLockupModuleLockedAmountResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get rpcPath => OsmosisLockupTypes.moduleLockedAmount.rpcUrl();
}
