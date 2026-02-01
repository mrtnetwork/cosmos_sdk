import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// StablePoolInfo contains meta data pertaining to a stableswap pool type.
class OsmosisProtorevStablePoolInfo extends CosmosMessage {
  /// The weight of a stableswap pool
  final BigInt? weight;

  OsmosisProtorevStablePoolInfo({this.weight});

  factory OsmosisProtorevStablePoolInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevStablePoolInfo(weight: decode.getField(1));
  }
  factory OsmosisProtorevStablePoolInfo.fromJson(Map<String, dynamic> json) {
    return OsmosisProtorevStablePoolInfo(
      weight: BigintUtils.tryParse(json["weight"]),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"weight": weight?.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisProtorevV1beta1Types.stablePoolInfo;

  @override
  List get values => [weight];
}
