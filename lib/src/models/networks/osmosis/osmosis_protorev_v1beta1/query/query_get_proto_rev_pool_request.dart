import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_get_proto_rev_pool_response.dart';

/// GetProtoRevPool queries the pool id used via the highest liquidity method for arbitrage route building given a pair of denominations
class OsmosisProtorevQueryGetProtoRevPoolRequest extends CosmosMessage
    with QueryMessage<OsmosisProtorevQueryGetProtoRevPoolResponse> {
  /// base_denom is the base denom set in protorev for the denom pair to pool
  /// mapping
  final String? baseDenom;

  /// other_denom is the other denom for the denom pair to pool mapping
  final String? otherDenom;
  const OsmosisProtorevQueryGetProtoRevPoolRequest(
      {this.baseDenom, this.otherDenom});
  factory OsmosisProtorevQueryGetProtoRevPoolRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevQueryGetProtoRevPoolRequest(
        baseDenom: decode.getField(1), otherDenom: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"base_denom": baseDenom, "other_denom": otherDenom};
  }

  @override
  List get values => [baseDenom, otherDenom];

  @override
  OsmosisProtorevQueryGetProtoRevPoolResponse onResponse(List<int> bytes) {
    return OsmosisProtorevQueryGetProtoRevPoolResponse.deserialize(bytes);
  }

  @override
  OsmosisProtorevQueryGetProtoRevPoolResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevPoolResponse.fromRpc(json);
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevPoolRequest;

  @override
  Map<String, String?> get queryParameters => {};
}
