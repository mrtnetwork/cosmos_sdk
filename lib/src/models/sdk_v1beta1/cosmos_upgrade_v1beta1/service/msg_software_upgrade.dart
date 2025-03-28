import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/messages/plan.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgSoftwareUpgrade is the Msg/SoftwareUpgrade request type.
class MsgSoftwareUpgrade
    extends UpgradeV1Beta1Service<EmptyServiceRequestResponse> {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final CosmosBaseAddress? authority;

  /// plan is the upgrade plan.
  final Plan plan;

  const MsgSoftwareUpgrade({
    this.authority,
    required this.plan,
  });
  factory MsgSoftwareUpgrade.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgSoftwareUpgrade(
        plan: Plan.deserialize(decode.getField(2)),
        authority: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)));
  }
  factory MsgSoftwareUpgrade.fromJson(Map<String, dynamic> json) {
    return MsgSoftwareUpgrade(
        plan: Plan.fromJson(json.asMap("plan")),
        authority: json.asAddress("authority"));
  }

  /// Converts the message to a JSON-serializable map.
  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority?.address,
      'plan': plan.toJson(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  TypeUrl get typeUrl => UpgradeV1beta1Types.msgSoftwareUpgrade;

  @override
  List get values => [authority?.address, plan];
  @override
  List<String?> get signers => [authority?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        UpgradeV1beta1Types.msgSoftwareUpgradeResponse);
  }
}
