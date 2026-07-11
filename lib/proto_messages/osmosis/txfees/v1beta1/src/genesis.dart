import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

class TxFeesTracker extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> txFees;

  final BigInt? heightAccountingStartsFrom;

  const TxFeesTracker({
    this.txFees = const [],
    this.heightAccountingStartsFrom,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.int64(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [txFees, heightAccountingStartsFrom];

  @override
  Map<String, dynamic> toJson() {
    return {
      'tx_fees': txFees.map((e) => e.toJson()).toList(),
      'height_accounting_starts_from': heightAccountingStartsFrom?.toString(),
    };
  }

  factory TxFeesTracker.fromJson(Map<String, dynamic> json) {
    return TxFeesTracker(
      txFees:
          (json.valueEnsureAsList<dynamic>('tx_fees', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
      heightAccountingStartsFrom: json.valueAsBigInt<BigInt?>(
        'height_accounting_starts_from',
        acceptCamelCase: true,
      ),
    );
  }

  factory TxFeesTracker.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TxFeesTracker(
      txFees:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      heightAccountingStartsFrom: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTxfeesV1beta1TxFeesTracker;
}
