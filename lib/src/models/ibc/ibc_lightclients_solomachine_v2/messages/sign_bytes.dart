import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_lightclients_solomachine_v2/messages/data_type.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// SignBytes defines the signed bytes used for signature verification.
class IbcSoloMachineV2SignBytes extends CosmosMessage {
  final BigInt? sequence;
  final BigInt? timestamp;
  final String? diversifier;

  /// type of the data used
  final IbcSoloMachineV2DataType? dataType;

  /// marshaled data
  final List<int>? data;
  IbcSoloMachineV2SignBytes(
      {this.sequence,
      this.timestamp,
      this.diversifier,
      this.dataType,
      List<int>? data})
      : data = BytesUtils.tryToBytes(data, unmodifiable: true);
  factory IbcSoloMachineV2SignBytes.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcSoloMachineV2SignBytes(
        sequence: decode.getField(1),
        timestamp: decode.getField(2),
        diversifier: decode.getField(3),
        dataType: decode.getResult(4)?.to<IbcSoloMachineV2DataType, int>(
            (e) => IbcSoloMachineV2DataType.fromValue(e)),
        data: decode.getField(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sequence": sequence?.toString(),
      "timestamp": timestamp?.toString(),
      "diversifier": diversifier?.toString(),
      "data_type": dataType?.value,
      "data": BytesUtils.tryToHexString(data)
    };
  }

  @override
  String get typeUrl => IbcTypes.soloMachineV2SignBytes.typeUrl;

  @override
  List get values => [sequence, timestamp, diversifier, dataType?.value, data];
}
