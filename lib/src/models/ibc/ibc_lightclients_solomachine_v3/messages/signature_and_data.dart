import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// SignatureAndData contains a signature and the data signed over to create that signature..
class IbcSoloMachineV3SignatureAndData extends CosmosMessage {
  final List<int>? signature;
  final List<int>? path;
  final List<int>? data;
  final BigInt? timestamp;
  IbcSoloMachineV3SignatureAndData(
      {List<int>? signature, List<int>? path, List<int>? data, this.timestamp})
      : signature = BytesUtils.tryToBytes(signature, unmodifiable: true),
        data = BytesUtils.tryToBytes(data, unmodifiable: true),
        path = BytesUtils.tryToBytes(path, unmodifiable: true);
  factory IbcSoloMachineV3SignatureAndData.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcSoloMachineV3SignatureAndData(
        signature: decode.getField(1),
        path: decode.getField(2),
        data: decode.getField(3),
        timestamp: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "signature": BytesUtils.tryToHexString(signature),
      "path": BytesUtils.tryToHexString(path),
      "data": BytesUtils.tryToHexString(data),
      "timestamp": timestamp?.toString()
    };
  }

  @override
  String get typeUrl => IbcTypes.soloMachineV3SignatureAndData.typeUrl;

  @override
  List get values => [signature, path, data, timestamp];
}
