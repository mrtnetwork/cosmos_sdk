import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_lockable_durations_response.dart';

class OsmosisPoolincentivesQueryLockableDurationsRequest extends CosmosMessage
    with QueryMessage<OsmosisPoolincentivesQueryLockableDurationsResponse> {
  OsmosisPoolincentivesQueryLockableDurationsRequest();
  factory OsmosisPoolincentivesQueryLockableDurationsRequest.deserialize(
      List<int> bytes) {
    return OsmosisPoolincentivesQueryLockableDurationsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  OsmosisPoolincentivesQueryLockableDurationsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisPoolincentivesQueryLockableDurationsResponse.fromJson(json);
  }

  @override
  OsmosisPoolincentivesQueryLockableDurationsResponse onResponse(
      List<int> bytes) {
    return OsmosisPoolincentivesQueryLockableDurationsResponse.deserialize(
        bytes);
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisPoolincentivesV1beta1Types.queryLockableDurationsRequest;
  @override
  List get values => [];

  @override
  Map<String, String?> get queryParameters => {};
}
