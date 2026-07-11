import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class OraclePrice extends CosmosProtoMessage {
  final String? symbol;

  final String? price;

  const OraclePrice({this.symbol, this.price});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [symbol, price];

  @override
  Map<String, dynamic> toJson() {
    return {'symbol': symbol, 'price': price};
  }

  factory OraclePrice.fromJson(Map<String, dynamic> json) {
    return OraclePrice(
      symbol: json.valueAsString<String?>('symbol', acceptCamelCase: true),
      price: json.valueAsString<String?>('price', acceptCamelCase: true),
    );
  }

  factory OraclePrice.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OraclePrice(
      symbol: decode.getString<String?>(1),
      price: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesOraclePrice;
}
