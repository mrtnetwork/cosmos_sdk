import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// SignBytes defines the signed bytes used for signature verification.
class IbcSoloMachineV3SignBytes extends CosmosMessage {
  /// the sequence number
  final BigInt? sequence;

  /// the proof timestamp
  final BigInt? timestamp;

  /// the public key diversifier
  final String? diversifier;

  /// the standardised path bytes
  final List<int>? path;

  /// the marshaled data bytes
  final List<int>? data;
  IbcSoloMachineV3SignBytes({
    this.sequence,
    this.timestamp,
    this.diversifier,
    List<int>? path,
    List<int>? data,
  }) : data = BytesUtils.tryToBytes(data, unmodifiable: true),
       path = BytesUtils.tryToBytes(path, unmodifiable: true);
  factory IbcSoloMachineV3SignBytes.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcSoloMachineV3SignBytes(
      sequence: decode.getField(1),
      timestamp: decode.getField(2),
      diversifier: decode.getField(3),
      path: decode.getField(4),
      data: decode.getField(5),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sequence": sequence?.toString(),
      "timestamp": timestamp?.toString(),
      "diversifier": diversifier?.toString(),
      "path": BytesUtils.tryToHexString(path),
      "data": BytesUtils.tryToHexString(data),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.soloMachineV3SignBytes;

  @override
  List get values => [sequence, timestamp, diversifier, path, data];
}
