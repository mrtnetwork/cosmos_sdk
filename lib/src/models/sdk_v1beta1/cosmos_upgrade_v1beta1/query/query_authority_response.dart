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

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address};
  }

  @override
  String get typeUrl => UpgradeV1beta1Types.queryAuthorityResponse.typeUrl;

  @override
  List get values => [address];
}
