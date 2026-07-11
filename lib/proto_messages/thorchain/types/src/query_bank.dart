import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryBalancesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBalancesResponse> {
  final String? address;

  final String? height;

  const QueryBalancesRequest({this.address, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/bank/balances/{address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [address, height];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address, 'height': height};
  }

  factory QueryBalancesRequest.fromJson(Map<String, dynamic> json) {
    return QueryBalancesRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryBalancesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBalancesRequest(
      address: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryBalancesRequest;
  @override
  QueryBalancesResponse onQueryResponse(List<int> bytes) {
    return QueryBalancesResponse.deserialize(bytes);
  }

  @override
  QueryBalancesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryBalancesResponse.fromJson(json);
  }
}

class QueryBalancesResponse extends CosmosProtoMessage {
  final List<Amount> balances;

  const QueryBalancesResponse({this.balances = const []});

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
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [balances];

  @override
  Map<String, dynamic> toJson() {
    return {'balances': balances.map((e) => e.toJson()).toList()};
  }

  factory QueryBalancesResponse.fromJson(Map<String, dynamic> json) {
    return QueryBalancesResponse(
      balances:
          (json.valueEnsureAsList<dynamic>('balances', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<Amount, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Amount.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryBalancesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBalancesResponse(
      balances:
          decode.getListOfBytes(1).map((b) => Amount.deserialize(b)).toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryBalancesResponse;
}

class Amount extends CosmosProtoMessage {
  final String? denom;

  final String? amount;

  const Amount({this.denom, this.amount});

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
  List<Object?> get protoValues => [denom, amount];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom, 'amount': amount};
  }

  factory Amount.fromJson(Map<String, dynamic> json) {
    return Amount(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
    );
  }

  factory Amount.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Amount(
      denom: decode.getString<String?>(1),
      amount: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesAmount;
}
