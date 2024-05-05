import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'query_params_response.dart';

/// Params returns the total set of superfluid parameters.
class OsmosisSuperfluidQueryParamsRequest extends CosmosMessage
    with
        QueryMessage<OsmosisSuperfluidQueryParamsResponse>,
        RPCMessage<OsmosisSuperfluidQueryParamsResponse> {
  const OsmosisSuperfluidQueryParamsRequest();
  factory OsmosisSuperfluidQueryParamsRequest.deserialize(List<int> bytes) {
    return OsmosisSuperfluidQueryParamsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl => OsmosisSuperfluidTypes.queryParamsRequest.typeUrl;

  @override
  List get values => [];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath => OsmosisSuperfluidTypes.queryParams.typeUrl;

  @override
  String get rpcPath => OsmosisSuperfluidTypes.queryParams.rpcUrl();

  @override
  OsmosisSuperfluidQueryParamsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidQueryParamsResponse.fromRpc(json);
  }

  @override
  OsmosisSuperfluidQueryParamsResponse onResponse(List<int> bytes) {
    return OsmosisSuperfluidQueryParamsResponse.deserialize(bytes);
  }
}
