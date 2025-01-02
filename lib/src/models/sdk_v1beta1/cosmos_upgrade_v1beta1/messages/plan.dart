import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Plan specifies information about a planned upgrade and when it should occur.
class Plan extends CosmosMessage {
  /// Sets the name for the upgrade. This name will be used by the upgraded
  /// version of the software to apply any special "on-upgrade" commands during
  /// the first BeginBlock method after the upgrade is applied. It is also used
  /// to detect whether a software version can handle a given upgrade. If no
  /// upgrade handler with this name has been set in the software, it will be
  /// assumed that the software is out-of-date when the upgrade Time or Height is
  /// reached and the software will exit.
  final String? name;

  /// Deprecated: Time based upgrades have been deprecated. Time based upgrade logic
  /// has been removed from the SDK.
  /// If this field is not empty, an error will be thrown.
  final ProtobufTimestamp time;

  /// The height at which the upgrade must be performed.
  final BigInt? height;

  /// Any application specific upgrade info to be included on-chain
  /// such as a git commit that validators could automatically upgrade to
  final String? info;

  /// Deprecated: UpgradedClientState field has been deprecated. IBC upgrade logic has been
  /// moved to the IBC module in the sub module 02-client.
  /// If this field is not empty, an error will be thrown.
  final AnyMessage? upgradedClientState;

  factory Plan.fromRpc(Map<String, dynamic> json) {
    return Plan(
        time: ProtobufTimestamp.fromString(json["time"]),
        height: BigintUtils.tryParse(json["height"]),
        info: json["info"],
        name: json["name"],
        upgradedClientState: AnyMessage.fromRpc(json["upgraded_client_state"]));
  }

  Plan({
    this.name,
    required this.time,
    this.height,
    this.info,
    this.upgradedClientState,
  });

  factory Plan.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Plan(
        name: decode.getField(1),
        time: ProtobufTimestamp.deserialize(decode.getField(2)),
        height: decode.getField(3),
        info: decode.getField(4),
        upgradedClientState: decode
            .getResult(5)
            ?.to<AnyMessage, List<int>>((e) => AnyMessage.deserialize(e)));
  }

  /// Converts the plan to a JSON-serializable map.
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'time': time.toJson(),
      'height': height?.toString(),
      'info': info,
      "upgraded_client_state": upgradedClientState?.toJson()
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  TypeUrl get typeUrl => UpgradeV1beta1Types.plan;

  @override
  List get values => [name, time, height, info, upgradedClientState];
}
