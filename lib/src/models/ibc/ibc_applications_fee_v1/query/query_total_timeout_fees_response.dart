import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryTotalTimeoutFeesResponse defines the response type for the TotalTimeoutFees rpc
class QueryTotalTimeoutFeesResponse extends CosmosMessage {
  /// the total packet receive fees
  final List<Coin> timeoutFees;
  QueryTotalTimeoutFeesResponse({required List<Coin> timeoutFees})
    : timeoutFees = timeoutFees.immutable;

  factory QueryTotalTimeoutFeesResponse.fromJson(Map<String, dynamic> json) {
    return QueryTotalTimeoutFeesResponse(
      timeoutFees:
          (json["timeout_fees"] as List?)
              ?.map((e) => Coin.fromJson(e))
              .toList() ??
          [],
    );
  }

  factory QueryTotalTimeoutFeesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryTotalTimeoutFeesResponse(
      timeoutFees:
          decode
              .getFields<List<int>>(1)
              .map((e) => Coin.deserialize(e))
              .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"timeout_fees": timeoutFees.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryTotalTimeoutFeesResponse;

  @override
  List get values => [timeoutFees];
}
