import 'package:cosmos_sdk/src/models/ibc/ibc_lightclients_solomachine_v2/messages/signature_and_data.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Misbehaviour defines misbehaviour for a solo machine which consists of a sequence and two
/// signatures over different messages at that sequence.
class IbcSoloMachineV2Misbehaviour extends CosmosMessage {
  final String? clientId;
  final BigInt? sequence;
  final IbcSoloMachineV2SignatureAndData? signatureOne;
  final IbcSoloMachineV2SignatureAndData? signatureTwo;
  IbcSoloMachineV2Misbehaviour(
      {this.clientId, this.sequence, this.signatureOne, this.signatureTwo});
  factory IbcSoloMachineV2Misbehaviour.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcSoloMachineV2Misbehaviour(
      clientId: decode.getField(1),
      sequence: decode.getField(2),
      signatureOne: decode
          .getResult(3)
          ?.to<IbcSoloMachineV2SignatureAndData, List<int>>(
              (e) => IbcSoloMachineV2SignatureAndData.deserialize(e)),
      signatureTwo: decode
          .getResult(4)
          ?.to<IbcSoloMachineV2SignatureAndData, List<int>>(
              (e) => IbcSoloMachineV2SignatureAndData.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "client_id": clientId,
      "sequence": sequence?.toString(),
      "signature_one": signatureOne?.toJson(),
      "signature_two": signatureTwo?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.soloMachineV2Misbehaviour;

  @override
  List get values => [clientId, sequence, signatureOne, signatureTwo];
}
