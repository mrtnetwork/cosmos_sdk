import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/order.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// UpgradeFields are the fields in a channel end which may be changed during a channel upgrade.
class UpgradeFields extends CosmosMessage {
  final IbcChannelOrder? ordering;
  final List<String>? connectionHops;
  final String? version;
  UpgradeFields({this.ordering, List<String>? connectionHops, this.version})
      : connectionHops = connectionHops?.immutable;
  factory UpgradeFields.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return UpgradeFields(
        ordering: decode
            .getResult(1)
            ?.to<IbcChannelOrder, int>((e) => IbcChannelOrder.fromValue(e)),
        connectionHops: decode.getFields<String>(2),
        version: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "ordering": ordering?.value,
      "connection_hops": connectionHops,
      "version": version
    };
  }

  @override
  String get typeUrl => IbcTypes.upgradeFields.typeUrl;

  @override
  List get values => [ordering?.value, connectionHops, version];
}
