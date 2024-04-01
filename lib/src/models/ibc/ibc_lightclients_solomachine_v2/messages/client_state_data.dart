import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ClientStateData returns the SignBytes data for client state verification.
class IbcSoloMachineV2ClientStateData extends CosmosMessage {
  final List<int>? path;
  final Any? clientState;
  IbcSoloMachineV2ClientStateData({List<int>? path, this.clientState})
      : path = BytesUtils.tryToBytes(path, unmodifiable: true);
  factory IbcSoloMachineV2ClientStateData.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcSoloMachineV2ClientStateData(
        path: decode.getField(1),
        clientState:
            decode.getResult(2)?.to<Any, List<int>>((e) => Any.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "path": BytesUtils.tryToHexString(path),
      "client_state": clientState?.toJson()
    };
  }

  @override
  String get typeUrl => IbcTypes.soloMachineV2ClientStateData.typeUrl;

  @override
  List get values => [path, clientState];
}
