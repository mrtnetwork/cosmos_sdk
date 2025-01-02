import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// PacketAcknowledgementData returns the SignBytes data for acknowledgement verification.
class IbcSoloMachineV2PacketAcknowledgementData extends CosmosMessage {
  final List<int>? path;
  final List<int>? acknowledgement;
  IbcSoloMachineV2PacketAcknowledgementData(
      {List<int>? path, List<int>? acknowledgement})
      : path = BytesUtils.tryToBytes(path, unmodifiable: true),
        acknowledgement =
            BytesUtils.tryToBytes(acknowledgement, unmodifiable: true);
  factory IbcSoloMachineV2PacketAcknowledgementData.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcSoloMachineV2PacketAcknowledgementData(
        path: decode.getField(1), acknowledgement: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "path": BytesUtils.tryToHexString(path),
      "acknowledgement": BytesUtils.tryToHexString(acknowledgement),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.soloMachineV2PacketAcknowledgementData;

  @override
  List get values => [path, acknowledgement];
}
