import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'module_to_distribute_coins_response.dart';

class OsmosisIncentiveModuleToDistributeCoinsRequest extends CosmosMessage
    with
        QueryMessage<OsmosisIncentiveModuleToDistributeCoinsResponse>,
        RPCMessage<OsmosisIncentiveModuleToDistributeCoinsResponse> {
  const OsmosisIncentiveModuleToDistributeCoinsRequest();
  factory OsmosisIncentiveModuleToDistributeCoinsRequest.fromBytes(
      List<int> bytes) {
    return OsmosisIncentiveModuleToDistributeCoinsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  OsmosisIncentiveModuleToDistributeCoinsResponse onResponse(List<int> bytes) {
    return OsmosisIncentiveModuleToDistributeCoinsResponse.deserialize(bytes);
  }

  @override
  String get queryPath =>
      OsmosisIncentivesTypes.moduleToDistributeCoins.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl =>
      OsmosisIncentivesTypes.moduleToDistributeCoinsRequest.typeUrl;

  @override
  List get values => [];

  @override
  OsmosisIncentiveModuleToDistributeCoinsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisIncentiveModuleToDistributeCoinsResponse.fromRpc(json);
  }

  @override
  Map<String, String> get queryParameters => {};

  @override
  String get rpcPath => OsmosisIncentivesTypes.moduleToDistributeCoins.rpcUrl();
}
