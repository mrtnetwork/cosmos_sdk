import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryRuneProviderRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryRuneProviderResponse> {
  final String? address;

  final String? height;

  const QueryRuneProviderRequest({this.address, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/rune_provider/{address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [address, height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'address': address, 'height': height};
  }

  factory QueryRuneProviderRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryRuneProviderRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      height: json.valueAsString<String?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryRuneProviderRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRuneProviderRequest(
      address: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryRuneProviderRequest;
  @override
  QueryRuneProviderResponse onQueryResponse(List<int> bytes) {
    return QueryRuneProviderResponse.deserialize(bytes);
  }

  @override
  QueryRuneProviderResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryRuneProviderResponse.fromJson(json);
  }
}

class QueryRuneProviderResponse extends CosmosProtoMessage {
  final String? runeAddress;

  final String? units;

  final String? value;

  final String? pnl;

  final String? depositAmount;

  final String? withdrawAmount;

  final BigInt? lastDepositHeight;

  final BigInt? lastWithdrawHeight;

  const QueryRuneProviderResponse({
    this.runeAddress,
    this.units,
    this.value,
    this.pnl,
    this.depositAmount,
    this.withdrawAmount,
    this.lastDepositHeight,
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
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.int64(7, options: const []),
        ProtoFieldConfig.int64(8, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    runeAddress,
    units,
    value,
    pnl,
    depositAmount,
    withdrawAmount,
    lastDepositHeight,
    lastWithdrawHeight,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'rune_address': runeAddress,
      'units': units,
      'value': value,
      'pnl': pnl,
      'deposit_amount': depositAmount,
      'withdraw_amount': withdrawAmount,
      'last_deposit_height': config.encodeBigint(lastDepositHeight),
      'last_withdraw_height': config.encodeBigint(lastWithdrawHeight),
    };
  }

  factory QueryRuneProviderResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryRuneProviderResponse(
      runeAddress: json.valueAsString<String?>(
        'rune_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      units: json.valueAsString<String?>(
        'units',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      value: json.valueAsString<String?>(
        'value',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      pnl: json.valueAsString<String?>(
        'pnl',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      depositAmount: json.valueAsString<String?>(
        'deposit_amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      withdrawAmount: json.valueAsString<String?>(
        'withdraw_amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lastDepositHeight: json.valueAsBigInt<BigInt?>(
        'last_deposit_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lastWithdrawHeight: json.valueAsBigInt<BigInt?>(
        'last_withdraw_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryRuneProviderResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRuneProviderResponse(
      runeAddress: decode.getString<String?>(1),
      units: decode.getString<String?>(2),
      value: decode.getString<String?>(3),
      pnl: decode.getString<String?>(4),
      depositAmount: decode.getString<String?>(5),
      withdrawAmount: decode.getString<String?>(6),
      lastDepositHeight: decode.getBigInt<BigInt?>(7),
      lastWithdrawHeight: decode.getBigInt<BigInt?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryRuneProviderResponse;
}

class QueryRuneProvidersRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryRuneProvidersResponse> {
  final String? height;

  const QueryRuneProvidersRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/rune_providers",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'height': height};
  }

  factory QueryRuneProvidersRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryRuneProvidersRequest(
      height: json.valueAsString<String?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryRuneProvidersRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRuneProvidersRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryRuneProvidersRequest;
  @override
  QueryRuneProvidersResponse onQueryResponse(List<int> bytes) {
    return QueryRuneProvidersResponse.deserialize(bytes);
  }

  @override
  QueryRuneProvidersResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryRuneProvidersResponse.fromJson(json);
  }
}

class QueryRuneProvidersResponse extends CosmosProtoMessage {
  final List<QueryRuneProviderResponse> providers;

  const QueryRuneProvidersResponse({this.providers = const []});

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
  List<Object?> get protoValues => [providers];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'providers': providers.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryRuneProvidersResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryRuneProvidersResponse(
      providers:
          (json.valueEnsureAsList<dynamic>(
                'providers',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<QueryRuneProviderResponse, Object>(
                  value: e,
                  parse:
                      (v) => QueryRuneProviderResponse.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryRuneProvidersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRuneProvidersResponse(
      providers:
          decode
              .getListOfBytes(1)
              .map((b) => QueryRuneProviderResponse.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryRuneProvidersResponse;
}
