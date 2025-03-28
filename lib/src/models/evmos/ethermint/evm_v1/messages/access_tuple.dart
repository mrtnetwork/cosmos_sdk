import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// ChainConfig defines the Ethereum ChainConfig parameters
class EvmosEthermintEVMV1AccessTuple extends CosmosMessage {
  /// address is a hex formatted ethereum addres
  final String address;

  /// storage_keys are hex formatted hashes of the storage keys
  final List<String> storageKeys;
  EvmosEthermintEVMV1AccessTuple({
    required this.address,
    required List<String> storageKeys,
  }) : storageKeys = storageKeys.immutable;
  factory EvmosEthermintEVMV1AccessTuple.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1AccessTuple(
        address: decode.getField(1), storageKeys: decode.getFields<String>(2));
  }
  factory EvmosEthermintEVMV1AccessTuple.fromJson(Map<String, dynamic> json) {
    return EvmosEthermintEVMV1AccessTuple(
        address: json.as("address"),
        storageKeys: json.asListOfString("storage_keys")!);
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
  TypeUrl get typeUrl => EvmosErc20V1Types.accessTuple;

  @override
  List get values => [address, storageKeys];
}
