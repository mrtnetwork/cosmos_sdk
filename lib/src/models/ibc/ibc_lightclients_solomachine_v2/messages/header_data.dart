import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// HeaderData returns the SignBytes data for update verification.
class IbcSoloMachineV2HeaderData extends CosmosMessage {
  /// header public key
  final Any? newPublicKey;

  /// header diversifier
  final String? newDiversifier;
  const IbcSoloMachineV2HeaderData({this.newDiversifier, this.newPublicKey});
  factory IbcSoloMachineV2HeaderData.fromByte(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcSoloMachineV2HeaderData(
      newPublicKey: decode
          .getResult(1)
          ?.to<Any, List<int>>((e) => Any.deserialize(e)),
      newDiversifier: decode.getField(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "new_pub_key": newPublicKey?.toJson(),
      "new_diversifier": newDiversifier,
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.soloMachineV2HeaderData;

  @override
  List get values => [newPublicKey, newDiversifier];
}
