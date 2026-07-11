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
  Map<String, dynamic> toJson() {
    return {'address': address, 'height': height};
  }

  factory QueryRuneProviderRequest.fromJson(Map<String, dynamic> json) {
    return QueryRuneProviderRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'rune_address': runeAddress,
      'units': units,
      'value': value,
      'pnl': pnl,
      'deposit_amount': depositAmount,
      'withdraw_amount': withdrawAmount,
      'last_deposit_height': lastDepositHeight?.toString(),
      'last_withdraw_height': lastWithdrawHeight?.toString(),
    };
  }

  factory QueryRuneProviderResponse.fromJson(Map<String, dynamic> json) {
    return QueryRuneProviderResponse(
      runeAddress: json.valueAsString<String?>(
        'rune_address',
        acceptCamelCase: true,
      ),
      units: json.valueAsString<String?>('units', acceptCamelCase: true),
      value: json.valueAsString<String?>('value', acceptCamelCase: true),
      pnl: json.valueAsString<String?>('pnl', acceptCamelCase: true),
      depositAmount: json.valueAsString<String?>(
        'deposit_amount',
        acceptCamelCase: true,
      ),
      withdrawAmount: json.valueAsString<String?>(
        'withdraw_amount',
        acceptCamelCase: true,
      ),
      lastDepositHeight: json.valueAsBigInt<BigInt?>(
        'last_deposit_height',
        acceptCamelCase: true,
      ),
      lastWithdrawHeight: json.valueAsBigInt<BigInt?>(
        'last_withdraw_height',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'height': height};
  }

  factory QueryRuneProvidersRequest.fromJson(Map<String, dynamic> json) {
    return QueryRuneProvidersRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'providers': providers.map((e) => e.toJson()).toList()};
  }

  factory QueryRuneProvidersResponse.fromJson(Map<String, dynamic> json) {
    return QueryRuneProvidersResponse(
      providers:
          (json.valueEnsureAsList<dynamic>('providers', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  QueryRuneProviderResponse,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => QueryRuneProviderResponse.fromJson(v),
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
