import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Grant is stored in the KVStore to record a grant with full context
class FeeGrant extends CosmosMessage {
  /// granter is the address of the user granting an allowance of their funds.
  final BaseAddress? granter;

  /// grantee is the address of the user being granted an allowance of another user's funds.
  final BaseAddress? grantee;

  /// allowance can be any of basic, periodic, allowed fee allowance.
  final Any? allowance;
  const FeeGrant({this.granter, this.grantee, this.allowance});
  factory FeeGrant.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return FeeGrant(
        granter:
            decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        grantee:
            decode.getResult(2)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        allowance:
            decode.getResult(3)?.to<Any, List<int>>((e) => Any.deserialize(e)));
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
  String get typeUrl => FeegrantV1beta1Types.feeGrant.typeUrl;

  @override
  List get values => [granter, grantee, allowance];
}
