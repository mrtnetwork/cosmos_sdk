import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/query/query_send_enabled_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QuerySendEnabledRequest defines the RPC request for looking up SendEnabled entries.
/// Since: cosmos-sdk 0.47
class QuerySendEnabledRequest extends CosmosMessage
    with QueryMessage<QuerySendEnabledResponse> {
  /// denoms is the specific denoms you want look up. Leave empty to get all entries.
  final List<String> denoms;

  /// pagination defines an optional pagination for the request. This field is
  /// only read if the denoms field is empty.
  final PageRequest? pagination;

  const QuerySendEnabledRequest({required this.denoms, this.pagination});

  factory QuerySendEnabledRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QuerySendEnabledRequest(
        denoms: decode.getFields<String>(1),
        pagination: decode
            .getResult(99)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 99];

  @override
  Map<String, dynamic> toJson() {
    return {"denoms": denoms, "pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => BankV1beta1Types.sendEnabledRequest;

  @override
  List get values => [denoms, pagination];

  @override
  QuerySendEnabledResponse onResponse(List<int> bytes) {
    return QuerySendEnabledResponse.deserialize(bytes);
  }

  @override
  QuerySendEnabledResponse onJsonResponse(Map<String, dynamic> json) {
    return QuerySendEnabledResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters =>
      {"denoms": denoms.join(","), ...pagination?.queryParameters ?? {}};
}
