import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/counter_party.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/order.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/state.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// Channel defines pipeline for exactly-once packet delivery between specific
/// modules on separate blockchains, which has at least one end capable of sending
/// packets and one end capable of receiving packets.
class IbcChannelChannel extends CosmosMessage {
  /// current state of the channel end
  final IbcChannelState? state;

  /// whether the channel is ordered or unordered
  final IbcChannelOrder? ordering;

  /// counterparty channel end
  final IbcChannelCounterParty counterparty;

  /// list of connection identifiers, in order, along which packets sent on
  /// this channel will travel
  final List<String>? connectionHops;

  /// opaque channel version, which is agreed upon during the handshake
  final String? version;

  /// upgrade sequence indicates the latest upgrade attempt performed by this channel
  /// the value of 0 indicates the channel has never been upgraded
  final BigInt? upgradeSequence;
  factory IbcChannelChannel.fromJson(Map<String, dynamic> json) {
    return IbcChannelChannel(
        counterparty: IbcChannelCounterParty.fromJson(json["counterparty"]),
        connectionHops: (json["connection_hops"] as List?)?.cast(),
        ordering: json["ordering"] == null
            ? null
            : IbcChannelOrder.fromValue(json["ordering"]),
        state: json["state"] == null
            ? null
            : IbcChannelState.fromValue(json["state"]),
        upgradeSequence: BigintUtils.tryParse(json["upgrade_sequence"]),
        version: json["version"]);
  }
  IbcChannelChannel(
      {this.state,
      this.ordering,
      required this.counterparty,
      List<String>? connectionHops,
      this.version,
      this.upgradeSequence})
      : connectionHops = connectionHops?.emptyAsNull?.immutable;
  factory IbcChannelChannel.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelChannel(
        state: decode
            .getResult(1)
            ?.to<IbcChannelState, int>((e) => IbcChannelState.fromValue(e)),
        ordering: decode
            .getResult(2)
            ?.to<IbcChannelOrder, int>((e) => IbcChannelOrder.fromValue(e)),
        counterparty: IbcChannelCounterParty.deserialize(decode.getField(3)),
        connectionHops: decode.getFields<String>(4),
        version: decode.getField(5),
        upgradeSequence: decode.getField(6));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "state": state?.value,
      "ordering": ordering?.value,
      "counterparty": counterparty.toJson(),
      "connection_hops": connectionHops,
      "version": version,
      "upgrade_sequence": upgradeSequence?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channel;

  @override
  List get values => [
        state?.value,
        ordering?.value,
        counterparty,
        connectionHops,
        version,
        upgradeSequence
      ];
}
