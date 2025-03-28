import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// LegacyTx is the transaction data of regular Ethereum transactions.
/// NOTE: All non-protected transactions (i.e non EIP155 signed) will
/// fail if the AllowUnprotectedTxs parameter is disabled.
class EvmosEthermintEVMV1LegacyTx extends CosmosMessage {
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

  /// v defines the signature value
  final List<int> v;

  /// r defines the signature value
  final List<int> r;

  /// s define the signature value
  final List<int> s;
  EvmosEthermintEVMV1LegacyTx(
      {required this.nonce,
      required this.gasPrice,
      required this.gas,
      required this.to,
      required this.value,
      required List<int>? data,
      required List<int> v,
      required List<int> r,
      required List<int> s})
      : data = data?.asImmutableBytes,
        v = v.asImmutableBytes,
        r = r.asImmutableBytes,
        s = s.asImmutableBytes;
  factory EvmosEthermintEVMV1LegacyTx.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1LegacyTx(
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
  factory EvmosEthermintEVMV1LegacyTx.fromJson(Map<String, dynamic> json) {
    return EvmosEthermintEVMV1LegacyTx(
        nonce: json.asBigInt("nonce"),
        gasPrice: json.as("gas_price"),
        gas: json.asBigInt("gas"),
        to: json.as("to"),
        value: json.as("value"),
        data: json.asBytes("data"),
        v: json.asBytes("v", throwOnNull: true)!,
        r: json.asBytes("r", throwOnNull: true)!,
        s: json.asBytes("s", throwOnNull: true)!);
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Map<String, dynamic> toJson() {
    return {
      "nonce": nonce.toString(),
      "gas_price": gasPrice,
      "gas": gas.toString(),
      "to": to,
      "value": value,
      "data": CosmosUtils.tryToBase64(data),
      "v": CosmosUtils.toBase64(v),
      "r": CosmosUtils.toBase64(r),
      "s": CosmosUtils.toBase64(s),
    };
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.legacyTx;

  @override
  List get values => [nonce, gasPrice, gas, to, value, data, v, r, s];
}
