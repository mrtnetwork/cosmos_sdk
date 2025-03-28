import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryTotalAckFeesResponse defines the response type for the TotalAckFees rpc
class QueryTotalAckFeesResponse extends CosmosMessage {
  /// the total packet acknowledgement fees
  final List<Coin> recvFees;
  QueryTotalAckFeesResponse({required List<Coin> recvFees})
      : recvFees = recvFees.immutable;

  factory QueryTotalAckFeesResponse.fromJson(Map<String, dynamic> json) {
    return QueryTotalAckFeesResponse(
        recvFees: (json["recv_fees"] as List?)
                ?.map((e) => Coin.fromJson(e))
                .toList() ??
            []);
  }

  factory QueryTotalAckFeesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryTotalAckFeesResponse(
        recvFees: decode
            .getFields<List<int>>(1)
            .map((e) => Coin.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"recv_fees": recvFees.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryTotalAckFeesResponse;

  @override
  List get values => [recvFees];
}
