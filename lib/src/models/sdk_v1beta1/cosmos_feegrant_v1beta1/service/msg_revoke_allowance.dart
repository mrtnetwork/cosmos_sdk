import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgRevokeAllowance removes any existing Allowance from Granter to Grantee.
class MsgRevokeAllowance extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// granter is the address of the user granting an allowance of their funds.
  final BaseAddress? granter;

  /// grantee is the address of the user being granted an allowance of another user's funds.
  final BaseAddress? grantee;

  const MsgRevokeAllowance({this.granter, this.grantee});
  factory MsgRevokeAllowance.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgRevokeAllowance(
        granter:
            decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        grantee: decode
            .getResult(2)
            ?.to<BaseAddress, String>((e) => BaseAddress(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get service => FeegrantV1beta1Types.revokeAllowance.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"granter": granter?.address, "grantee": grantee?.address};
  }

  @override
  String get typeUrl => FeegrantV1beta1Types.msgRevokeAllowance.typeUrl;

  @override
  List get values => [granter, grantee];

  @override
  List<String?> get signers => [granter?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        FeegrantV1beta1Types.msgRevokeAllowanceResponse.typeUrl);
  }
}
