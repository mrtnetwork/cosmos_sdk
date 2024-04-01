import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Counterparty defines a channel end counterparty
class IbcChannelCounterParty extends CosmosMessage {
  /// port on the counterparty chain which owns the other end of the channel.
  final String? portId;

  /// channel end on the counterparty chain
  final String? channelId;
  const IbcChannelCounterParty({this.portId, this.channelId});
  factory IbcChannelCounterParty.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelCounterParty(
        portId: decode.getField(1), channelId: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"port_id": portId, "channel_id": channelId};
  }

  @override
  String get typeUrl => IbcTypes.counterParty.typeUrl;

  @override
  List get values => [portId, channelId];
}
