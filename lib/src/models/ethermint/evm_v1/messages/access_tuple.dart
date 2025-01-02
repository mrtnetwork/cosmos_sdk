import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ChainConfig defines the Ethereum ChainConfig parameters
class EVMV1AccessTuple extends CosmosMessage {
  /// address is a hex formatted ethereum addres
  final String address;

  /// storage_keys are hex formatted hashes of the storage keys
  final List<String> storageKeys;
  EVMV1AccessTuple({
    required this.address,
    required List<String> storageKeys,
  }) : storageKeys = storageKeys.immutable;
  factory EVMV1AccessTuple.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1AccessTuple(
        address: decode.getField(1), storageKeys: decode.getFields<String>(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "address": address,
      "storage_keys": storageKeys,
    };
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.accessTuple;

  @override
  List get values => [address, storageKeys];
}
