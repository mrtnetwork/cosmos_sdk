import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_epochs_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_epochs_info_response.dart';

class OmosisEpochsQueryEpochsInfoRequest extends CosmosMessage
    with
        QueryMessage<OmosisEpochsQueryEpochsInfoResponse>,
        RPCMessage<OmosisEpochsQueryEpochsInfoResponse> {
  const OmosisEpochsQueryEpochsInfoRequest();

  @override
  List<int> get fieldIds => [];

  @override
  String get queryPath => OsmosisEpochsV1beta1Types.epochInfos.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl => OsmosisEpochsV1beta1Types.epochsInfoRequest.typeUrl;

  @override
  List get values => [];

  @override
  OmosisEpochsQueryEpochsInfoResponse onResponse(List<int> bytes) {
    return OmosisEpochsQueryEpochsInfoResponse.deserialize(bytes);
  }

  @override
  OmosisEpochsQueryEpochsInfoResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OmosisEpochsQueryEpochsInfoResponse.fromRpc(json);
  }

  @override
  Map<String, String> get queryParameters => {};

  @override
  String get rpcPath => OsmosisEpochsV1beta1Types.epochInfos.rpcUrl();
}
