import 'package:blockchain_utils/utils/numbers/utils/bigint_utils.dart';
import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Fee includes the amount of coins paid in fees and the maximum gas to be used by the transaction.
/// The ratio yields an effective "gasprice", which must be above some miminum to be accepted into the mempool.
class Fee extends CosmosMessage {
  /// amount is the amount of coins to be paid as a fee
  final List<Coin> amount;

  /// gas_limit is the maximum gas that can be used in transaction processing
  /// before an out of gas error occurs
  final BigInt? gasLimit;

  /// if unset, the first signer is responsible for paying the fees. If set, the
  /// specified account must pay the fees. the payer must be a tx signer (and
  /// thus have signed this field in AuthInfo). setting this field does *not*
  /// change the ordering of required signers for the transaction.
  final CosmosBaseAddress? payer;

  /// if set, the fee payer (either the first signer or the value of the payer
  /// field) requests that a fee grant be used to pay fees instead of the fee
  /// payer's own balance. If an appropriate fee grant does not exist or the
  /// chain does not support fee grants, this will fail
  final CosmosBaseAddress? granter;
  const Fee({required this.amount, this.gasLimit, this.payer, this.granter});
  factory Fee.fromRpc(Map<String, dynamic> json) {
    return Fee(
      amount:
          (json["amount"] as List?)?.map((e) => Coin.fromRpc(e)).toList() ?? [],
      gasLimit: BigintUtils.tryParse(json["gas_limit"]),
      granter:
          json["granter"] == null ? null : CosmosBaseAddress(json["granter"]),
      payer: json["payer"] == null ? null : CosmosBaseAddress(json["payer"]),
    );
  }
  factory Fee.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Fee(
        amount: decode
            .getFields<List<int>>(1)
            .map((e) => Coin.deserialize(e))
            .toList(),
        gasLimit: decode.getResult(2)?.cast<BigInt>(),
        granter: decode
            .getResult(3)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        payer: decode
            .getResult(4)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)));
  }
  Fee copyWith({
    List<Coin>? amount,
    BigInt? gasLimit,
    CosmosBaseAddress? payer,
    CosmosBaseAddress? granter,
  }) {
    return Fee(
      amount: amount ?? this.amount,
      gasLimit: gasLimit ?? this.gasLimit,
      payer: payer ?? this.payer,
      granter: granter ?? this.granter,
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "amount": amount.map((e) => e.toJson()).toList(),
      "gas_limit": gasLimit?.toString(),
      "payer": payer?.address,
      "granter": granter?.address
    };
  }

  @override
  List get values => [amount, gasLimit, payer?.address, granter?.address];

  @override
  TypeUrl get typeUrl => TxV1beta1Types.fee;
}
