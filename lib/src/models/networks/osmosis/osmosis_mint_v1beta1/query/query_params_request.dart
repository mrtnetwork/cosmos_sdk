import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_mint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'query_params_response.dart';

/// QueryParamsRequest is the request type for the Query/Params RPC method.
class OsmosisMintQueryParamsRequest extends CosmosMessage
    with
        QueryMessage<OsmosisMintQueryParamsResponse>,
        RPCMessage<OsmosisMintQueryParamsResponse> {
  const OsmosisMintQueryParamsRequest();

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl => OsmosisMintV1beta1Types.queryParamsRequest.typeUrl;

  @override
  List get values => [];

  @override
  OsmosisMintQueryParamsResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisMintQueryParamsResponse.fromRpc(json);
  }

  @override
  OsmosisMintQueryParamsResponse onResponse(List<int> bytes) {
    return OsmosisMintQueryParamsResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath => OsmosisMintV1beta1Types.queryParams.typeUrl;

  @override
  String get rpcPath => OsmosisMintV1beta1Types.queryParams.rpcUrl();
}
