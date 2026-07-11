import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Coin defines a token with a denomination and an amount.
///
/// NOTE: The amount field is an Int which implements the custom method
/// signatures required by gogoproto.
class Coin extends CosmosProtoMessage {
  final String? denom;

  final String? amount;

  const Coin({this.denom, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [denom, amount];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom, 'amount': amount};
  }

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
    );
  }

  factory Coin.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Coin(
      denom: decode.getString<String?>(1),
      amount: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseV1beta1Coin;
}

/// DecCoin defines a token with a denomination and a decimal amount.
///
/// NOTE: The amount field is a Dec which implements the custom method
/// signatures required by gogoproto.
class DecCoin extends CosmosProtoMessage {
  final String? denom;

  final String? amount;

  const DecCoin({this.denom, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [denom, amount];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom, 'amount': amount};
  }

  factory DecCoin.fromJson(Map<String, dynamic> json) {
    return DecCoin(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
    );
  }

  factory DecCoin.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DecCoin(
      denom: decode.getString<String?>(1),
      amount: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseV1beta1DecCoin;
}
