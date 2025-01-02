import 'package:blockchain_utils/helper/helper.dart';
import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'access_tuple.dart';

/// DynamicFeeTx is the data of EIP-1559 dinamic fee transactions.
class EVMV1DynamicFeeTx extends CosmosMessage {
  /// chain_id of the destination EVM chain
  final BigInt chainId;

  /// nonce corresponds to the account nonce (transaction sequence).
  final BigInt nonce;

  /// gas_tip_cap defines the max value for the gas tip
  final BigInt gasTipCap;

  /// gas_fee_cap defines the max value for the gas fee
  final BigInt gasFeeCap;

  /// gas defines the gas limit defined for the transaction.
  final BigInt gas;

  /// to is the recipient address in hex format
  final String to;

  /// value defines the unsigned integer value of the transaction amount.
  final BigInt value;

  /// data is the data payload bytes of the transaction.
  final List<int>? data;

  /// accesses is an array of access tuples
  final List<EVMV1AccessTuple>? accesses;

  /// v defines the signature value
  final List<int> v;

  /// r defines the signature value
  final List<int> r;

  /// s define the signature value
  final List<int> s;
  EVMV1DynamicFeeTx(
      {required this.chainId,
      required this.nonce,
      required this.gasTipCap,
      required this.gasFeeCap,
      required this.gas,
      required this.to,
      required this.value,
      required List<int> data,
      required List<EVMV1AccessTuple>? accesses,
      required List<int> v,
      required List<int> r,
      required List<int> s})
      : data = data.asImmutableBytes,
        v = v.asImmutableBytes,
        r = r.asImmutableBytes,
        s = s.asImmutableBytes,
        accesses = accesses?.immutable;
  factory EVMV1DynamicFeeTx.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1DynamicFeeTx(
        chainId: decode.getField(1),
        nonce: decode.getField(2),
        gasTipCap: decode.getField(3),
        gasFeeCap: decode.getField(4),
        gas: decode.getField(5),
        to: decode.getField(6),
        value: decode.getField(7),
        data: decode.getField(8),
        accesses: decode
            .getFields<List<int>>(9)
            .map((e) => EVMV1AccessTuple.deserialize(e))
            .toList(),
        v: decode.getField(10),
        r: decode.getField(11),
        s: decode.getField(12));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  @override
  Map<String, dynamic> toJson() {
    return {
      "chain_id": chainId.toString(),
      "nonce": nonce.toString(),
      "gas_tip_cap": gasTipCap.toString(),
      "gas_fee_cap": gasFeeCap.toString(),
      "gas": gas.toString(),
      "to": to,
      "value": value.toString(),
      "data": BytesUtils.tryToHexString(data),
      "accesses": accesses?.map((e) => e.toJson()).toList(),
      "v": BytesUtils.toHexString(v),
      "r": BytesUtils.toHexString(r),
      "s": BytesUtils.toHexString(s),
    };
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.dynamicFeeTx;

  @override
  List get values => [
        chainId.toString(),
        nonce,
        gasTipCap.toString(),
        gasFeeCap.toString(),
        gas,
        to,
        value.toString(),
        data,
        accesses?.emptyAsNull,
        v,
        r,
        s
      ];
}
