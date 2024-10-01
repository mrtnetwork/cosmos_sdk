import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryTotalRecvFeesResponse defines the response type for the TotalRecvFees rpc
class QueryTotalRecvFeesResponse extends CosmosMessage {
  /// the total packet receive fees
  final List<Coin> recvFees;
  QueryTotalRecvFeesResponse({required List<Coin> recvFees})
      : recvFees = recvFees.immutable;
  factory QueryTotalRecvFeesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryTotalRecvFeesResponse(
        recvFees: decode.getFields(1).map((e) => Coin.deserialize(e)).toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"recv_fees": recvFees.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl => IbcTypes.queryTotalRecvFeesResponse.typeUrl;

  @override
  List get values => [recvFees];
}
