import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryTradeAccountRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTradeAccountsResponse> {
  final String? address;

  final String? height;

  const QueryTradeAccountRequest({this.address, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/trade/account/{address}",
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

  factory QueryTradeAccountRequest.fromJson(Map<String, dynamic> json) {
    return QueryTradeAccountRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryTradeAccountRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTradeAccountRequest(
      address: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTradeAccountRequest;
  @override
  QueryTradeAccountsResponse onQueryResponse(List<int> bytes) {
    return QueryTradeAccountsResponse.deserialize(bytes);
  }

  @override
  QueryTradeAccountsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTradeAccountsResponse.fromJson(json);
  }
}

class QueryTradeAccountResponse extends CosmosProtoMessage {
  /// trade account asset with \"~\" separator
  final String? asset;

  /// units of trade asset belonging to this owner
  final String? units;

  /// thor address of trade account owner
  final String? owner;

  /// last thorchain height trade assets were added to trade account
  final BigInt? lastAddHeight;

  /// last thorchain height trade assets were withdrawn from trade account
  final BigInt? lastWithdrawHeight;

  const QueryTradeAccountResponse({
    this.asset,
    this.units,
    this.owner,
    this.lastAddHeight,
    this.lastWithdrawHeight,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.int64(4, options: const []),
        ProtoFieldConfig.int64(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    asset,
    units,
    owner,
    lastAddHeight,
    lastWithdrawHeight,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'asset': asset,
      'units': units,
      'owner': owner,
      'last_add_height': lastAddHeight?.toString(),
      'last_withdraw_height': lastWithdrawHeight?.toString(),
    };
  }

  factory QueryTradeAccountResponse.fromJson(Map<String, dynamic> json) {
    return QueryTradeAccountResponse(
      asset: json.valueAsString<String?>('asset', acceptCamelCase: true),
      units: json.valueAsString<String?>('units', acceptCamelCase: true),
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      lastAddHeight: json.valueAsBigInt<BigInt?>(
        'last_add_height',
        acceptCamelCase: true,
      ),
      lastWithdrawHeight: json.valueAsBigInt<BigInt?>(
        'last_withdraw_height',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryTradeAccountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTradeAccountResponse(
      asset: decode.getString<String?>(1),
      units: decode.getString<String?>(2),
      owner: decode.getString<String?>(3),
      lastAddHeight: decode.getBigInt<BigInt?>(4),
      lastWithdrawHeight: decode.getBigInt<BigInt?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTradeAccountResponse;
}

class QueryTradeAccountsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTradeAccountsResponse> {
  final String? asset;

  final String? height;

  const QueryTradeAccountsRequest({this.asset, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/trade/accounts/{asset}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [asset, height];

  @override
  Map<String, dynamic> toJson() {
    return {'asset': asset, 'height': height};
  }

  factory QueryTradeAccountsRequest.fromJson(Map<String, dynamic> json) {
    return QueryTradeAccountsRequest(
      asset: json.valueAsString<String?>('asset', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryTradeAccountsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTradeAccountsRequest(
      asset: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTradeAccountsRequest;
  @override
  QueryTradeAccountsResponse onQueryResponse(List<int> bytes) {
    return QueryTradeAccountsResponse.deserialize(bytes);
  }

  @override
  QueryTradeAccountsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTradeAccountsResponse.fromJson(json);
  }
}

class QueryTradeAccountsResponse extends CosmosProtoMessage {
  final List<QueryTradeAccountResponse> tradeAccounts;

  const QueryTradeAccountsResponse({this.tradeAccounts = const []});

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
  List<Object?> get protoValues => [tradeAccounts];

  @override
  Map<String, dynamic> toJson() {
    return {'trade_accounts': tradeAccounts.map((e) => e.toJson()).toList()};
  }

  factory QueryTradeAccountsResponse.fromJson(Map<String, dynamic> json) {
    return QueryTradeAccountsResponse(
      tradeAccounts:
          (json.valueEnsureAsList<dynamic>(
                'trade_accounts',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  QueryTradeAccountResponse,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => QueryTradeAccountResponse.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryTradeAccountsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTradeAccountsResponse(
      tradeAccounts:
          decode
              .getListOfBytes(1)
              .map((b) => QueryTradeAccountResponse.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTradeAccountsResponse;
}
