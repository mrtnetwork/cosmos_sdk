import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Header defines a solo machine consensus header
class IbcSoloMachineV3Header extends CosmosMessage {
  final BigInt? timestamp;
  final List<int>? signature;
  final Any? newPublicKey;
  final String? newDiversifier;
  IbcSoloMachineV3Header(
      {this.timestamp,
      List<int>? signature,
      this.newPublicKey,
      this.newDiversifier})
      : signature = BytesUtils.tryToBytes(signature);
  factory IbcSoloMachineV3Header.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcSoloMachineV3Header(
        timestamp: decode.getField(1),
        signature: decode.getField(2),
        newPublicKey:
            decode.getResult(3)?.to<Any, List<int>>((e) => Any.deserialize(e)),
        newDiversifier: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "timestamp": timestamp?.toString(),
      "signature": BytesUtils.tryToHexString(signature),
      "new_public_key": newPublicKey?.toJson(),
      "new_diversifier": newDiversifier
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.soloMachineV3Header;

  @override
  List get values => [timestamp, signature, newPublicKey, newDiversifier];
}
