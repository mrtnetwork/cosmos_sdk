import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/messages/params.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryParamsResponse is response type for the Query/Params RPC method.
class OsmosisProtorevQueryParamsResponse extends CosmosMessage {
  /// params holds all the parameters of this module.
  final OsmosisProtorevParams params;
  const OsmosisProtorevQueryParamsResponse(this.params);
  factory OsmosisProtorevQueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevQueryParamsResponse(
        OsmosisProtorevParams.deserialize(decode.getField(1)));
  }
  factory OsmosisProtorevQueryParamsResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryParamsResponse(
        OsmosisProtorevParams.fromRpc(json["params"]));
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params.toJson()};
  }

  @override
  List get values => [];

  @override
  TypeUrl get typeUrl => OsmosisProtorevV1beta1Types.queryParamsResponse;
}
