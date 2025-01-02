import 'package:cosmos_sdk/src/models/ibc/ibc_applications_transfer_v1/query/query_params_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryParamsRequest is the request type for the Query/Params RPC method.
class IbcTransferQueryParamsRequest extends CosmosMessage
    with QueryMessage<IbcTransferQueryParamsResponse> {
  /// This message has no fields.
  const IbcTransferQueryParamsRequest();
  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryParamsRequest;

  @override
  List get values => [];
  @override
  IbcTransferQueryParamsResponse onResponse(List<int> bytes) {
    return IbcTransferQueryParamsResponse.deserialize(bytes);
  }

  @override
  IbcTransferQueryParamsResponse onJsonResponse(Map<String, dynamic> json) {
    return IbcTransferQueryParamsResponse.fromRpc(json);
  }
}
