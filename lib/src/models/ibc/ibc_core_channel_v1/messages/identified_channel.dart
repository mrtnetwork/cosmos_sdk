import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/counter_party.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/order.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/state.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// IdentifiedChannel defines a channel with additional port and channel identifier fields.
class IbcChannelIdentifiedChannel extends CosmosMessage {
  /// current state of the channel end
  final IbcChannelState? state;

  /// whether the channel is ordered or unordered
  final IbcChannelOrder? ordering;

  /// counterparty channel end
  final IbcChannelCounterParty? counterparty;

  /// list of connection identifiers, in order, along which packets sent on
  /// this channel will travel
  final List<String>? connectionHops;

  /// opaque channel version, which is agreed upon during the handshake
  final String? version;

  /// port identifier
  final String? portId;

  /// channel identifier
  final String? channelId;

  /// upgrade sequence indicates the latest upgrade attempt performed by this channel
  /// the value of 0 indicates the channel has never been upgraded
  final BigInt? upgradeSequence;
  IbcChannelIdentifiedChannel(
      {this.state,
      this.ordering,
      this.counterparty,
      List<String>? connectionHops,
      this.version,
      this.portId,
      this.channelId,
      this.upgradeSequence})
      : connectionHops = connectionHops?.mutable;
  factory IbcChannelIdentifiedChannel.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelIdentifiedChannel(
        state: decode
            .getResult(1)
            ?.to<IbcChannelState, int>((e) => IbcChannelState.fromValue(e)),
        ordering: decode
            .getResult(2)
            ?.to<IbcChannelOrder, int>((e) => IbcChannelOrder.fromValue(e)),
        counterparty: decode
            .getResult(3)
            ?.to<IbcChannelCounterParty, List<int>>(
                (e) => IbcChannelCounterParty.deserialize(e)),
        connectionHops: decode.getFields(4),
        version: decode.getField(5),
        portId: decode.getField(6),
        channelId: decode.getField(7),
        upgradeSequence: decode.getField(8));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Map<String, dynamic> toJson() {
    return {
      "state": state?.value,
      "ordering": ordering?.value,
      "counterparty": counterparty?.toJson(),
      "connection_hops": connectionHops,
      "version": version,
      "port_id": portId,
      "channel_id": channelId,
      "upgrade_sequence": upgradeSequence?.toString()
    };
  }

  @override
  String get typeUrl => IbcTypes.identifiedChannel.typeUrl;

  @override
  List get values => [
        state?.value,
        ordering?.value,
        counterparty,
        connectionHops,
        version,
        portId,
        channelId,
        upgradeSequence
      ];
}
