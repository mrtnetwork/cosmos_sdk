import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgCancelUpgrade is the Msg/CancelUpgrade request type.
class MsgCancelUpgrade
    extends UpgradeV1Beta1Service<EmptyServiceRequestResponse> {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final CosmosBaseAddress? authority;

  const MsgCancelUpgrade({this.authority});
  factory MsgCancelUpgrade.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgCancelUpgrade(
        authority: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)));
  }

  factory MsgCancelUpgrade.fromJson(Map<String, dynamic> json) {
    return MsgCancelUpgrade(authority: json.asAddress("authority"));
  }

  /// Converts the message to a JSON-serializable map.
  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority?.address};
  }

  @override
  List<int> get fieldIds => [1];

  @override
  TypeUrl get typeUrl => UpgradeV1beta1Types.msgCancelUpgrade;

  @override
  List get values => [authority?.address];
  @override
  List<String?> get signers => [authority?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        UpgradeV1beta1Types.msgCancelUpgradeResponse);
  }
}
