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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'tx_fees': txFees.map((e) => config.encodeMessage(e)).toList(),
      'height_accounting_starts_from': config.encodeBigint(
        heightAccountingStartsFrom,
      ),
    };
  }

  factory TxFeesTracker.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TxFeesTracker(
      txFees:
          (json.valueEnsureAsList<dynamic>(
                'tx_fees',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
      heightAccountingStartsFrom: json.valueAsBigInt<BigInt?>(
        'height_accounting_starts_from',
        normalizeKeyLookup: config.normalizeKeys,
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
