import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// GrantAllowance grants fee allowance to the grantee on the granter's
/// account with the provided expiration time.
class MsgGrantAllowance
    extends FeeGrantV1Beta1Service<EmptyServiceRequestResponse> {
  /// granter is the address of the user granting an allowance of their funds.
  final CosmosBaseAddress? granter;

  /// grantee is the address of the user being granted an allowance of another user's funds.
  final CosmosBaseAddress? grantee;

  /// allowance can be any of basic, periodic, allowed fee allowance.
  final Any? allowance;
  const MsgGrantAllowance({this.granter, this.grantee, this.allowance});
  factory MsgGrantAllowance.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgGrantAllowance(
        granter: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        grantee: decode
            .getResult(2)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        allowance:
            decode.getResult(3)?.to<Any, List<int>>((e) => Any.deserialize(e)));
  }
  factory MsgGrantAllowance.fromJson(Map<String, dynamic> json) {
    return MsgGrantAllowance(
        granter: json.asAddress("granter"),
        grantee: json.asAddress("grantee"),
        allowance: json.maybeAs<Any, Map<String, dynamic>>(
            key: "allowance", onValue: (e) => Any.fromJson(e)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "granter": granter?.address,
      "grantee": grantee?.address,
      "allowance": allowance?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => FeegrantV1beta1Types.msgGrantAllowance;

  @override
  List get values => [granter, grantee, allowance];
  @override
  List<String?> get signers => [granter?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        FeegrantV1beta1Types.msgGrantAllowanceResponse);
  }
}
