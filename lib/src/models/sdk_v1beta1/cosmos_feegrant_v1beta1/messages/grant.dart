import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Grant is stored in the KVStore to record a grant with full context
class FeeGrant extends CosmosMessage {
  /// granter is the address of the user granting an allowance of their funds.
  final CosmosBaseAddress? granter;

  /// grantee is the address of the user being granted an allowance of another user's funds.
  final CosmosBaseAddress? grantee;

  /// allowance can be any of basic, periodic, allowed fee allowance.
  final AnyMessage? allowance;

  factory FeeGrant.fromJson(Map<String, dynamic> json) {
    return FeeGrant(
        granter:
            json["granter"] == null ? null : CosmosBaseAddress(json["granter"]),
        grantee:
            json["grantee"] == null ? null : CosmosBaseAddress(json["grantee"]),
        allowance: json["allowance"] == null
            ? null
            : AnyMessage.fromJson(json["allowance"]));
  }
  const FeeGrant({this.granter, this.grantee, this.allowance});
  factory FeeGrant.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return FeeGrant(
        granter: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        grantee: decode
            .getResult(2)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        allowance: decode
            .getResult(3)
            ?.to<AnyMessage, List<int>>((e) => AnyMessage.deserialize(e)));
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
  TypeUrl get typeUrl => FeegrantV1beta1Types.feeGrant;

  @override
  List get values => [granter, grantee, allowance];
}
