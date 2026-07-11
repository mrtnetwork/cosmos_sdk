import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

class QueryBalanceModuleRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBalanceModuleResponse> {
  final String? name;

  final String? height;

  const QueryBalanceModuleRequest({this.name, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/balance/module/{name}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [name, height];

  @override
  Map<String, dynamic> toJson() {
    return {'name': name, 'height': height};
  }

  factory QueryBalanceModuleRequest.fromJson(Map<String, dynamic> json) {
    return QueryBalanceModuleRequest(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryBalanceModuleRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBalanceModuleRequest(
      name: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryBalanceModuleRequest;
  @override
  QueryBalanceModuleResponse onQueryResponse(List<int> bytes) {
    return QueryBalanceModuleResponse.deserialize(bytes);
  }

  @override
  QueryBalanceModuleResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryBalanceModuleResponse.fromJson(json);
  }
}

class QueryBalanceModuleResponse extends CosmosProtoMessage {
  final String? name;

  final List<int>? address;

  final List<cosmos_base_v1beta1_coin.Coin> coins;

  const QueryBalanceModuleResponse({
    this.name,
    this.address,
    this.coins = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.bytes(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [name, address, coins];

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': switch (address) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'coins': coins.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryBalanceModuleResponse.fromJson(Map<String, dynamic> json) {
    return QueryBalanceModuleResponse(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      address: json.valueAsBytes<List<int>?>(
        'address',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      coins:
          (json.valueEnsureAsList<dynamic>('coins', acceptCamelCase: true))
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

  factory QueryBalanceModuleResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBalanceModuleResponse(
      name: decode.getString<String?>(1),
      address: decode.getBytes<List<int>?>(2),
      coins:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryBalanceModuleResponse;
}
