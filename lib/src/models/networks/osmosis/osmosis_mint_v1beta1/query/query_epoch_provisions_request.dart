import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_mint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_epoch_provisions_response.dart';

/// QueryEpochProvisionsRequest is the request type for the Query/EpochProvisions RPC method.
class OsmosisMintQueryEpochProvisionsRequest extends CosmosMessage
    with
        QueryMessage<OsmosisMintQueryEpochProvisionsResponse>,
        RPCMessage<OsmosisMintQueryEpochProvisionsResponse> {
  const OsmosisMintQueryEpochProvisionsRequest();

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl =>
      OsmosisMintV1beta1Types.queryEpochProvisionsRequest.typeUrl;

  @override
  List get values => [];

  @override
  OsmosisMintQueryEpochProvisionsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisMintQueryEpochProvisionsResponse.fromRpc(json);
  }

  @override
  OsmosisMintQueryEpochProvisionsResponse onResponse(List<int> bytes) {
    return OsmosisMintQueryEpochProvisionsResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath => OsmosisMintV1beta1Types.epochProvisions.typeUrl;

  @override
  String get rpcPath => OsmosisMintV1beta1Types.epochProvisions.rpcUrl();
}
