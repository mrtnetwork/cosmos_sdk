import 'package:cosmos_sdk/src/models/ibc/ibc_lightclients_solomachine_v3/messages/signature_and_data.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Misbehaviour defines misbehaviour for a solo machine which consists of
/// a sequence and two signatures over different messages at that sequence.
class IbcSoloMachineV2Misbehaviour extends CosmosMessage {
  final BigInt? sequence;
  final IbcSoloMachineV3SignatureAndData? signatureOne;
  final IbcSoloMachineV3SignatureAndData? signatureTwo;
  IbcSoloMachineV2Misbehaviour(
      {this.sequence, this.signatureOne, this.signatureTwo});
  factory IbcSoloMachineV2Misbehaviour.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcSoloMachineV2Misbehaviour(
      sequence: decode.getField(1),
      signatureOne: decode
          .getResult(2)
          ?.to<IbcSoloMachineV3SignatureAndData, List<int>>(
              (e) => IbcSoloMachineV3SignatureAndData.deserialize(e)),
      signatureTwo: decode
          .getResult(3)
          ?.to<IbcSoloMachineV3SignatureAndData, List<int>>(
              (e) => IbcSoloMachineV3SignatureAndData.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sequence": sequence?.toString(),
      "signature_one": signatureOne?.toJson(),
      "signature_two": signatureTwo?.toJson()
    };
  }

  @override
  String get typeUrl => IbcTypes.soloMachineV3Misbehaviour.typeUrl;

  @override
  List get values => [sequence, signatureOne, signatureTwo];
}
