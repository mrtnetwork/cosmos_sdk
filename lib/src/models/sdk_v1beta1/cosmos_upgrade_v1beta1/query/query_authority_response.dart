import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryAuthorityResponse is the response type for Query/Authority
///
/// Since: cosmos-sdk 0.46
class QueryAuthorityResponse extends CosmosMessage {
  final String? address;
  const QueryAuthorityResponse({this.address});
  factory QueryAuthorityResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAuthorityResponse(address: decode.getField(1));
  }
  factory QueryAuthorityResponse.fromRpc(Map<String, dynamic> json) {
    return QueryAuthorityResponse(address: json["address"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address};
  }

  @override
  TypeUrl get typeUrl => UpgradeV1beta1Types.queryAuthorityResponse;

  @override
  List get values => [address];
}
