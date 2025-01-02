import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/identified_channel.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/packet_sequence.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/packet_state.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// GenesisState defines the ibc channel submodule's genesis state.
class IbcChannelGenesisState extends CosmosMessage {
  final List<IbcChannelIdentifiedChannel> channels;
  final List<IbcChannelPacketState> acknowledgements;
  final List<IbcChannelPacketState> commitments;
  final List<IbcChannelPacketState> receipts;
  final List<IbcChannelPacketSequence> sendSequences;
  final List<IbcChannelPacketSequence> recvSequences;
  final List<IbcChannelPacketSequence> ackSequences;

  /// the sequence for the next generated channel identifier
  final BigInt? nextChannelSequence;
  final IbcChannelParams params;
  IbcChannelGenesisState(
      {required List<IbcChannelIdentifiedChannel> channels,
      required List<IbcChannelPacketState> acknowledgements,
      required List<IbcChannelPacketState> commitments,
      required List<IbcChannelPacketState> receipts,
      required List<IbcChannelPacketSequence> sendSequences,
      required List<IbcChannelPacketSequence> recvSequences,
      required List<IbcChannelPacketSequence> ackSequences,
      this.nextChannelSequence,
      required this.params})
      : channels = channels.immutable,
        acknowledgements = acknowledgements.immutable,
        commitments = commitments.immutable,
        receipts = receipts.immutable,
        sendSequences = sendSequences.immutable,
        recvSequences = recvSequences.immutable,
        ackSequences = ackSequences.immutable;
  factory IbcChannelGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelGenesisState(
        channels: decode
            .getFields(1)
            .map((e) => IbcChannelIdentifiedChannel.deserialize(e))
            .toList(),
        acknowledgements: decode
            .getFields(2)
            .map((e) => IbcChannelPacketState.deserialize(e))
            .toList(),
        commitments: decode
            .getFields(3)
            .map((e) => IbcChannelPacketState.deserialize(e))
            .toList(),
        receipts: decode
            .getFields(4)
            .map((e) => IbcChannelPacketState.deserialize(e))
            .toList(),
        sendSequences: decode
            .getFields(5)
            .map((e) => IbcChannelPacketSequence.deserialize(e))
            .toList(),
        recvSequences: decode
            .getFields(6)
            .map((e) => IbcChannelPacketSequence.deserialize(e))
            .toList(),
        ackSequences: decode
            .getFields(7)
            .map((e) => IbcChannelPacketSequence.deserialize(e))
            .toList(),
        nextChannelSequence: decode.getField(8),
        params: IbcChannelParams.deserialize(decode.getField(9)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Map<String, dynamic> toJson() {
    return {
      "channels": channels.map((e) => e.toJson()).toList(),
      "acknowledgements": acknowledgements.map((e) => e.toJson()).toList(),
      "commitments": commitments.map((e) => e.toJson()).toList(),
      "receipts": receipts.map((e) => e.toJson()).toList(),
      "send_sequences": sendSequences.map((e) => e.toJson()).toList(),
      "recv_sequences": recvSequences.map((e) => e.toJson()).toList(),
      "ack_sequences": ackSequences.map((e) => e.toJson()).toList(),
      "next_channel_sequence": nextChannelSequence?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcChannelGenesisState;

  @override
  List get values => [
        channels,
        acknowledgements,
        commitments,
        receipts,
        sendSequences,
        recvSequences,
        ackSequences,
        nextChannelSequence,
        params
      ];
}
