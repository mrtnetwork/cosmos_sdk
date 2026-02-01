import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/models/evmos/ethermint/evm_v1/messages/state.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GenesisAccount defines an account to be initialized in the genesis state.
/// Its main difference between with Geth's GenesisAccount is that it uses a
/// custom storage type and that it doesn't contain the private key field.
class EvmosEthermintEVMV1GenesisAccount extends CosmosMessage {
  /// address defines an ethereum hex formated address of an account
  final String address;

  /// code defines the hex bytes of the account code.
  final String code;

  /// storage defines the set of state key values for the account.
  final List<EvmosEthermintEVMV1State> storage;
  EvmosEthermintEVMV1GenesisAccount({
    required this.address,
    required this.code,
    required List<EvmosEthermintEVMV1State> storage,
  }) : storage = storage.immutable;
  factory EvmosEthermintEVMV1GenesisAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1GenesisAccount(
      address: decode.getField(1),
      code: decode.getField(2),
      storage:
          decode
              .getFields<List<int>>(3)
              .map((e) => EvmosEthermintEVMV1State.deserialize(e))
              .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "address": address,
      "code": code,
      "storage": storage.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.genesisAccount;

  @override
  List get values => [address, code, storage];
}
