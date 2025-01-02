import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// NextSequenceRecvData returns the SignBytes data for verification of the next sequence to be received
class IbcSoloMachineV2NextSequenceRecvData extends CosmosMessage {
  final List<int>? path;
  final BigInt? nextSeqRecv;
  IbcSoloMachineV2NextSequenceRecvData({List<int>? path, this.nextSeqRecv})
      : path = BytesUtils.tryToBytes(path, unmodifiable: true);
  factory IbcSoloMachineV2NextSequenceRecvData.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcSoloMachineV2NextSequenceRecvData(
        path: decode.getField(1), nextSeqRecv: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "path": BytesUtils.tryToHexString(path),
      "next_seq_recv": nextSeqRecv?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.soloMachineV2NextSequenceRecvData;

  @override
  List get values => [path, nextSeqRecv];
}
