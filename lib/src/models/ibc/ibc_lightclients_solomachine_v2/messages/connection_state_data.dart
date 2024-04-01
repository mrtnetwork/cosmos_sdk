import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/connection_end.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ConnectionStateData returns the SignBytes data for connection state verification.
class IbcSoloMachineV2ConnectionStateData extends CosmosMessage {
  final List<int>? path;
  final IbcConnectionConnectionEnd? connection;
  IbcSoloMachineV2ConnectionStateData({List<int>? path, this.connection})
      : path = BytesUtils.tryToBytes(path, unmodifiable: true);
  factory IbcSoloMachineV2ConnectionStateData.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcSoloMachineV2ConnectionStateData(
        path: decode.getField(1),
        connection: decode
            .getResult(2)
            ?.to<IbcConnectionConnectionEnd, List<int>>(
                (e) => IbcConnectionConnectionEnd.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "path": BytesUtils.tryToHexString(path),
      "connection": connection?.toJson()
    };
  }

  @override
  String get typeUrl => IbcTypes.soloMachineV2ConnectionStateData.typeUrl;

  @override
  List get values => [path, connection];
}
