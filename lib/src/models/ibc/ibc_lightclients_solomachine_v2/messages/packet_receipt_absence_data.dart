import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// PacketReceiptAbsenceData returns the SignBytes data for packet receipt absence verification..
class IbcSoloMachineV2PacketReceiptAbsenceData extends CosmosMessage {
  final List<int>? path;
  IbcSoloMachineV2PacketReceiptAbsenceData({List<int>? path})
      : path = BytesUtils.tryToBytes(path, unmodifiable: true);
  factory IbcSoloMachineV2PacketReceiptAbsenceData.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcSoloMachineV2PacketReceiptAbsenceData(path: decode.getField(1));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"path": BytesUtils.tryToHexString(path)};
  }

  @override
  String get typeUrl => IbcTypes.soloMachineV2PacketReceiptAbsenceData.typeUrl;

  @override
  List get values => [path];
}
