import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/channel.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ChannelStateData returns the SignBytes data for channel state verification.
class IbcSoloMachineV2ChannelStateData extends CosmosMessage {
  final List<int>? path;
  final IbcChannelChannel? channel;
  IbcSoloMachineV2ChannelStateData({List<int>? path, required this.channel})
      : path = BytesUtils.tryToBytes(path, unmodifiable: true);
  factory IbcSoloMachineV2ChannelStateData.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcSoloMachineV2ChannelStateData(
      path: decode.getField(1),
      channel: decode.getResult(2)?.to<IbcChannelChannel, List<int>>(
          (e) => IbcChannelChannel.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "path": BytesUtils.tryToHexString(path),
      "channel": channel?.toJson()
    };
  }

  @override
  String get typeUrl => IbcTypes.soloMachineV2ChannelStateData.typeUrl;

  @override
  List get values => [path, channel];
}
