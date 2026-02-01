import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_epochs_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_epochs_info_response.dart';

class OmosisEpochsQueryEpochsInfoRequest extends CosmosMessage
    with QueryMessage<OmosisEpochsQueryEpochsInfoResponse> {
  const OmosisEpochsQueryEpochsInfoRequest();

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => OsmosisEpochsV1beta1Types.epochsInfoRequest;

  @override
  List get values => [];

  @override
  OmosisEpochsQueryEpochsInfoResponse onResponse(List<int> bytes) {
    return OmosisEpochsQueryEpochsInfoResponse.deserialize(bytes);
  }

  @override
  OmosisEpochsQueryEpochsInfoResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return OmosisEpochsQueryEpochsInfoResponse.fromJson(json);
  }

  @override
  Map<String, String> get queryParameters => {};
}
