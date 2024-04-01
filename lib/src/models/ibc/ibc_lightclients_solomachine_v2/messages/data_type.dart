import 'package:blockchain_utils/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/types/cosmos_enum.dart';

class IbcSoloMachineV2DataType implements CosmosEnum {
  @override
  final String name;
  @override
  final int value;

  const IbcSoloMachineV2DataType._(this.name, this.value);

  static const IbcSoloMachineV2DataType uninitializedUnspecified =
      IbcSoloMachineV2DataType._("uninitializedUnspecified", 0);
  static const IbcSoloMachineV2DataType clientState =
      IbcSoloMachineV2DataType._("clientState", 1);
  static const IbcSoloMachineV2DataType consensusState =
      IbcSoloMachineV2DataType._("consensusState", 2);
  static const IbcSoloMachineV2DataType connectionState =
      IbcSoloMachineV2DataType._("connectionState", 3);
  static const IbcSoloMachineV2DataType channelState =
      IbcSoloMachineV2DataType._("channelState", 4);
  static const IbcSoloMachineV2DataType packetCommitment =
      IbcSoloMachineV2DataType._("packetCommitment", 5);
  static const IbcSoloMachineV2DataType packetAcknowledgement =
      IbcSoloMachineV2DataType._("packetAcknowledgement", 6);
  static const IbcSoloMachineV2DataType packetReceiptAbsence =
      IbcSoloMachineV2DataType._("packetReceiptAbsence", 7);
  static const IbcSoloMachineV2DataType nextSequenceRecv =
      IbcSoloMachineV2DataType._("nextSequenceRecv", 8);
  static const IbcSoloMachineV2DataType header =
      IbcSoloMachineV2DataType._("header", 9);
  static const List<IbcSoloMachineV2DataType> values = [
    uninitializedUnspecified,
    clientState,
    consensusState,
    connectionState,
    channelState,
    packetCommitment,
    packetAcknowledgement,
    packetReceiptAbsence,
    nextSequenceRecv,
    header,
  ];
  static IbcSoloMachineV2DataType fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw MessageException(
          "No IbcSoloMachineV2DataType element found for the given value.",
          details: {"value": value}),
    );
  }
}
