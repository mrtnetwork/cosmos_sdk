import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// TimestampedSignatureData contains the signature data and the timestamp of the signature.
class IbcSoloMachineV3TimestampedSignatureData extends CosmosMessage {
  final List<int>? signatureData;
  final BigInt? timestamp;
  IbcSoloMachineV3TimestampedSignatureData(
      {List<int>? signatureData, this.timestamp})
      : signatureData =
            BytesUtils.tryToBytes(signatureData, unmodifiable: true);
  factory IbcSoloMachineV3TimestampedSignatureData.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcSoloMachineV3TimestampedSignatureData(
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
  String get typeUrl => IbcTypes.soloMachineV3TimestampedSignatureData.typeUrl;

  @override
  List get values => [signatureData, timestamp];
}
