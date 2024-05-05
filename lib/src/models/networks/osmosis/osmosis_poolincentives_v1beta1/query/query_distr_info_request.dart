import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_distr_info_response.dart';

class OsmosisPoolincentivesQueryDistrInfoRequest extends CosmosMessage
    with
        QueryMessage<OsmosisPoolincentivesQueryDistrInfoResponse>,
        RPCMessage<OsmosisPoolincentivesQueryDistrInfoResponse> {
  OsmosisPoolincentivesQueryDistrInfoRequest();
  factory OsmosisPoolincentivesQueryDistrInfoRequest.deserialize(
      List<int> bytes) {
    return OsmosisPoolincentivesQueryDistrInfoRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  OsmosisPoolincentivesQueryDistrInfoResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisPoolincentivesQueryDistrInfoResponse.fromRpc(json);
  }

  @override
  OsmosisPoolincentivesQueryDistrInfoResponse onResponse(List<int> bytes) {
    return OsmosisPoolincentivesQueryDistrInfoResponse.deserialize(bytes);
  }

  @override
  String get typeUrl =>
      OsmosisPoolincentivesV1beta1Types.queryDistrInfoRequest.typeUrl;
  @override
  List get values => [];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath =>
      OsmosisPoolincentivesV1beta1Types.queryDistrInfo.typeUrl;

  @override
  String get rpcPath => OsmosisPoolincentivesV1beta1Types.queryDistrInfo
      .rpcUrl(pathParameters: []);
}
