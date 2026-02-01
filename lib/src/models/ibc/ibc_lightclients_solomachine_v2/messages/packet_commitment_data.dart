import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// PacketCommitmentData returns the SignBytes data for packet commitment verification.
class IbcSoloMachineV2PacketCommitmentData extends CosmosMessage {
  final List<int>? path;
  final List<int>? commitment;
  IbcSoloMachineV2PacketCommitmentData({List<int>? path, List<int>? commitment})
    : path = BytesUtils.tryToBytes(path, unmodifiable: true),
      commitment = BytesUtils.tryToBytes(commitment, unmodifiable: true);
  factory IbcSoloMachineV2PacketCommitmentData.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcSoloMachineV2PacketCommitmentData(
      path: decode.getField(1),
      commitment: decode.getField(2),
    );
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "path": BytesUtils.tryToHexString(path),
      "commitment ": BytesUtils.tryToHexString(commitment),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.soloMachineV2PacketCommitmentData;

  @override
  List get values => [path, commitment];
}
