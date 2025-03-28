import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_fee_v1/query/query_fee_enabled_channels_response.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryFeeEnabledChannelsRequest defines the request type for the FeeEnabledChannels rpc
class QueryFeeEnabledChannelsRequest extends CosmosMessage
    with QueryMessage<QueryFeeEnabledChannelsResponse> {
  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;

  /// block height at which to query
  final BigInt queryHeight;
  const QueryFeeEnabledChannelsRequest(
      {this.pagination, required this.queryHeight});

  factory QueryFeeEnabledChannelsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryFeeEnabledChannelsRequest(
        pagination: decode
            .getResult(1)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)),
        queryHeight: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pagination": pagination?.toJson(),
      "query_height": queryHeight.toString()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryFeeEnabledChannelsRequest;

  @override
  List get values => [pagination, queryHeight];

  @override
  QueryFeeEnabledChannelsResponse onResponse(List<int> bytes) {
    return QueryFeeEnabledChannelsResponse.deserialize(bytes);
  }

  @override
  QueryFeeEnabledChannelsResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryFeeEnabledChannelsResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [queryHeight.toString()];
  @override
  Map<String, String?> get queryParameters => {
        "query_height": queryHeight.toString(),
        ...pagination?.queryParameters ?? {}
      };
}
