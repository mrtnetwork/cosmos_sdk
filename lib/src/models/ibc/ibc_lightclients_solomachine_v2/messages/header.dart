import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Header defines a solo machine consensus header
class IbcSoloMachineV2Header extends CosmosMessage {
  /// sequence to update solo machine public key at
  final BigInt? sequence;
  final BigInt? timestamp;
  final List<int>? signature;
  final Any? newPublicKey;
  final String? newDiversifier;
  IbcSoloMachineV2Header(
      {this.sequence,
      this.timestamp,
      List<int>? signature,
      this.newPublicKey,
      this.newDiversifier})
      : signature = BytesUtils.tryToBytes(signature);
  factory IbcSoloMachineV2Header.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcSoloMachineV2Header(
        sequence: decode.getField(1),
        timestamp: decode.getField(2),
        signature: decode.getField(3),
        newPublicKey:
            decode.getResult(4)?.to<Any, List<int>>((e) => Any.deserialize(e)),
        newDiversifier: decode.getField(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sequence": sequence?.toString(),
      "timestamp": timestamp?.toString(),
      "signature": BytesUtils.tryToHexString(signature),
      "new_public_key": newPublicKey?.toJson(),
      "new_diversifier": newDiversifier
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.soloMachineV2Header;

  @override
  List get values =>
      [sequence, timestamp, signature, newPublicKey, newDiversifier];
}
