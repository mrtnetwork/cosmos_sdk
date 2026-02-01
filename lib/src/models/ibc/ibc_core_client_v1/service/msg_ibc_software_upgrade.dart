import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/messages/plan.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgIBCSoftwareUpgrade defines the message used to
/// schedule an upgrade of an IBC client using a v1 governance proposal
class MsgIBCSoftwareUpgrade extends IbcService<EmptyServiceRequestResponse> {
  final Plan plan;

  /// An UpgradedClientState must be provided to perform an IBC breaking upgrade.
  /// This will make the chain commit to the correct upgraded (self) client state
  /// before the upgrade occurs, so that connecting chains can verify that the
  /// new upgraded client is valid by verifying a proof on the previous version
  /// of the chain. This will allow IBC connections to persist smoothly across
  /// planned chain upgrades. Correspondingly, the UpgradedClientState field has been
  /// deprecated in the Cosmos SDK to allow for this logic to exist solely in
  /// the 02-client module.
  final Any? upgradedClientState;

  /// signer address
  final String? signer;
  const MsgIBCSoftwareUpgrade({
    required this.plan,
    required this.upgradedClientState,
    this.signer,
  });

  factory MsgIBCSoftwareUpgrade.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgIBCSoftwareUpgrade(
      plan: Plan.deserialize(decode.getField(1)),
      upgradedClientState: decode
          .getResult(2)
          ?.to<Any, List<int>>(Any.deserialize),
      signer: decode.getField(3),
    );
  }
  factory MsgIBCSoftwareUpgrade.fromJson(Map<String, dynamic> json) {
    return MsgIBCSoftwareUpgrade(
      plan: Plan.fromJson(json.asMap("plan")),
      upgradedClientState: json.maybeAs<Any, Map<String, dynamic>>(
        key: "upgraded_client_state",
        onValue: Any.fromJson,
      ),
      signer: json.as("signer"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "plan": plan.toJson(),
      "upgraded_client_state": upgradedClientState?.toJson(),
      "signer": signer,
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgIBCSoftwareUpgrade;

  @override
  List get values => [plan, upgradedClientState, signer];
  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(IbcTypes.msgIBCSoftwareUpgradeResponse);
  }
}
