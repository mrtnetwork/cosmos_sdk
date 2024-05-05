import 'package:cosmos_sdk/src/models/networks/osmosis/omosis_epochs_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_current_epoch_response.dart';

class OmosisEpochsQueryCurrentEpochRequest extends CosmosMessage
    with
        QueryMessage<OmosisEpochsQueryCurrentEpochResponse>,
        RPCMessage<OmosisEpochsQueryCurrentEpochResponse> {
  final String identifier;

  const OmosisEpochsQueryCurrentEpochRequest(this.identifier);

  factory OmosisEpochsQueryCurrentEpochRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OmosisEpochsQueryCurrentEpochRequest(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath => OsmosisEpochsV1beta1Types.currentEpoch.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"identifier": identifier};
  }

  @override
  String get typeUrl => OsmosisEpochsV1beta1Types.currentEpochRequest.typeUrl;

  @override
  List get values => [identifier];

  @override
  OmosisEpochsQueryCurrentEpochResponse onResponse(List<int> bytes) {
    return OmosisEpochsQueryCurrentEpochResponse.deserialize(bytes);
  }

  @override
  OmosisEpochsQueryCurrentEpochResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OmosisEpochsQueryCurrentEpochResponse.fromRpc(json);
  }

  @override
  Map<String, String> get queryParameters => {"identifier": identifier};

  @override
  String get rpcPath => OsmosisEpochsV1beta1Types.currentEpoch.rpcUrl();
}
