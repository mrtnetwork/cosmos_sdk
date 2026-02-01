import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/query/query_connections_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class IbcConnectionQueryConnectionsRequest extends CosmosMessage
    with QueryMessage<IbcCOnnectionQueryConnectionsResponse> {
  final PageRequest? pagination;
  const IbcConnectionQueryConnectionsRequest({this.pagination});
  factory IbcConnectionQueryConnectionsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionQueryConnectionsRequest(
      pagination: decode
          .getResult(1)
          ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcConnectionQueryConnectionsRequest;

  @override
  List get values => [pagination];
  @override
  IbcCOnnectionQueryConnectionsResponse onResponse(List<int> bytes) {
    return IbcCOnnectionQueryConnectionsResponse.deserialize(bytes);
  }

  @override
  IbcCOnnectionQueryConnectionsResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return IbcCOnnectionQueryConnectionsResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};
}
