import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/query/query_connection_params_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryConnectionParamsRequest is the request type for the Query/ConnectionParams RPC method.
class IbcConnectionQueryConnectionParamsRequest extends CosmosMessage
    with QueryMessage<IbcConnectionQueryConnectionParamsResponse> {
  /// This message has no fields.
  const IbcConnectionQueryConnectionParamsRequest();
  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcConnectionQueryConnectionParamsRequest;

  @override
  List get values => [];

  @override
  IbcConnectionQueryConnectionParamsResponse onResponse(List<int> bytes) {
    return IbcConnectionQueryConnectionParamsResponse.deserialize(bytes);
  }

  @override
  IbcConnectionQueryConnectionParamsResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return IbcConnectionQueryConnectionParamsResponse.fromJson(json);
  }
}
