import 'package:blockchain_utils/helper/helper.dart';
import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// LegacyTx is the transaction data of regular Ethereum transactions.
/// NOTE: All non-protected transactions (i.e non EIP155 signed) will
/// fail if the AllowUnprotectedTxs parameter is disabled.
class EVMV1LegacyTx extends CosmosMessage {
  /// nonce corresponds to the account nonce (transaction sequence).
  final BigInt nonce;

  /// gas_price defines the value for each gas unit
  final BigInt gasPrice;

  /// gas defines the gas limit defined for the transaction.
  final BigInt gas;

  /// to is the recipient address in hex format
  final String to;

  /// value defines the unsigned integer value of the transaction amount.
  final BigInt value;

  /// data is the data payload bytes of the transaction.
  final List<int>? data;

  /// v defines the signature value
  final List<int> v;

  /// r defines the signature value
  final List<int> r;

  /// s define the signature value
  final List<int> s;
  EVMV1LegacyTx(
      {required this.nonce,
      required this.gasPrice,
      required this.gas,
      required this.to,
      required this.value,
      required List<int> data,
      required List<int> v,
      required List<int> r,
      required List<int> s})
      : data = data.asImmutableBytes,
        v = v.asImmutableBytes,
        r = r.asImmutableBytes,
        s = s.asImmutableBytes;
  factory EVMV1LegacyTx.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1LegacyTx(
        nonce: decode.getField(1),
        gasPrice: decode.getField(2),
        gas: decode.getField(3),
        to: decode.getField(4),
        value: decode.getField(5),
        data: decode.getField(6),
        v: decode.getField(7),
        r: decode.getField(8),
        s: decode.getField(9));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Map<String, dynamic> toJson() {
    return {
      "nonce": nonce.toString(),
      "gas_price": gasPrice.toString(),
      "gas": gas.toString(),
      "to": to,
      "value": value.toString(),
      "data": BytesUtils.tryToHexString(data),
      "v": BytesUtils.toHexString(v),
      "r": BytesUtils.toHexString(r),
      "s": BytesUtils.toHexString(s),
    };
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.legacyTx;

  @override
  List get values =>
      [nonce, gasPrice.toString(), gas, to, value.toString(), data, v, r, s];
}
