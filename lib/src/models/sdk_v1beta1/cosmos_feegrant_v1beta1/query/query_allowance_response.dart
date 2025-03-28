import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/messages/grant.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryAllowanceResponse is the response type for the Query/Allowance RPC method.
class QueryAllowanceResponse extends CosmosMessage {
  /// allowance is a allowance granted for grantee by granter.
  final FeeGrant? allowance;
  QueryAllowanceResponse({this.allowance});
  factory QueryAllowanceResponse.fromJson(Map<String, dynamic> json) {
    return QueryAllowanceResponse(
        allowance: json["allowance"] == null
            ? null
            : FeeGrant.fromJson(json["allowance"]));
  }
  factory QueryAllowanceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAllowanceResponse(
        allowance: decode
            .getResult(1)
            ?.to<FeeGrant, List<int>>((e) => FeeGrant.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"allowance": allowance?.toJson()};
  }

  @override
  TypeUrl get typeUrl => FeegrantV1beta1Types.queryAllowanceResponse;

  @override
  List get values => [allowance];
}
