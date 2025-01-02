import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_lightclients_solomachine_v2/messages/data_type.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// SignatureAndData contains a signature and the data signed over to create that signature.
class IbcSoloMachineV2SignatureAndData extends CosmosMessage {
  final List<int>? signature;
  final IbcSoloMachineV2DataType? dataType;
  final List<int>? data;
  final BigInt? timestamp;
  IbcSoloMachineV2SignatureAndData(
      {List<int>? signature, this.dataType, List<int>? data, this.timestamp})
      : signature = BytesUtils.tryToBytes(signature, unmodifiable: true),
        data = BytesUtils.tryToBytes(data, unmodifiable: true);
  factory IbcSoloMachineV2SignatureAndData.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcSoloMachineV2SignatureAndData(
        signature: decode.getField(1),
        dataType: decode.getResult(2)?.to<IbcSoloMachineV2DataType, int>(
            (e) => IbcSoloMachineV2DataType.fromValue(e)),
        data: decode.getField(3),
        timestamp: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "signature": BytesUtils.tryToHexString(signature),
      "data_type": dataType?.value,
      "data": BytesUtils.tryToHexString(data),
      "timestamp": timestamp?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.soloMachineV2SignatureAndData;

  @override
  List get values => [signature, dataType?.value, data, timestamp];
}
