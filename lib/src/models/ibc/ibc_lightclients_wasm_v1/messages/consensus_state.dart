import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Wasm light client message (either header(s) or misbehaviour)
class IbcLightClientsWasmConsensusState extends CosmosMessage {
  /// bytes encoding the consensus state of the underlying light client
  /// implemented as a Wasm contract.
  final List<int>? data;
  IbcLightClientsWasmConsensusState({List<int>? data})
      : data = BytesUtils.tryToBytes(data);
  factory IbcLightClientsWasmConsensusState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcLightClientsWasmConsensusState(data: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"data": BytesUtils.tryToHexString(data)};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcLightClientsWasmConsensusState;

  @override
  List get values => [data];
}
