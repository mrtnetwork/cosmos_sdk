import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/messages/send_enabled.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QuerySendEnabledResponse defines the RPC response of a SendEnable query.
/// Since: cosmos-sdk 0.47
class QuerySendEnabledResponse extends CosmosMessage {
  final List<SendEnabled> sendEnabled;

  /// pagination defines the pagination in the response. This field is only
  /// populated if the denoms field in the request is empty.
  final PageResponse? pagination;

  const QuerySendEnabledResponse({required this.sendEnabled, this.pagination});
  factory QuerySendEnabledResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QuerySendEnabledResponse(
        sendEnabled: decode
            .getFields<List<int>>(1)
            .map((e) => SendEnabled.deserialize(e))
            .toList(),
        pagination: decode
            .getResult(99)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)));
  }
  @override
  List<int> get fieldIds => [1, 99];

  @override
  Map<String, dynamic> toJson() {
    return {
      "send_enabled": sendEnabled.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl => BankV1beta1Types.sendEnabledResponse.typeUrl;

  @override
  List get values => [sendEnabled, pagination];
}
