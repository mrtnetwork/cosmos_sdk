import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'module_to_distribute_coins_response.dart';

class OsmosisIncentiveModuleToDistributeCoinsRequest extends CosmosMessage
    with QueryMessage<OsmosisIncentiveModuleToDistributeCoinsResponse> {
  const OsmosisIncentiveModuleToDistributeCoinsRequest();
  factory OsmosisIncentiveModuleToDistributeCoinsRequest.fromBytes(
      List<int> bytes) {
    return const OsmosisIncentiveModuleToDistributeCoinsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  OsmosisIncentiveModuleToDistributeCoinsResponse onResponse(List<int> bytes) {
    return OsmosisIncentiveModuleToDistributeCoinsResponse.deserialize(bytes);
  }

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => OsmosisIncentivesTypes.moduleToDistributeCoinsRequest;

  @override
  List get values => [];

  @override
  OsmosisIncentiveModuleToDistributeCoinsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisIncentiveModuleToDistributeCoinsResponse.fromJson(json);
  }

  @override
  Map<String, String> get queryParameters => {};
}
