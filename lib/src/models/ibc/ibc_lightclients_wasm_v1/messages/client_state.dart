import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Wasm light client's Client state
class IbcLightClientsWasmClientState extends CosmosMessage {
  /// bytes encoding the client state of the underlying light client
  /// implemented as a Wasm contract.
  final List<int>? data;
  final List<int>? checksum;
  final IbcClientHeight latestHeight;
  IbcLightClientsWasmClientState(
      {List<int>? data, List<int>? checksum, required this.latestHeight})
      : data = BytesUtils.tryToBytes(data),
        checksum = BytesUtils.tryToBytes(checksum);
  factory IbcLightClientsWasmClientState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcLightClientsWasmClientState(
        data: decode.getField(1),
        checksum: decode.getField(2),
        latestHeight: IbcClientHeight.deserialize(decode.getField(3)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "data": BytesUtils.tryToHexString(data),
      "checksum": BytesUtils.tryToHexString(checksum),
      "latest_height": latestHeight.toJson()
    };
  }

  @override
  String get typeUrl => IbcTypes.ibcLightClientsWasmClientState.typeUrl;

  @override
  List get values => [data, checksum, latestHeight];
}
