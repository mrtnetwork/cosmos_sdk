import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/messages/incentivized_pool.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisPoolincentivesQueryIncentivizedPoolsResponse
    extends CosmosMessage {
  final List<OsmosisPoolincentivesIncentivizedPool> incentivizedPools;

  OsmosisPoolincentivesQueryIncentivizedPoolsResponse(
      List<OsmosisPoolincentivesIncentivizedPool> incentivizedPools)
      : incentivizedPools = incentivizedPools.mutable;
  factory OsmosisPoolincentivesQueryIncentivizedPoolsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolincentivesQueryIncentivizedPoolsResponse(decode
        .getFields(1)
        .map((e) => OsmosisPoolincentivesIncentivizedPool.deserialize(e))
        .toList());
  }
  factory OsmosisPoolincentivesQueryIncentivizedPoolsResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisPoolincentivesQueryIncentivizedPoolsResponse(
        (json["incentivized_pools"] as List?)
                ?.map((e) => OsmosisPoolincentivesIncentivizedPool.fromRpc(e))
                .toList() ??
            <OsmosisPoolincentivesIncentivizedPool>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "incentivized_pools": incentivizedPools.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl =>
      OsmosisPoolincentivesV1beta1Types.queryIncentivizedPoolsResponse.typeUrl;
  @override
  List get values => [incentivizedPools];
}
