import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// Period defines a length of time and amount of coins that will vest.
class Period extends CosmosProtoMessage {
  final BigInt? startTime;

  final BigInt? length;

  final List<cosmos_base_v1beta1_coin.Coin> amount;

  final int? actionType;

  const Period({
    this.startTime,
    this.length,
    this.amount = const [],
    this.actionType,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.int32(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [startTime, length, amount, actionType];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'start_time': config.encodeBigint(startTime),
      'length': config.encodeBigint(length),
      'amount': amount.map((e) => config.encodeMessage(e)).toList(),
      'action_type': actionType,
    };
  }

  factory Period.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Period(
      startTime: json.valueAsBigInt<BigInt?>(
        'start_time',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      length: json.valueAsBigInt<BigInt?>(
        'length',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      amount:
          (json.valueEnsureAsList<dynamic>(
                'amount',
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
      actionType: json.valueAsInt<int?>(
        'action_type',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Period.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Period(
      startTime: decode.getBigInt<BigInt?>(1),
      length: decode.getBigInt<BigInt?>(2),
      amount:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      actionType: decode.getInt<int?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideVestingPeriod;
}
