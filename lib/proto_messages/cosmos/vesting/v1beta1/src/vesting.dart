import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// Period defines a length of time and amount of coins that will vest.
class Period extends CosmosProtoMessage {
  /// Period duration in seconds.
  final BigInt? length;

  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const Period({this.length, this.amount = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [length, amount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'length': length?.toString(),
      'amount': amount.map((e) => e.toJson()).toList(),
    };
  }

  factory Period.fromJson(Map<String, dynamic> json) {
    return Period(
      length: json.valueAsBigInt<BigInt?>('length', acceptCamelCase: true),
      amount:
          (json.valueEnsureAsList<dynamic>('amount', acceptCamelCase: true))
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
    );
  }

  factory Period.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Period(
      length: decode.getBigInt<BigInt?>(1),
      amount:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosVestingV1beta1Period;
}
