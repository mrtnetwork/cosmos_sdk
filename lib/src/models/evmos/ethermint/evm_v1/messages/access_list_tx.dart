import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

import 'access_tuple.dart';

/// AccessListTx is the data of EIP-2930 access list transactions.
class EvmosEthermintEVMV1AccessListTx extends CosmosMessage {
  /// chain_id of the destination EVM chain
  final String chainId;

  /// nonce corresponds to the account nonce (transaction sequence).
  final BigInt nonce;

  /// gas_price defines the value for each gas unit
  final String gasPrice;

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
  EvmosEthermintEVMV1AccessListTx({
    required this.chainId,
    required this.nonce,
    required this.gasPrice,
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
  factory EvmosEthermintEVMV1AccessListTx.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1AccessListTx(
      chainId: decode.getField(1),
      nonce: decode.getField(2),
      gasPrice: decode.getField(3),
      gas: decode.getField(4),
      to: decode.getField(5),
      value: decode.getField(6),
      data: decode.getField(7),
      accesses:
          decode
              .getFields<List<int>>(8)
              .map((e) => EvmosEthermintEVMV1AccessTuple.deserialize(e))
              .toList(),
      v: decode.getField(9),
      r: decode.getField(10),
      s: decode.getField(11),
    );
  }

  factory EvmosEthermintEVMV1AccessListTx.fromJson(Map<String, dynamic> json) {
    return EvmosEthermintEVMV1AccessListTx(
      chainId: json.as("chain_id"),
      nonce: json.asBigInt("nonce"),
      gasPrice: json.as("gas_price"),
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
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

  @override
  Map<String, dynamic> toJson() {
    return {
      "chain_id": chainId.toString(),
      "nonce": nonce.toString(),
      "gas_price": gasPrice,
      "gas": gas.toString(),
      "to": to,
      "value": value,
      "data": CosmosUtils.tryToBase64(data),
      "accesses": accesses?.map((e) => e.toJson()).toList(),
      "v": CosmosUtils.toBase64(v),
      "r": CosmosUtils.toBase64(r),
      "s": CosmosUtils.toBase64(s),
    };
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.accessListTx;

  @override
  List get values => [
    chainId,
    nonce,
    gasPrice,
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
