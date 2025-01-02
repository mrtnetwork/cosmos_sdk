import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// BalancerPoolInfo contains meta data pertaining to a balancer pool type.
class OsmosisProtorevBalancerPoolInfo extends CosmosMessage {
  /// The weight of a stableswap pool
  final BigInt? weight;

  const OsmosisProtorevBalancerPoolInfo({this.weight});

  factory OsmosisProtorevBalancerPoolInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevBalancerPoolInfo(weight: decode.getField(1));
  }
  factory OsmosisProtorevBalancerPoolInfo.fromRpc(Map<String, dynamic> json) {
    return OsmosisProtorevBalancerPoolInfo(
        weight: BigintUtils.tryParse(json["weight"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"weight": weight?.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisProtorevV1beta1Types.balancerPoolInfo;

  @override
  List get values => [weight];
}
