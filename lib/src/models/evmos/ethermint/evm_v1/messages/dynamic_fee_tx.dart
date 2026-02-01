import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

import 'access_tuple.dart';

/// DynamicFeeTx is the data of EIP-1559 dynamic fee transactions.
class EvmosEthermintEVMV1DynamicFeeTx extends CosmosMessage {
  /// chain_id of the destination EVM chain
  final String chainId;

  /// nonce corresponds to the account nonce (transaction sequence).
  final BigInt nonce;

  /// gas_tip_cap defines the max value for the gas tip
  final String gasTipCap;

  /// gas_fee_cap defines the max value for the gas fee
  final String gasFeeCap;

  /// gas defines the gas limit defined for the transaction.
  final BigInt gas;

  /// to is the recipient address in hex format
  final String to;

  /// value defines the unsigned integer value of the transaction amount.
  final String value;

  /// data is the data payload bytes of the transaction.
  final List<int>? data;

  /// accesses is an array of access tuples
  final List<EvmosEthermintEVMV1AccessTuple>? accesses;

  /// v defines the signature value
  final List<int> v;

  /// r defines the signature value
  final List<int> r;

  /// s define the signature value
  final List<int> s;
  EvmosEthermintEVMV1DynamicFeeTx({
    required this.chainId,
    required this.nonce,
    required this.gasTipCap,
    required this.gasFeeCap,
    required this.gas,
    required this.to,
    required this.value,
    required List<int>? data,
    required List<EvmosEthermintEVMV1AccessTuple>? accesses,
    required List<int> v,
    required List<int> r,
    required List<int> s,
  }) : data = data?.asImmutableBytes,
       v = v.asImmutableBytes,
       r = r.asImmutableBytes,
       s = s.asImmutableBytes,
       accesses = accesses?.immutable;
  factory EvmosEthermintEVMV1DynamicFeeTx.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1DynamicFeeTx(
      chainId: decode.getField(1),
      nonce: decode.getField(2),
      gasTipCap: decode.getField(3),
      gasFeeCap: decode.getField(4),
      gas: decode.getField(5),
      to: decode.getField(6),
      value: decode.getField(7),
      data: decode.getField(8),
      accesses:
          decode
              .getFields<List<int>>(9)
              .map((e) => EvmosEthermintEVMV1AccessTuple.deserialize(e))
              .toList(),
      v: decode.getField(10),
      r: decode.getField(11),
      s: decode.getField(12),
    );
  }
  factory EvmosEthermintEVMV1DynamicFeeTx.fromJson(Map<String, dynamic> json) {
    return EvmosEthermintEVMV1DynamicFeeTx(
      chainId: json.as("chain_id"),
      nonce: json.asBigInt("nonce"),
      gasTipCap: json.as("gas_tip_cap"),
      gasFeeCap: json.as("gas_fee_cap"),
      gas: json.asBigInt("gas"),
      to: json.as("to"),
      value: json.as("value"),
      data: json.asBytes("data"),
      accesses:
          json
              .asListOfMap("accesses")
              ?.map(EvmosEthermintEVMV1AccessTuple.fromJson)
              .toList(),
      v: json.asBytes("v", throwOnNull: true)!,
      r: json.asBytes("r", throwOnNull: true)!,
      s: json.asBytes("s", throwOnNull: true)!,
    );
  }
  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  @override
  Map<String, dynamic> toJson() {
    return {
      "chain_id": chainId,
      "nonce": nonce.toString(),
      "gas_tip_cap": gasTipCap,
      "gas_fee_cap": gasFeeCap,
      "gas": gas.toString(),
      "to": to,
      "value": value.toString(),
      "data": CosmosUtils.tryToBase64(data),
      "accesses": accesses?.map((e) => e.toJson()).toList(),
      "v": CosmosUtils.toBase64(v),
      "r": CosmosUtils.toBase64(r),
      "s": CosmosUtils.toBase64(s),
    };
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.dynamicFeeTx;

  @override
  List get values => [
    chainId,
    nonce,
    gasTipCap,
    gasFeeCap,
    gas,
    to,
    value,
    data,
    accesses?.emptyAsNull,
    v,
    r,
    s,
  ];
}
