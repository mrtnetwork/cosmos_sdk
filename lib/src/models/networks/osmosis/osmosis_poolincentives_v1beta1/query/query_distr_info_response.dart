import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/messages/distr_info.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolincentivesQueryDistrInfoResponse extends CosmosMessage {
  final OsmosisPoolincentivesDistrInfo distrInfo;

  OsmosisPoolincentivesQueryDistrInfoResponse(this.distrInfo);
  factory OsmosisPoolincentivesQueryDistrInfoResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolincentivesQueryDistrInfoResponse(
        OsmosisPoolincentivesDistrInfo.deserialize(decode.getField(1)));
  }
  factory OsmosisPoolincentivesQueryDistrInfoResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisPoolincentivesQueryDistrInfoResponse(
        OsmosisPoolincentivesDistrInfo.fromRpc(json["distr_info"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"distr_info": distrInfo.toJson()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisPoolincentivesV1beta1Types.queryDistrInfoResponse;

  @override
  List get values => [distrInfo];
}
