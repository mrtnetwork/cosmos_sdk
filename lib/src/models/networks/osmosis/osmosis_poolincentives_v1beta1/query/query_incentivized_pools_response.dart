import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/messages/incentivized_pool.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisPoolincentivesQueryIncentivizedPoolsResponse
    extends CosmosMessage {
  final List<OsmosisPoolincentivesIncentivizedPool> incentivizedPools;

  OsmosisPoolincentivesQueryIncentivizedPoolsResponse(
    List<OsmosisPoolincentivesIncentivizedPool> incentivizedPools,
  ) : incentivizedPools = incentivizedPools.immutable;
  factory OsmosisPoolincentivesQueryIncentivizedPoolsResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolincentivesQueryIncentivizedPoolsResponse(
      decode
          .getFields<List<int>>(1)
          .map((e) => OsmosisPoolincentivesIncentivizedPool.deserialize(e))
          .toList(),
    );
  }
  factory OsmosisPoolincentivesQueryIncentivizedPoolsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisPoolincentivesQueryIncentivizedPoolsResponse(
      (json["incentivized_pools"] as List?)
              ?.map((e) => OsmosisPoolincentivesIncentivizedPool.fromJson(e))
              .toList() ??
          <OsmosisPoolincentivesIncentivizedPool>[],
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "incentivized_pools": incentivizedPools.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisPoolincentivesV1beta1Types.queryIncentivizedPoolsResponse;
  @override
  List get values => [incentivizedPools];
}
