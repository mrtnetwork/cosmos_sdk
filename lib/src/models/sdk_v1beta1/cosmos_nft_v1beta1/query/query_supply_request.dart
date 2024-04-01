import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/query/query_supply_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QuerySupplyRequest is the request type for the Query/Supply RPC method
class QueryNFTSupplyRequest extends CosmosMessage
    with QueryMessage<QueryNFTSupplyResponse> {
  /// class_id associated with the nft.
  final String? classId;

  const QueryNFTSupplyRequest({this.classId});
  factory QueryNFTSupplyRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryNFTSupplyRequest(classId: decode.getField(1));
  }

  @override
  Map<String, dynamic> toJson() {
    return {'class_id': classId};
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath => NFTV1beta1Types.nftSupply.typeUrl;

  @override
  String get typeUrl => NFTV1beta1Types.queryNFTSupplyRequest.typeUrl;

  @override
  List get values => [classId];
  @override
  QueryNFTSupplyResponse onResponse(List<int> bytes) {
    return QueryNFTSupplyResponse.deserialize(bytes);
  }
}
