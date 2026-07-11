import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/osmosis/superfluid/src/params.dart"
    as osmosis_superfluid_params;
import "package:cosmos_sdk/proto_messages/osmosis/superfluid/src/superfluid.dart"
    as osmosis_superfluid_superfluid;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/osmosis/lockup/src/lock.dart"
    as osmosis_lockup_lock;
import "package:cosmos_sdk/proto_messages/cosmos/staking/v1beta1/src/staking.dart"
    as cosmos_staking_v1beta1_staking;

class QueryParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryParamsResponse> {
  const QueryParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/superfluid/v1beta1/params",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryParamsRequest.fromJson(Map<String, dynamic> json) {
    return QueryParamsRequest();
  }

  factory QueryParamsRequest.deserialize(List<int> bytes) {
    return QueryParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidQueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

class QueryParamsResponse extends CosmosProtoMessage {
  /// params defines the parameters of the module.
  final osmosis_superfluid_params.Params? params;

  const QueryParamsResponse({this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [params];

  @override
  Map<String, dynamic> toJson() {
    return {'params': params?.toJson()};
  }

  factory QueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryParamsResponse(
      params: json
          .valueTo<osmosis_superfluid_params.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => osmosis_superfluid_params.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<osmosis_superfluid_params.Params?>(
        1,
        (b) => osmosis_superfluid_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidQueryParamsResponse;
}

class AssetTypeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<AssetTypeResponse> {
  final String? denom;

  const AssetTypeRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/superfluid/v1beta1/asset_type",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory AssetTypeRequest.fromJson(Map<String, dynamic> json) {
    return AssetTypeRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory AssetTypeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AssetTypeRequest(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidAssetTypeRequest;
  @override
  AssetTypeResponse onQueryResponse(List<int> bytes) {
    return AssetTypeResponse.deserialize(bytes);
  }

  @override
  AssetTypeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return AssetTypeResponse.fromJson(json);
  }
}

class AssetTypeResponse extends CosmosProtoMessage {
  final osmosis_superfluid_superfluid.SuperfluidAssetType? assetType;

  const AssetTypeResponse({this.assetType});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.enumType(1)],
    );
  }

  @override
  List<Object?> get protoValues => [assetType];

  @override
  Map<String, dynamic> toJson() {
    return {'asset_type': assetType?.protoName};
  }

  factory AssetTypeResponse.fromJson(Map<String, dynamic> json) {
    return AssetTypeResponse(
      assetType: json.valueTo<
        osmosis_superfluid_superfluid.SuperfluidAssetType?,
        Object?
      >(
        key: 'asset_type',
        parse: (v) => osmosis_superfluid_superfluid.SuperfluidAssetType.from(v),
      ),
    );
  }

  factory AssetTypeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AssetTypeResponse(
      assetType: decode
          .getEnum<osmosis_superfluid_superfluid.SuperfluidAssetType?>(
            1,
            osmosis_superfluid_superfluid.SuperfluidAssetType.values,
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidAssetTypeResponse;
}

class AllAssetsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<AllAssetsResponse> {
  const AllAssetsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/superfluid/v1beta1/all_assets",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory AllAssetsRequest.fromJson(Map<String, dynamic> json) {
    return AllAssetsRequest();
  }

  factory AllAssetsRequest.deserialize(List<int> bytes) {
    return AllAssetsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidAllAssetsRequest;
  @override
  AllAssetsResponse onQueryResponse(List<int> bytes) {
    return AllAssetsResponse.deserialize(bytes);
  }

  @override
  AllAssetsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return AllAssetsResponse.fromJson(json);
  }
}

class AllAssetsResponse extends CosmosProtoMessage {
  final List<osmosis_superfluid_superfluid.SuperfluidAsset> assets;

  const AllAssetsResponse({this.assets = const []});

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
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [assets];

  @override
  Map<String, dynamic> toJson() {
    return {'assets': assets.map((e) => e.toJson()).toList()};
  }

  factory AllAssetsResponse.fromJson(Map<String, dynamic> json) {
    return AllAssetsResponse(
      assets:
          (json.valueEnsureAsList<dynamic>('assets', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_superfluid_superfluid.SuperfluidAsset,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => osmosis_superfluid_superfluid
                          .SuperfluidAsset.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory AllAssetsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AllAssetsResponse(
      assets:
          decode
              .getListOfBytes(1)
              .map(
                (b) => osmosis_superfluid_superfluid
                    .SuperfluidAsset.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidAllAssetsResponse;
}

class AssetMultiplierRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<AssetMultiplierResponse> {
  final String? denom;

  const AssetMultiplierRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/superfluid/v1beta1/asset_multiplier",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory AssetMultiplierRequest.fromJson(Map<String, dynamic> json) {
    return AssetMultiplierRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory AssetMultiplierRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AssetMultiplierRequest(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidAssetMultiplierRequest;
  @override
  AssetMultiplierResponse onQueryResponse(List<int> bytes) {
    return AssetMultiplierResponse.deserialize(bytes);
  }

  @override
  AssetMultiplierResponse onQueryResponseJson(Map<String, dynamic> json) {
    return AssetMultiplierResponse.fromJson(json);
  }
}

class AssetMultiplierResponse extends CosmosProtoMessage {
  final osmosis_superfluid_superfluid.OsmoEquivalentMultiplierRecord?
  osmoEquivalentMultiplier;

  const AssetMultiplierResponse({this.osmoEquivalentMultiplier});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [osmoEquivalentMultiplier];

  @override
  Map<String, dynamic> toJson() {
    return {'osmo_equivalent_multiplier': osmoEquivalentMultiplier?.toJson()};
  }

  factory AssetMultiplierResponse.fromJson(Map<String, dynamic> json) {
    return AssetMultiplierResponse(
      osmoEquivalentMultiplier: json.valueTo<
        osmosis_superfluid_superfluid.OsmoEquivalentMultiplierRecord?,
        Map<String, dynamic>
      >(
        key: 'osmo_equivalent_multiplier',
        parse:
            (v) => osmosis_superfluid_superfluid
                .OsmoEquivalentMultiplierRecord.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory AssetMultiplierResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AssetMultiplierResponse(
      osmoEquivalentMultiplier: decode.messageTo<
        osmosis_superfluid_superfluid.OsmoEquivalentMultiplierRecord?
      >(
        1,
        (b) => osmosis_superfluid_superfluid
            .OsmoEquivalentMultiplierRecord.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidAssetMultiplierResponse;
}

class SuperfluidIntermediaryAccountInfo extends CosmosProtoMessage {
  final String? denom;

  final String? valAddr;

  final BigInt? gaugeId;

  final String? address;

  const SuperfluidIntermediaryAccountInfo({
    this.denom,
    this.valAddr,
    this.gaugeId,
    this.address,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [denom, valAddr, gaugeId, address];

  @override
  Map<String, dynamic> toJson() {
    return {
      'denom': denom,
      'val_addr': valAddr,
      'gauge_id': gaugeId?.toString(),
      'address': address,
    };
  }

  factory SuperfluidIntermediaryAccountInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    return SuperfluidIntermediaryAccountInfo(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      valAddr: json.valueAsString<String?>('val_addr', acceptCamelCase: true),
      gaugeId: json.valueAsBigInt<BigInt?>('gauge_id', acceptCamelCase: true),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory SuperfluidIntermediaryAccountInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SuperfluidIntermediaryAccountInfo(
      denom: decode.getString<String?>(1),
      valAddr: decode.getString<String?>(2),
      gaugeId: decode.getBigInt<BigInt?>(3),
      address: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidSuperfluidIntermediaryAccountInfo;
}

class AllIntermediaryAccountsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<AllIntermediaryAccountsResponse> {
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const AllIntermediaryAccountsRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/superfluid/v1beta1/all_intermediary_accounts",
        ),
      ],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'pagination': pagination?.toJson()};
  }

  factory AllIntermediaryAccountsRequest.fromJson(Map<String, dynamic> json) {
    return AllIntermediaryAccountsRequest(
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory AllIntermediaryAccountsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AllIntermediaryAccountsRequest(
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            1,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidAllIntermediaryAccountsRequest;
  @override
  AllIntermediaryAccountsResponse onQueryResponse(List<int> bytes) {
    return AllIntermediaryAccountsResponse.deserialize(bytes);
  }

  @override
  AllIntermediaryAccountsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return AllIntermediaryAccountsResponse.fromJson(json);
  }
}

class AllIntermediaryAccountsResponse extends CosmosProtoMessage {
  final List<SuperfluidIntermediaryAccountInfo> accounts;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const AllIntermediaryAccountsResponse({
    this.accounts = const [],
    this.pagination,
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
          options: const [],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [accounts, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'accounts': accounts.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory AllIntermediaryAccountsResponse.fromJson(Map<String, dynamic> json) {
    return AllIntermediaryAccountsResponse(
      accounts:
          (json.valueEnsureAsList<dynamic>('accounts', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  SuperfluidIntermediaryAccountInfo,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => SuperfluidIntermediaryAccountInfo.fromJson(v),
                ),
              )
              .toList(),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) =>
                cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory AllIntermediaryAccountsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AllIntermediaryAccountsResponse(
      accounts:
          decode
              .getListOfBytes(1)
              .map((b) => SuperfluidIntermediaryAccountInfo.deserialize(b))
              .toList(),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        2,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidAllIntermediaryAccountsResponse;
}

class ConnectedIntermediaryAccountRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ConnectedIntermediaryAccountResponse> {
  final BigInt? lockId;

  const ConnectedIntermediaryAccountRequest({this.lockId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/superfluid/v1beta1/connected_intermediary_account/{lock_id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [lockId];

  @override
  Map<String, dynamic> toJson() {
    return {'lock_id': lockId?.toString()};
  }

  factory ConnectedIntermediaryAccountRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return ConnectedIntermediaryAccountRequest(
      lockId: json.valueAsBigInt<BigInt?>('lock_id', acceptCamelCase: true),
    );
  }

  factory ConnectedIntermediaryAccountRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ConnectedIntermediaryAccountRequest(
      lockId: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidConnectedIntermediaryAccountRequest;
  @override
  ConnectedIntermediaryAccountResponse onQueryResponse(List<int> bytes) {
    return ConnectedIntermediaryAccountResponse.deserialize(bytes);
  }

  @override
  ConnectedIntermediaryAccountResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return ConnectedIntermediaryAccountResponse.fromJson(json);
  }
}

class ConnectedIntermediaryAccountResponse extends CosmosProtoMessage {
  final SuperfluidIntermediaryAccountInfo? account;

  const ConnectedIntermediaryAccountResponse({this.account});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [account];

  @override
  Map<String, dynamic> toJson() {
    return {'account': account?.toJson()};
  }

  factory ConnectedIntermediaryAccountResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return ConnectedIntermediaryAccountResponse(
      account: json
          .valueTo<SuperfluidIntermediaryAccountInfo?, Map<String, dynamic>>(
            key: 'account',
            parse: (v) => SuperfluidIntermediaryAccountInfo.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory ConnectedIntermediaryAccountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ConnectedIntermediaryAccountResponse(
      account: decode.messageTo<SuperfluidIntermediaryAccountInfo?>(
        1,
        (b) => SuperfluidIntermediaryAccountInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidConnectedIntermediaryAccountResponse;
}

class QueryTotalDelegationByValidatorForDenomRequest extends CosmosProtoMessage
    with
        ICosmosProtoQueryMessage<
          QueryTotalDelegationByValidatorForDenomResponse
        > {
  final String? denom;

  const QueryTotalDelegationByValidatorForDenomRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory QueryTotalDelegationByValidatorForDenomRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryTotalDelegationByValidatorForDenomRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QueryTotalDelegationByValidatorForDenomRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTotalDelegationByValidatorForDenomRequest(
      denom: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidQueryTotalDelegationByValidatorForDenomRequest;
  @override
  QueryTotalDelegationByValidatorForDenomResponse onQueryResponse(
    List<int> bytes,
  ) {
    return QueryTotalDelegationByValidatorForDenomResponse.deserialize(bytes);
  }

  @override
  QueryTotalDelegationByValidatorForDenomResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryTotalDelegationByValidatorForDenomResponse.fromJson(json);
  }
}

class QueryTotalDelegationByValidatorForDenomResponse
    extends CosmosProtoMessage {
  final List<Delegations> assets;

  const QueryTotalDelegationByValidatorForDenomResponse({
    this.assets = const [],
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
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [assets];

  @override
  Map<String, dynamic> toJson() {
    return {'assets': assets.map((e) => e.toJson()).toList()};
  }

  factory QueryTotalDelegationByValidatorForDenomResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryTotalDelegationByValidatorForDenomResponse(
      assets:
          (json.valueEnsureAsList<dynamic>('assets', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<Delegations, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Delegations.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryTotalDelegationByValidatorForDenomResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTotalDelegationByValidatorForDenomResponse(
      assets:
          decode
              .getListOfBytes(1)
              .map((b) => Delegations.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidQueryTotalDelegationByValidatorForDenomResponse;
}

class Delegations extends CosmosProtoMessage {
  final String? valAddr;

  final String? amountSfsd;

  final String? osmoEquivalent;

  const Delegations({this.valAddr, this.amountSfsd, this.osmoEquivalent});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [valAddr, amountSfsd, osmoEquivalent];

  @override
  Map<String, dynamic> toJson() {
    return {
      'val_addr': valAddr,
      'amount_sfsd': amountSfsd,
      'osmo_equivalent': osmoEquivalent,
    };
  }

  factory Delegations.fromJson(Map<String, dynamic> json) {
    return Delegations(
      valAddr: json.valueAsString<String?>('val_addr', acceptCamelCase: true),
      amountSfsd: json.valueAsString<String?>(
        'amount_sfsd',
        acceptCamelCase: true,
      ),
      osmoEquivalent: json.valueAsString<String?>(
        'osmo_equivalent',
        acceptCamelCase: true,
      ),
    );
  }

  factory Delegations.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Delegations(
      valAddr: decode.getString<String?>(1),
      amountSfsd: decode.getString<String?>(2),
      osmoEquivalent: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidDelegations;
}

class TotalSuperfluidDelegationsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<TotalSuperfluidDelegationsResponse> {
  const TotalSuperfluidDelegationsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/superfluid/v1beta1/all_superfluid_delegations",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory TotalSuperfluidDelegationsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return TotalSuperfluidDelegationsRequest();
  }

  factory TotalSuperfluidDelegationsRequest.deserialize(List<int> bytes) {
    return TotalSuperfluidDelegationsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidTotalSuperfluidDelegationsRequest;
  @override
  TotalSuperfluidDelegationsResponse onQueryResponse(List<int> bytes) {
    return TotalSuperfluidDelegationsResponse.deserialize(bytes);
  }

  @override
  TotalSuperfluidDelegationsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return TotalSuperfluidDelegationsResponse.fromJson(json);
  }
}

class TotalSuperfluidDelegationsResponse extends CosmosProtoMessage {
  final String? totalDelegations;

  const TotalSuperfluidDelegationsResponse({this.totalDelegations});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [totalDelegations];

  @override
  Map<String, dynamic> toJson() {
    return {'total_delegations': totalDelegations};
  }

  factory TotalSuperfluidDelegationsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return TotalSuperfluidDelegationsResponse(
      totalDelegations: json.valueAsString<String?>(
        'total_delegations',
        acceptCamelCase: true,
      ),
    );
  }

  factory TotalSuperfluidDelegationsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TotalSuperfluidDelegationsResponse(
      totalDelegations: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidTotalSuperfluidDelegationsResponse;
}

class SuperfluidDelegationAmountRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<SuperfluidDelegationAmountResponse> {
  final String? delegatorAddress;

  final String? validatorAddress;

  final String? denom;

  const SuperfluidDelegationAmountRequest({
    this.delegatorAddress,
    this.validatorAddress,
    this.denom,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/superfluid/v1beta1/superfluid_delegation_amount",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddress, validatorAddress, denom];

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_address': delegatorAddress,
      'validator_address': validatorAddress,
      'denom': denom,
    };
  }

  factory SuperfluidDelegationAmountRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return SuperfluidDelegationAmountRequest(
      delegatorAddress: json.valueAsString<String?>(
        'delegator_address',
        acceptCamelCase: true,
      ),
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory SuperfluidDelegationAmountRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SuperfluidDelegationAmountRequest(
      delegatorAddress: decode.getString<String?>(1),
      validatorAddress: decode.getString<String?>(2),
      denom: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidSuperfluidDelegationAmountRequest;
  @override
  SuperfluidDelegationAmountResponse onQueryResponse(List<int> bytes) {
    return SuperfluidDelegationAmountResponse.deserialize(bytes);
  }

  @override
  SuperfluidDelegationAmountResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return SuperfluidDelegationAmountResponse.fromJson(json);
  }
}

class SuperfluidDelegationAmountResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const SuperfluidDelegationAmountResponse({this.amount = const []});

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
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [amount];

  @override
  Map<String, dynamic> toJson() {
    return {'amount': amount.map((e) => e.toJson()).toList()};
  }

  factory SuperfluidDelegationAmountResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return SuperfluidDelegationAmountResponse(
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

  factory SuperfluidDelegationAmountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SuperfluidDelegationAmountResponse(
      amount:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidSuperfluidDelegationAmountResponse;
}

class SuperfluidDelegationsByDelegatorRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<SuperfluidDelegationsByDelegatorResponse> {
  final String? delegatorAddress;

  const SuperfluidDelegationsByDelegatorRequest({this.delegatorAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/superfluid/v1beta1/superfluid_delegations/{delegator_address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'delegator_address': delegatorAddress};
  }

  factory SuperfluidDelegationsByDelegatorRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return SuperfluidDelegationsByDelegatorRequest(
      delegatorAddress: json.valueAsString<String?>(
        'delegator_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory SuperfluidDelegationsByDelegatorRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SuperfluidDelegationsByDelegatorRequest(
      delegatorAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidSuperfluidDelegationsByDelegatorRequest;
  @override
  SuperfluidDelegationsByDelegatorResponse onQueryResponse(List<int> bytes) {
    return SuperfluidDelegationsByDelegatorResponse.deserialize(bytes);
  }

  @override
  SuperfluidDelegationsByDelegatorResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return SuperfluidDelegationsByDelegatorResponse.fromJson(json);
  }
}

class SuperfluidDelegationsByDelegatorResponse extends CosmosProtoMessage {
  final List<osmosis_superfluid_superfluid.SuperfluidDelegationRecord>
  superfluidDelegationRecords;

  final List<cosmos_base_v1beta1_coin.Coin> totalDelegatedCoins;

  final cosmos_base_v1beta1_coin.Coin? totalEquivalentStakedAmount;

  const SuperfluidDelegationsByDelegatorResponse({
    this.superfluidDelegationRecords = const [],
    this.totalDelegatedCoins = const [],
    this.totalEquivalentStakedAmount,
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
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    superfluidDelegationRecords,
    totalDelegatedCoins,
    totalEquivalentStakedAmount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'superfluid_delegation_records':
          superfluidDelegationRecords.map((e) => e.toJson()).toList(),
      'total_delegated_coins':
          totalDelegatedCoins.map((e) => e.toJson()).toList(),
      'total_equivalent_staked_amount': totalEquivalentStakedAmount?.toJson(),
    };
  }

  factory SuperfluidDelegationsByDelegatorResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return SuperfluidDelegationsByDelegatorResponse(
      superfluidDelegationRecords:
          (json.valueEnsureAsList<dynamic>(
                'superfluid_delegation_records',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_superfluid_superfluid.SuperfluidDelegationRecord,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => osmosis_superfluid_superfluid
                          .SuperfluidDelegationRecord.fromJson(v),
                ),
              )
              .toList(),
      totalDelegatedCoins:
          (json.valueEnsureAsList<dynamic>(
                'total_delegated_coins',
                acceptCamelCase: true,
              ))
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
      totalEquivalentStakedAmount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'total_equivalent_staked_amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory SuperfluidDelegationsByDelegatorResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SuperfluidDelegationsByDelegatorResponse(
      superfluidDelegationRecords:
          decode
              .getListOfBytes(1)
              .map(
                (b) => osmosis_superfluid_superfluid
                    .SuperfluidDelegationRecord.deserialize(b),
              )
              .toList(),
      totalDelegatedCoins:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      totalEquivalentStakedAmount: decode
          .messageTo<cosmos_base_v1beta1_coin.Coin?>(
            3,
            (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidSuperfluidDelegationsByDelegatorResponse;
}

class SuperfluidUndelegationsByDelegatorRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<SuperfluidUndelegationsByDelegatorResponse> {
  final String? delegatorAddress;

  final String? denom;

  const SuperfluidUndelegationsByDelegatorRequest({
    this.delegatorAddress,
    this.denom,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/superfluid/v1beta1/superfluid_undelegations_by_delegator/{delegator_address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddress, denom];

  @override
  Map<String, dynamic> toJson() {
    return {'delegator_address': delegatorAddress, 'denom': denom};
  }

  factory SuperfluidUndelegationsByDelegatorRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return SuperfluidUndelegationsByDelegatorRequest(
      delegatorAddress: json.valueAsString<String?>(
        'delegator_address',
        acceptCamelCase: true,
      ),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory SuperfluidUndelegationsByDelegatorRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SuperfluidUndelegationsByDelegatorRequest(
      delegatorAddress: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidSuperfluidUndelegationsByDelegatorRequest;
  @override
  SuperfluidUndelegationsByDelegatorResponse onQueryResponse(List<int> bytes) {
    return SuperfluidUndelegationsByDelegatorResponse.deserialize(bytes);
  }

  @override
  SuperfluidUndelegationsByDelegatorResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return SuperfluidUndelegationsByDelegatorResponse.fromJson(json);
  }
}

class SuperfluidUndelegationsByDelegatorResponse extends CosmosProtoMessage {
  final List<osmosis_superfluid_superfluid.SuperfluidDelegationRecord>
  superfluidDelegationRecords;

  final List<cosmos_base_v1beta1_coin.Coin> totalUndelegatedCoins;

  final List<osmosis_lockup_lock.SyntheticLock> syntheticLocks;

  const SuperfluidUndelegationsByDelegatorResponse({
    this.superfluidDelegationRecords = const [],
    this.totalUndelegatedCoins = const [],
    this.syntheticLocks = const [],
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
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    superfluidDelegationRecords,
    totalUndelegatedCoins,
    syntheticLocks,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'superfluid_delegation_records':
          superfluidDelegationRecords.map((e) => e.toJson()).toList(),
      'total_undelegated_coins':
          totalUndelegatedCoins.map((e) => e.toJson()).toList(),
      'synthetic_locks': syntheticLocks.map((e) => e.toJson()).toList(),
    };
  }

  factory SuperfluidUndelegationsByDelegatorResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return SuperfluidUndelegationsByDelegatorResponse(
      superfluidDelegationRecords:
          (json.valueEnsureAsList<dynamic>(
                'superfluid_delegation_records',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_superfluid_superfluid.SuperfluidDelegationRecord,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => osmosis_superfluid_superfluid
                          .SuperfluidDelegationRecord.fromJson(v),
                ),
              )
              .toList(),
      totalUndelegatedCoins:
          (json.valueEnsureAsList<dynamic>(
                'total_undelegated_coins',
                acceptCamelCase: true,
              ))
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
      syntheticLocks:
          (json.valueEnsureAsList<dynamic>(
                'synthetic_locks',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_lockup_lock.SyntheticLock,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => osmosis_lockup_lock.SyntheticLock.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory SuperfluidUndelegationsByDelegatorResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SuperfluidUndelegationsByDelegatorResponse(
      superfluidDelegationRecords:
          decode
              .getListOfBytes(1)
              .map(
                (b) => osmosis_superfluid_superfluid
                    .SuperfluidDelegationRecord.deserialize(b),
              )
              .toList(),
      totalUndelegatedCoins:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      syntheticLocks:
          decode
              .getListOfBytes(3)
              .map((b) => osmosis_lockup_lock.SyntheticLock.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidSuperfluidUndelegationsByDelegatorResponse;
}

class SuperfluidDelegationsByValidatorDenomRequest extends CosmosProtoMessage
    with
        ICosmosProtoQueryMessage<
          SuperfluidDelegationsByValidatorDenomResponse
        > {
  final String? validatorAddress;

  final String? denom;

  const SuperfluidDelegationsByValidatorDenomRequest({
    this.validatorAddress,
    this.denom,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/superfluid/v1beta1/superfluid_delegations_by_validator_denom",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [validatorAddress, denom];

  @override
  Map<String, dynamic> toJson() {
    return {'validator_address': validatorAddress, 'denom': denom};
  }

  factory SuperfluidDelegationsByValidatorDenomRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return SuperfluidDelegationsByValidatorDenomRequest(
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory SuperfluidDelegationsByValidatorDenomRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SuperfluidDelegationsByValidatorDenomRequest(
      validatorAddress: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidSuperfluidDelegationsByValidatorDenomRequest;
  @override
  SuperfluidDelegationsByValidatorDenomResponse onQueryResponse(
    List<int> bytes,
  ) {
    return SuperfluidDelegationsByValidatorDenomResponse.deserialize(bytes);
  }

  @override
  SuperfluidDelegationsByValidatorDenomResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return SuperfluidDelegationsByValidatorDenomResponse.fromJson(json);
  }
}

class SuperfluidDelegationsByValidatorDenomResponse extends CosmosProtoMessage {
  final List<osmosis_superfluid_superfluid.SuperfluidDelegationRecord>
  superfluidDelegationRecords;

  const SuperfluidDelegationsByValidatorDenomResponse({
    this.superfluidDelegationRecords = const [],
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
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [superfluidDelegationRecords];

  @override
  Map<String, dynamic> toJson() {
    return {
      'superfluid_delegation_records':
          superfluidDelegationRecords.map((e) => e.toJson()).toList(),
    };
  }

  factory SuperfluidDelegationsByValidatorDenomResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return SuperfluidDelegationsByValidatorDenomResponse(
      superfluidDelegationRecords:
          (json.valueEnsureAsList<dynamic>(
                'superfluid_delegation_records',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_superfluid_superfluid.SuperfluidDelegationRecord,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => osmosis_superfluid_superfluid
                          .SuperfluidDelegationRecord.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory SuperfluidDelegationsByValidatorDenomResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SuperfluidDelegationsByValidatorDenomResponse(
      superfluidDelegationRecords:
          decode
              .getListOfBytes(1)
              .map(
                (b) => osmosis_superfluid_superfluid
                    .SuperfluidDelegationRecord.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidSuperfluidDelegationsByValidatorDenomResponse;
}

class EstimateSuperfluidDelegatedAmountByValidatorDenomRequest
    extends CosmosProtoMessage
    with
        ICosmosProtoQueryMessage<
          EstimateSuperfluidDelegatedAmountByValidatorDenomResponse
        > {
  final String? validatorAddress;

  final String? denom;

  const EstimateSuperfluidDelegatedAmountByValidatorDenomRequest({
    this.validatorAddress,
    this.denom,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/superfluid/v1beta1/estimate_superfluid_delegation_amount_by_validator_denom",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [validatorAddress, denom];

  @override
  Map<String, dynamic> toJson() {
    return {'validator_address': validatorAddress, 'denom': denom};
  }

  factory EstimateSuperfluidDelegatedAmountByValidatorDenomRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return EstimateSuperfluidDelegatedAmountByValidatorDenomRequest(
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory EstimateSuperfluidDelegatedAmountByValidatorDenomRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EstimateSuperfluidDelegatedAmountByValidatorDenomRequest(
      validatorAddress: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidEstimateSuperfluidDelegatedAmountByValidatorDenomRequest;
  @override
  EstimateSuperfluidDelegatedAmountByValidatorDenomResponse onQueryResponse(
    List<int> bytes,
  ) {
    return EstimateSuperfluidDelegatedAmountByValidatorDenomResponse.deserialize(
      bytes,
    );
  }

  @override
  EstimateSuperfluidDelegatedAmountByValidatorDenomResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return EstimateSuperfluidDelegatedAmountByValidatorDenomResponse.fromJson(
      json,
    );
  }
}

class EstimateSuperfluidDelegatedAmountByValidatorDenomResponse
    extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> totalDelegatedCoins;

  const EstimateSuperfluidDelegatedAmountByValidatorDenomResponse({
    this.totalDelegatedCoins = const [],
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
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [totalDelegatedCoins];

  @override
  Map<String, dynamic> toJson() {
    return {
      'total_delegated_coins':
          totalDelegatedCoins.map((e) => e.toJson()).toList(),
    };
  }

  factory EstimateSuperfluidDelegatedAmountByValidatorDenomResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return EstimateSuperfluidDelegatedAmountByValidatorDenomResponse(
      totalDelegatedCoins:
          (json.valueEnsureAsList<dynamic>(
                'total_delegated_coins',
                acceptCamelCase: true,
              ))
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

  factory EstimateSuperfluidDelegatedAmountByValidatorDenomResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EstimateSuperfluidDelegatedAmountByValidatorDenomResponse(
      totalDelegatedCoins:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidEstimateSuperfluidDelegatedAmountByValidatorDenomResponse;
}

class QueryTotalDelegationByDelegatorRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTotalDelegationByDelegatorResponse> {
  final String? delegatorAddress;

  const QueryTotalDelegationByDelegatorRequest({this.delegatorAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/superfluid/v1beta1/total_delegation_by_delegator/{delegator_address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'delegator_address': delegatorAddress};
  }

  factory QueryTotalDelegationByDelegatorRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryTotalDelegationByDelegatorRequest(
      delegatorAddress: json.valueAsString<String?>(
        'delegator_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryTotalDelegationByDelegatorRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTotalDelegationByDelegatorRequest(
      delegatorAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidQueryTotalDelegationByDelegatorRequest;
  @override
  QueryTotalDelegationByDelegatorResponse onQueryResponse(List<int> bytes) {
    return QueryTotalDelegationByDelegatorResponse.deserialize(bytes);
  }

  @override
  QueryTotalDelegationByDelegatorResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryTotalDelegationByDelegatorResponse.fromJson(json);
  }
}

class QueryTotalDelegationByDelegatorResponse extends CosmosProtoMessage {
  final List<osmosis_superfluid_superfluid.SuperfluidDelegationRecord>
  superfluidDelegationRecords;

  final List<cosmos_staking_v1beta1_staking.DelegationResponse>
  delegationResponse;

  final List<cosmos_base_v1beta1_coin.Coin> totalDelegatedCoins;

  final cosmos_base_v1beta1_coin.Coin? totalEquivalentStakedAmount;

  const QueryTotalDelegationByDelegatorResponse({
    this.superfluidDelegationRecords = const [],
    this.delegationResponse = const [],
    this.totalDelegatedCoins = const [],
    this.totalEquivalentStakedAmount,
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
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    superfluidDelegationRecords,
    delegationResponse,
    totalDelegatedCoins,
    totalEquivalentStakedAmount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'superfluid_delegation_records':
          superfluidDelegationRecords.map((e) => e.toJson()).toList(),
      'delegation_response': delegationResponse.map((e) => e.toJson()).toList(),
      'total_delegated_coins':
          totalDelegatedCoins.map((e) => e.toJson()).toList(),
      'total_equivalent_staked_amount': totalEquivalentStakedAmount?.toJson(),
    };
  }

  factory QueryTotalDelegationByDelegatorResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryTotalDelegationByDelegatorResponse(
      superfluidDelegationRecords:
          (json.valueEnsureAsList<dynamic>(
                'superfluid_delegation_records',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_superfluid_superfluid.SuperfluidDelegationRecord,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => osmosis_superfluid_superfluid
                          .SuperfluidDelegationRecord.fromJson(v),
                ),
              )
              .toList(),
      delegationResponse:
          (json.valueEnsureAsList<dynamic>(
                'delegation_response',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_staking_v1beta1_staking.DelegationResponse,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => cosmos_staking_v1beta1_staking
                          .DelegationResponse.fromJson(v),
                ),
              )
              .toList(),
      totalDelegatedCoins:
          (json.valueEnsureAsList<dynamic>(
                'total_delegated_coins',
                acceptCamelCase: true,
              ))
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
      totalEquivalentStakedAmount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'total_equivalent_staked_amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryTotalDelegationByDelegatorResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTotalDelegationByDelegatorResponse(
      superfluidDelegationRecords:
          decode
              .getListOfBytes(1)
              .map(
                (b) => osmosis_superfluid_superfluid
                    .SuperfluidDelegationRecord.deserialize(b),
              )
              .toList(),
      delegationResponse:
          decode
              .getListOfBytes(2)
              .map(
                (b) => cosmos_staking_v1beta1_staking
                    .DelegationResponse.deserialize(b),
              )
              .toList(),
      totalDelegatedCoins:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      totalEquivalentStakedAmount: decode
          .messageTo<cosmos_base_v1beta1_coin.Coin?>(
            4,
            (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidQueryTotalDelegationByDelegatorResponse;
}

class QueryUnpoolWhitelistRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryUnpoolWhitelistResponse> {
  const QueryUnpoolWhitelistRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/superfluid/v1beta1/unpool_whitelist",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryUnpoolWhitelistRequest.fromJson(Map<String, dynamic> json) {
    return QueryUnpoolWhitelistRequest();
  }

  factory QueryUnpoolWhitelistRequest.deserialize(List<int> bytes) {
    return QueryUnpoolWhitelistRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidQueryUnpoolWhitelistRequest;
  @override
  QueryUnpoolWhitelistResponse onQueryResponse(List<int> bytes) {
    return QueryUnpoolWhitelistResponse.deserialize(bytes);
  }

  @override
  QueryUnpoolWhitelistResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryUnpoolWhitelistResponse.fromJson(json);
  }
}

class QueryUnpoolWhitelistResponse extends CosmosProtoMessage {
  final List<BigInt> poolIds;

  const QueryUnpoolWhitelistResponse({this.poolIds = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.uint64,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [poolIds];

  @override
  Map<String, dynamic> toJson() {
    return {'pool_ids': poolIds.map((e) => e.toString()).toList()};
  }

  factory QueryUnpoolWhitelistResponse.fromJson(Map<String, dynamic> json) {
    return QueryUnpoolWhitelistResponse(
      poolIds:
          (json.valueEnsureAsList<dynamic>(
            'pool_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
    );
  }

  factory QueryUnpoolWhitelistResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUnpoolWhitelistResponse(
      poolIds: decode.getListOrEmpty<BigInt>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidQueryUnpoolWhitelistResponse;
}

class UserConcentratedSuperfluidPositionsDelegatedRequest
    extends CosmosProtoMessage
    with
        ICosmosProtoQueryMessage<
          UserConcentratedSuperfluidPositionsDelegatedResponse
        > {
  final String? delegatorAddress;

  const UserConcentratedSuperfluidPositionsDelegatedRequest({
    this.delegatorAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/superfluid/v1beta1/account_delegated_cl_positions/{delegator_address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'delegator_address': delegatorAddress};
  }

  factory UserConcentratedSuperfluidPositionsDelegatedRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return UserConcentratedSuperfluidPositionsDelegatedRequest(
      delegatorAddress: json.valueAsString<String?>(
        'delegator_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory UserConcentratedSuperfluidPositionsDelegatedRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UserConcentratedSuperfluidPositionsDelegatedRequest(
      delegatorAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidUserConcentratedSuperfluidPositionsDelegatedRequest;
  @override
  UserConcentratedSuperfluidPositionsDelegatedResponse onQueryResponse(
    List<int> bytes,
  ) {
    return UserConcentratedSuperfluidPositionsDelegatedResponse.deserialize(
      bytes,
    );
  }

  @override
  UserConcentratedSuperfluidPositionsDelegatedResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return UserConcentratedSuperfluidPositionsDelegatedResponse.fromJson(json);
  }
}

class UserConcentratedSuperfluidPositionsDelegatedResponse
    extends CosmosProtoMessage {
  final List<osmosis_superfluid_superfluid.ConcentratedPoolUserPositionRecord>
  clPoolUserPositionRecords;

  const UserConcentratedSuperfluidPositionsDelegatedResponse({
    this.clPoolUserPositionRecords = const [],
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
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [clPoolUserPositionRecords];

  @override
  Map<String, dynamic> toJson() {
    return {
      'cl_pool_user_position_records':
          clPoolUserPositionRecords.map((e) => e.toJson()).toList(),
    };
  }

  factory UserConcentratedSuperfluidPositionsDelegatedResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return UserConcentratedSuperfluidPositionsDelegatedResponse(
      clPoolUserPositionRecords:
          (json.valueEnsureAsList<dynamic>(
                'cl_pool_user_position_records',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_superfluid_superfluid.ConcentratedPoolUserPositionRecord,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => osmosis_superfluid_superfluid
                          .ConcentratedPoolUserPositionRecord.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory UserConcentratedSuperfluidPositionsDelegatedResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UserConcentratedSuperfluidPositionsDelegatedResponse(
      clPoolUserPositionRecords:
          decode
              .getListOfBytes(1)
              .map(
                (b) => osmosis_superfluid_superfluid
                    .ConcentratedPoolUserPositionRecord.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidUserConcentratedSuperfluidPositionsDelegatedResponse;
}

class UserConcentratedSuperfluidPositionsUndelegatingRequest
    extends CosmosProtoMessage
    with
        ICosmosProtoQueryMessage<
          UserConcentratedSuperfluidPositionsUndelegatingResponse
        > {
  final String? delegatorAddress;

  const UserConcentratedSuperfluidPositionsUndelegatingRequest({
    this.delegatorAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/superfluid/v1beta1/account_undelegating_cl_positions/{delegator_address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'delegator_address': delegatorAddress};
  }

  factory UserConcentratedSuperfluidPositionsUndelegatingRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return UserConcentratedSuperfluidPositionsUndelegatingRequest(
      delegatorAddress: json.valueAsString<String?>(
        'delegator_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory UserConcentratedSuperfluidPositionsUndelegatingRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UserConcentratedSuperfluidPositionsUndelegatingRequest(
      delegatorAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidUserConcentratedSuperfluidPositionsUndelegatingRequest;
  @override
  UserConcentratedSuperfluidPositionsUndelegatingResponse onQueryResponse(
    List<int> bytes,
  ) {
    return UserConcentratedSuperfluidPositionsUndelegatingResponse.deserialize(
      bytes,
    );
  }

  @override
  UserConcentratedSuperfluidPositionsUndelegatingResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return UserConcentratedSuperfluidPositionsUndelegatingResponse.fromJson(
      json,
    );
  }
}

class UserConcentratedSuperfluidPositionsUndelegatingResponse
    extends CosmosProtoMessage {
  final List<osmosis_superfluid_superfluid.ConcentratedPoolUserPositionRecord>
  clPoolUserPositionRecords;

  const UserConcentratedSuperfluidPositionsUndelegatingResponse({
    this.clPoolUserPositionRecords = const [],
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
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [clPoolUserPositionRecords];

  @override
  Map<String, dynamic> toJson() {
    return {
      'cl_pool_user_position_records':
          clPoolUserPositionRecords.map((e) => e.toJson()).toList(),
    };
  }

  factory UserConcentratedSuperfluidPositionsUndelegatingResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return UserConcentratedSuperfluidPositionsUndelegatingResponse(
      clPoolUserPositionRecords:
          (json.valueEnsureAsList<dynamic>(
                'cl_pool_user_position_records',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_superfluid_superfluid.ConcentratedPoolUserPositionRecord,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => osmosis_superfluid_superfluid
                          .ConcentratedPoolUserPositionRecord.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory UserConcentratedSuperfluidPositionsUndelegatingResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UserConcentratedSuperfluidPositionsUndelegatingResponse(
      clPoolUserPositionRecords:
          decode
              .getListOfBytes(1)
              .map(
                (b) => osmosis_superfluid_superfluid
                    .ConcentratedPoolUserPositionRecord.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidUserConcentratedSuperfluidPositionsUndelegatingResponse;
}

/// THIS QUERY IS TEMPORARY
class QueryRestSupplyRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryRestSupplyResponse> {
  final String? denom;

  const QueryRestSupplyRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/superfluid/v1beta1/supply",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory QueryRestSupplyRequest.fromJson(Map<String, dynamic> json) {
    return QueryRestSupplyRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QueryRestSupplyRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRestSupplyRequest(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidQueryRestSupplyRequest;
  @override
  QueryRestSupplyResponse onQueryResponse(List<int> bytes) {
    return QueryRestSupplyResponse.deserialize(bytes);
  }

  @override
  QueryRestSupplyResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryRestSupplyResponse.fromJson(json);
  }
}

class QueryRestSupplyResponse extends CosmosProtoMessage {
  /// amount is the supply of the coin.
  final cosmos_base_v1beta1_coin.Coin? amount;

  const QueryRestSupplyResponse({this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [amount];

  @override
  Map<String, dynamic> toJson() {
    return {'amount': amount?.toJson()};
  }

  factory QueryRestSupplyResponse.fromJson(Map<String, dynamic> json) {
    return QueryRestSupplyResponse(
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryRestSupplyResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRestSupplyResponse(
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        1,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidQueryRestSupplyResponse;
}
