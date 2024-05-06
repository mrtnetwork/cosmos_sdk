import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_lockable_durations_response.dart';

class OsmosisIncentiveQueryLockableDurationsRequest extends CosmosMessage
    with
        QueryMessage<OsmosisIncentiveQueryLockableDurationsResponse>,
        RPCMessage<OsmosisIncentiveQueryLockableDurationsResponse> {
  const OsmosisIncentiveQueryLockableDurationsRequest();
  factory OsmosisIncentiveQueryLockableDurationsRequest.fromBytes(
      List<int> bytes) {
    return const OsmosisIncentiveQueryLockableDurationsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  OsmosisIncentiveQueryLockableDurationsResponse onResponse(List<int> bytes) {
    return OsmosisIncentiveQueryLockableDurationsResponse.deserialize(bytes);
  }

  @override
  String get queryPath => OsmosisIncentivesTypes.lockableDurations.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl =>
      OsmosisIncentivesTypes.queryLockableDurationsRequest.typeUrl;

  @override
  List get values => [];

  @override
  OsmosisIncentiveQueryLockableDurationsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisIncentiveQueryLockableDurationsResponse.fromRpc(json);
  }

  @override
  Map<String, String> get queryParameters => {};

  @override
  String get rpcPath =>
      OsmosisIncentivesTypes.lockableDurations.rpcUrl(pathParameters: []);
}
