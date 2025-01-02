import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// TimestampedSignatureData contains the signature data and the timestamp of the signature.
class IbcSoloMachineV2TimestampedSignatureData extends CosmosMessage {
  final List<int>? signatureData;
  final BigInt? timestamp;
  IbcSoloMachineV2TimestampedSignatureData(
      {List<int>? signatureData, this.timestamp})
      : signatureData =
            BytesUtils.tryToBytes(signatureData, unmodifiable: true);
  factory IbcSoloMachineV2TimestampedSignatureData.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcSoloMachineV2TimestampedSignatureData(
        signatureData: decode.getField(1), timestamp: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "signature_data": BytesUtils.tryToHexString(signatureData),
      "timestamp": timestamp?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.soloMachineV2TimestampedSignatureData;

  @override
  List get values => [signatureData, timestamp];
}
