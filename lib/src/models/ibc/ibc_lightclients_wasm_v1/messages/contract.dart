import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Wasm light client message (either header(s) or misbehaviour)
class IbcLightClientsWasmContract extends CosmosMessage {
  /// bytes encoding the consensus state of the underlying light client
  /// implemented as a Wasm contract.
  final List<int>? codeBytes;
  IbcLightClientsWasmContract({List<int>? codeBytes})
      : codeBytes = BytesUtils.tryToBytes(codeBytes);
  factory IbcLightClientsWasmContract.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcLightClientsWasmContract(codeBytes: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"code_bytes": BytesUtils.tryToHexString(codeBytes)};
  }

  @override
  String get typeUrl => IbcTypes.ibcLightClientsWasmContract.typeUrl;

  @override
  List get values => [codeBytes];
}
