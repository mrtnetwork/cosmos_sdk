import 'package:cosmos_sdk/src/models/ibc/ibc_applications_transfer_v2/query/query_denoms_response.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDenomsRequest is the request type for the Query/Denoms RPC
/// method
class IbcTransferV2QueryDenomsRequest extends CosmosMessage
    with QueryMessage<IbcTransferV2QueryDenomsResponse> {
  /// pagination defines an optional pagination for the request
  final PageRequest? pagination;

  const IbcTransferV2QueryDenomsRequest({this.pagination});

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryDenomsRequest;

  @override
  List get values => [pagination];

  @override
  IbcTransferV2QueryDenomsResponse onJsonResponse(Map<String, dynamic> json) {
    return IbcTransferV2QueryDenomsResponse.fromRpc(json);
  }

  @override
  IbcTransferV2QueryDenomsResponse onResponse(List<int> bytes) {
    return IbcTransferV2QueryDenomsResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};
}
