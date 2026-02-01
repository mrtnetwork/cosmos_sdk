import 'package:cosmos_sdk/src/models/ibc/ibc_lightclients_wasm_v1/messages/contract.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// GenesisState defines 08-wasm's keeper genesis state
class IbcLightClientsWasmGenesisState extends CosmosMessage {
  /// uploaded light client wasm contracts
  final List<IbcLightClientsWasmContract> contracts;
  IbcLightClientsWasmGenesisState(List<IbcLightClientsWasmContract> contracts)
    : contracts = contracts.immutable;
  factory IbcLightClientsWasmGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcLightClientsWasmGenesisState(
      decode
          .getFields<List<int>>(1)
          .map((e) => IbcLightClientsWasmContract.deserialize(e))
          .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"contracts": contracts.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcLightClientsWasmGenesisState;

  @override
  List get values => [contracts];
}
