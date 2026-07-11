import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// QueryBalancesRequest is the request type for the Query/Balances RPC method.
class QueryBalancesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBalancesResponse> {
  /// address of the clawback vesting account
  final String? address;

  const QueryBalancesRequest({this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/evmos/vesting/v2/balances/{address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [address];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address};
  }

  factory QueryBalancesRequest.fromJson(Map<String, dynamic> json) {
    return QueryBalancesRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory QueryBalancesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBalancesRequest(address: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosVestingV2QueryBalancesRequest;
  @override
  QueryBalancesResponse onQueryResponse(List<int> bytes) {
    return QueryBalancesResponse.deserialize(bytes);
  }

  @override
  QueryBalancesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryBalancesResponse.fromJson(json);
  }
}

/// QueryBalancesResponse is the response type for the Query/Balances RPC
/// method.
class QueryBalancesResponse extends CosmosProtoMessage {
  /// locked defines the current amount of locked tokens
  final List<cosmos_base_v1beta1_coin.Coin> locked;

  /// unvested defines the current amount of unvested tokens
  final List<cosmos_base_v1beta1_coin.Coin> unvested;

  /// vested defines the current amount of vested tokens
  final List<cosmos_base_v1beta1_coin.Coin> vested;

  const QueryBalancesResponse({
    this.locked = const [],
    this.unvested = const [],
    this.vested = const [],
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
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [locked, unvested, vested];

  @override
  Map<String, dynamic> toJson() {
    return {
      'locked': locked.map((e) => e.toJson()).toList(),
      'unvested': unvested.map((e) => e.toJson()).toList(),
      'vested': vested.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryBalancesResponse.fromJson(Map<String, dynamic> json) {
    return QueryBalancesResponse(
      locked:
          (json.valueEnsureAsList<dynamic>('locked', acceptCamelCase: true))
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
      unvested:
          (json.valueEnsureAsList<dynamic>('unvested', acceptCamelCase: true))
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
      vested:
          (json.valueEnsureAsList<dynamic>('vested', acceptCamelCase: true))
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

  factory QueryBalancesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBalancesResponse(
      locked:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      unvested:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      vested:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosVestingV2QueryBalancesResponse;
}
