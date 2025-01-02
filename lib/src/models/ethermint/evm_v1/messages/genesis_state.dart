import 'package:cosmos_sdk/src/models/ethermint/evm_v1/messages/genesis_account.dart';
import 'package:cosmos_sdk/src/models/ethermint/evm_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GenesisState defines the evm module's genesis state.
class EVMV1GenesisState extends CosmosMessage {
  /// accounts is an array containing the ethereum genesis accounts.
  final List<EVMV1GenesisAccount> accounts;

  /// params defines all the parameters of the module.
  final EVMV1Params params;

  EVMV1GenesisState({required this.accounts, required this.params});
  factory EVMV1GenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1GenesisState(
        accounts: decode
            .getFields<List<int>>(1)
            .map((e) => EVMV1GenesisAccount.deserialize(e))
            .toList(),
        params: EVMV1Params.deserialize(decode.getField(2)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "accounts": accounts.map((e) => e.toJson()).toList(),
      "params": params.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.genesisState;

  @override
  List get values => [accounts, params];
}
