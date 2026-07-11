import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/common/src/common.dart"
    as common_common;

class QueryVaultRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryVaultResponse> {
  final String? pubKey;

  final String? height;

  const QueryVaultRequest({this.pubKey, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/vault/{pub_key}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [pubKey, height];

  @override
  Map<String, dynamic> toJson() {
    return {'pub_key': pubKey, 'height': height};
  }

  factory QueryVaultRequest.fromJson(Map<String, dynamic> json) {
    return QueryVaultRequest(
      pubKey: json.valueAsString<String?>('pub_key', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryVaultRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVaultRequest(
      pubKey: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryVaultRequest;
  @override
  QueryVaultResponse onQueryResponse(List<int> bytes) {
    return QueryVaultResponse.deserialize(bytes);
  }

  @override
  QueryVaultResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryVaultResponse.fromJson(json);
  }
}

class QueryVaultResponse extends CosmosProtoMessage {
  final BigInt? blockHeight;

  final String? pubKey;

  final List<common_common.Coin> coins;

  final String? type;

  final String? status;

  final BigInt? statusSince;

  /// the list of node public keys which are members of the vault
  final List<String> membership;

  final List<String> chains;

  final BigInt? inboundTxCount;

  final BigInt? outboundTxCount;

  final List<BigInt> pendingTxBlockHeights;

  final List<VaultRouter> routers;

  final List<VaultAddress> addresses;

  final List<String> frozen;

  final String? pubKeyEddsa;

  final BigInt? vaultCreationHeightXmr;

  final String? pubKeyFrost;

  const QueryVaultResponse({
    this.blockHeight,
    this.pubKey,
    this.coins = const [],
    this.type,
    this.status,
    this.statusSince,
    this.membership = const [],
    this.chains = const [],
    this.inboundTxCount,
    this.outboundTxCount,
    this.pendingTxBlockHeights = const [],
    this.routers = const [],
    this.addresses = const [],
    this.frozen = const [],
    this.pubKeyEddsa,
    this.vaultCreationHeightXmr,
    this.pubKeyFrost,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.int64(6),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 8,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.int64(9),
        ProtoFieldConfig.int64(10),
        ProtoFieldConfig.repeated(
          fieldNumber: 11,
          elementType: ProtoFieldType.int64,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 12,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 13,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 14,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.string(15, options: const []),
        ProtoFieldConfig.int64(16),
        ProtoFieldConfig.string(18, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    blockHeight,
    pubKey,
    coins,
    type,
    status,
    statusSince,
    membership,
    chains,
    inboundTxCount,
    outboundTxCount,
    pendingTxBlockHeights,
    routers,
    addresses,
    frozen,
    pubKeyEddsa,
    vaultCreationHeightXmr,
    pubKeyFrost,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'block_height': blockHeight?.toString(),
      'pub_key': pubKey,
      'coins': coins.map((e) => e.toJson()).toList(),
      'type': type,
      'status': status,
      'status_since': statusSince?.toString(),
      'membership': membership.map((e) => e).toList(),
      'chains': chains.map((e) => e).toList(),
      'inbound_tx_count': inboundTxCount?.toString(),
      'outbound_tx_count': outboundTxCount?.toString(),
      'pending_tx_block_heights':
          pendingTxBlockHeights.map((e) => e.toString()).toList(),
      'routers': routers.map((e) => e.toJson()).toList(),
      'addresses': addresses.map((e) => e.toJson()).toList(),
      'frozen': frozen.map((e) => e).toList(),
      'pub_key_eddsa': pubKeyEddsa,
      'vault_creation_height_xmr': vaultCreationHeightXmr?.toString(),
      'pub_key_frost': pubKeyFrost,
    };
  }

  factory QueryVaultResponse.fromJson(Map<String, dynamic> json) {
    return QueryVaultResponse(
      blockHeight: json.valueAsBigInt<BigInt?>(
        'block_height',
        acceptCamelCase: true,
      ),
      pubKey: json.valueAsString<String?>('pub_key', acceptCamelCase: true),
      coins:
          (json.valueEnsureAsList<dynamic>('coins', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  common_common.Coin,
                  Map<String, dynamic>
                >(value: e, parse: (v) => common_common.Coin.fromJson(v)),
              )
              .toList(),
      type: json.valueAsString<String?>('type', acceptCamelCase: true),
      status: json.valueAsString<String?>('status', acceptCamelCase: true),
      statusSince: json.valueAsBigInt<BigInt?>(
        'status_since',
        acceptCamelCase: true,
      ),
      membership:
          (json.valueEnsureAsList<dynamic>(
            'membership',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      chains:
          (json.valueEnsureAsList<dynamic>(
            'chains',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      inboundTxCount: json.valueAsBigInt<BigInt?>(
        'inbound_tx_count',
        acceptCamelCase: true,
      ),
      outboundTxCount: json.valueAsBigInt<BigInt?>(
        'outbound_tx_count',
        acceptCamelCase: true,
      ),
      pendingTxBlockHeights:
          (json.valueEnsureAsList<dynamic>(
            'pending_tx_block_heights',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
      routers:
          (json.valueEnsureAsList<dynamic>('routers', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<VaultRouter, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => VaultRouter.fromJson(v),
                ),
              )
              .toList(),
      addresses:
          (json.valueEnsureAsList<dynamic>('addresses', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<VaultAddress, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => VaultAddress.fromJson(v),
                ),
              )
              .toList(),
      frozen:
          (json.valueEnsureAsList<dynamic>(
            'frozen',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      pubKeyEddsa: json.valueAsString<String?>(
        'pub_key_eddsa',
        acceptCamelCase: true,
      ),
      vaultCreationHeightXmr: json.valueAsBigInt<BigInt?>(
        'vault_creation_height_xmr',
        acceptCamelCase: true,
      ),
      pubKeyFrost: json.valueAsString<String?>(
        'pub_key_frost',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryVaultResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVaultResponse(
      blockHeight: decode.getBigInt<BigInt?>(1),
      pubKey: decode.getString<String?>(2),
      coins:
          decode
              .getListOfBytes(3)
              .map((b) => common_common.Coin.deserialize(b))
              .toList(),
      type: decode.getString<String?>(4),
      status: decode.getString<String?>(5),
      statusSince: decode.getBigInt<BigInt?>(6),
      membership: decode.getListOrEmpty<String>(7),
      chains: decode.getListOrEmpty<String>(8),
      inboundTxCount: decode.getBigInt<BigInt?>(9),
      outboundTxCount: decode.getBigInt<BigInt?>(10),
      pendingTxBlockHeights: decode.getListOrEmpty<BigInt>(11),
      routers:
          decode
              .getListOfBytes(12)
              .map((b) => VaultRouter.deserialize(b))
              .toList(),
      addresses:
          decode
              .getListOfBytes(13)
              .map((b) => VaultAddress.deserialize(b))
              .toList(),
      frozen: decode.getListOrEmpty<String>(14),
      pubKeyEddsa: decode.getString<String?>(15),
      vaultCreationHeightXmr: decode.getBigInt<BigInt?>(16),
      pubKeyFrost: decode.getString<String?>(18),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryVaultResponse;
}

class QueryKeysignPartyRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryKeysignPartyResponse> {
  final String? pubKey;

  final String? signingHeight;

  const QueryKeysignPartyRequest({this.pubKey, this.signingHeight});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/vault/{pub_key}/keysign_party",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [pubKey, signingHeight];

  @override
  Map<String, dynamic> toJson() {
    return {'pub_key': pubKey, 'signing_height': signingHeight};
  }

  factory QueryKeysignPartyRequest.fromJson(Map<String, dynamic> json) {
    return QueryKeysignPartyRequest(
      pubKey: json.valueAsString<String?>('pub_key', acceptCamelCase: true),
      signingHeight: json.valueAsString<String?>(
        'signing_height',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryKeysignPartyRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryKeysignPartyRequest(
      pubKey: decode.getString<String?>(1),
      signingHeight: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryKeysignPartyRequest;
  @override
  QueryKeysignPartyResponse onQueryResponse(List<int> bytes) {
    return QueryKeysignPartyResponse.deserialize(bytes);
  }

  @override
  QueryKeysignPartyResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryKeysignPartyResponse.fromJson(json);
  }
}

class QueryKeysignPartyResponse extends CosmosProtoMessage {
  final String? pubKey;

  final List<String> signers;

  final BigInt? height;

  final BigInt? threshold;

  final BigInt? requiredSigners;

  final List<String> neverSigners;

  final List<String> jailedFallbackSigners;

  final BigInt? activeSignerCount;

  const QueryKeysignPartyResponse({
    this.pubKey,
    this.signers = const [],
    this.height,
    this.threshold,
    this.requiredSigners,
    this.neverSigners = const [],
    this.jailedFallbackSigners = const [],
    this.activeSignerCount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.int64(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    pubKey,
    signers,
    height,
    threshold,
    requiredSigners,
    neverSigners,
    jailedFallbackSigners,
    activeSignerCount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'pub_key': pubKey,
      'signers': signers.map((e) => e).toList(),
      'height': height?.toString(),
      'threshold': threshold?.toString(),
      'required_signers': requiredSigners?.toString(),
      'never_signers': neverSigners.map((e) => e).toList(),
      'jailed_fallback_signers': jailedFallbackSigners.map((e) => e).toList(),
      'active_signer_count': activeSignerCount?.toString(),
    };
  }

  factory QueryKeysignPartyResponse.fromJson(Map<String, dynamic> json) {
    return QueryKeysignPartyResponse(
      pubKey: json.valueAsString<String?>('pub_key', acceptCamelCase: true),
      signers:
          (json.valueEnsureAsList<dynamic>(
            'signers',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      threshold: json.valueAsBigInt<BigInt?>(
        'threshold',
        acceptCamelCase: true,
      ),
      requiredSigners: json.valueAsBigInt<BigInt?>(
        'required_signers',
        acceptCamelCase: true,
      ),
      neverSigners:
          (json.valueEnsureAsList<dynamic>(
            'never_signers',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      jailedFallbackSigners:
          (json.valueEnsureAsList<dynamic>(
            'jailed_fallback_signers',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      activeSignerCount: json.valueAsBigInt<BigInt?>(
        'active_signer_count',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryKeysignPartyResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryKeysignPartyResponse(
      pubKey: decode.getString<String?>(1),
      signers: decode.getListOrEmpty<String>(2),
      height: decode.getBigInt<BigInt?>(3),
      threshold: decode.getBigInt<BigInt?>(4),
      requiredSigners: decode.getBigInt<BigInt?>(5),
      neverSigners: decode.getListOrEmpty<String>(6),
      jailedFallbackSigners: decode.getListOrEmpty<String>(7),
      activeSignerCount: decode.getBigInt<BigInt?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryKeysignPartyResponse;
}

class QueryAsgardVaultsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAsgardVaultsResponse> {
  final String? height;

  const QueryAsgardVaultsRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/vaults/asgard",
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

  factory QueryAsgardVaultsRequest.fromJson(Map<String, dynamic> json) {
    return QueryAsgardVaultsRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryAsgardVaultsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAsgardVaultsRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryAsgardVaultsRequest;
  @override
  QueryAsgardVaultsResponse onQueryResponse(List<int> bytes) {
    return QueryAsgardVaultsResponse.deserialize(bytes);
  }

  @override
  QueryAsgardVaultsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAsgardVaultsResponse.fromJson(json);
  }
}

class QueryAsgardVaultsResponse extends CosmosProtoMessage {
  final List<QueryVaultResponse> asgardVaults;

  const QueryAsgardVaultsResponse({this.asgardVaults = const []});

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
  List<Object?> get protoValues => [asgardVaults];

  @override
  Map<String, dynamic> toJson() {
    return {'asgard_vaults': asgardVaults.map((e) => e.toJson()).toList()};
  }

  factory QueryAsgardVaultsResponse.fromJson(Map<String, dynamic> json) {
    return QueryAsgardVaultsResponse(
      asgardVaults:
          (json.valueEnsureAsList<dynamic>(
                'asgard_vaults',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  QueryVaultResponse,
                  Map<String, dynamic>
                >(value: e, parse: (v) => QueryVaultResponse.fromJson(v)),
              )
              .toList(),
    );
  }

  factory QueryAsgardVaultsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAsgardVaultsResponse(
      asgardVaults:
          decode
              .getListOfBytes(1)
              .map((b) => QueryVaultResponse.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryAsgardVaultsResponse;
}

class QueryVaultsPubkeysRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryVaultsPubkeysResponse> {
  final String? height;

  const QueryVaultsPubkeysRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/vaults/pubkeys",
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

  factory QueryVaultsPubkeysRequest.fromJson(Map<String, dynamic> json) {
    return QueryVaultsPubkeysRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryVaultsPubkeysRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVaultsPubkeysRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryVaultsPubkeysRequest;
  @override
  QueryVaultsPubkeysResponse onQueryResponse(List<int> bytes) {
    return QueryVaultsPubkeysResponse.deserialize(bytes);
  }

  @override
  QueryVaultsPubkeysResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryVaultsPubkeysResponse.fromJson(json);
  }
}

class QueryVaultsPubkeysResponse extends CosmosProtoMessage {
  final List<VaultInfo> asgard;

  final List<VaultInfo> inactive;

  const QueryVaultsPubkeysResponse({
    this.asgard = const [],
    this.inactive = const [],
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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [asgard, inactive];

  @override
  Map<String, dynamic> toJson() {
    return {
      'asgard': asgard.map((e) => e.toJson()).toList(),
      'inactive': inactive.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryVaultsPubkeysResponse.fromJson(Map<String, dynamic> json) {
    return QueryVaultsPubkeysResponse(
      asgard:
          (json.valueEnsureAsList<dynamic>('asgard', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<VaultInfo, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => VaultInfo.fromJson(v),
                ),
              )
              .toList(),
      inactive:
          (json.valueEnsureAsList<dynamic>('inactive', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<VaultInfo, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => VaultInfo.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryVaultsPubkeysResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVaultsPubkeysResponse(
      asgard:
          decode
              .getListOfBytes(1)
              .map((b) => VaultInfo.deserialize(b))
              .toList(),
      inactive:
          decode
              .getListOfBytes(2)
              .map((b) => VaultInfo.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryVaultsPubkeysResponse;
}

class VaultInfo extends CosmosProtoMessage {
  final String? pubKey;

  final List<VaultRouter> routers;

  final String? pubKeyEddsa;

  final List<String> membership;

  final String? pubKeyFrost;

  const VaultInfo({
    this.pubKey,
    this.routers = const [],
    this.pubKeyEddsa,
    this.membership = const [],
    this.pubKeyFrost,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    pubKey,
    routers,
    pubKeyEddsa,
    membership,
    pubKeyFrost,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'pub_key': pubKey,
      'routers': routers.map((e) => e.toJson()).toList(),
      'pub_key_eddsa': pubKeyEddsa,
      'membership': membership.map((e) => e).toList(),
      'pub_key_frost': pubKeyFrost,
    };
  }

  factory VaultInfo.fromJson(Map<String, dynamic> json) {
    return VaultInfo(
      pubKey: json.valueAsString<String?>('pub_key', acceptCamelCase: true),
      routers:
          (json.valueEnsureAsList<dynamic>('routers', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<VaultRouter, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => VaultRouter.fromJson(v),
                ),
              )
              .toList(),
      pubKeyEddsa: json.valueAsString<String?>(
        'pub_key_eddsa',
        acceptCamelCase: true,
      ),
      membership:
          (json.valueEnsureAsList<dynamic>(
            'membership',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      pubKeyFrost: json.valueAsString<String?>(
        'pub_key_frost',
        acceptCamelCase: true,
      ),
    );
  }

  factory VaultInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return VaultInfo(
      pubKey: decode.getString<String?>(1),
      routers:
          decode
              .getListOfBytes(2)
              .map((b) => VaultRouter.deserialize(b))
              .toList(),
      pubKeyEddsa: decode.getString<String?>(3),
      membership: decode.getListOrEmpty<String>(4),
      pubKeyFrost: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesVaultInfo;
}

class QueryXMRSpentOutputRefsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryXMRSpentOutputRefsResponse> {
  final String? vaultPubKey;

  final String? height;

  const QueryXMRSpentOutputRefsRequest({this.vaultPubKey, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/xmr/spent_refs/{vault_pub_key}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [vaultPubKey, height];

  @override
  Map<String, dynamic> toJson() {
    return {'vault_pub_key': vaultPubKey, 'height': height};
  }

  factory QueryXMRSpentOutputRefsRequest.fromJson(Map<String, dynamic> json) {
    return QueryXMRSpentOutputRefsRequest(
      vaultPubKey: json.valueAsString<String?>(
        'vault_pub_key',
        acceptCamelCase: true,
      ),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryXMRSpentOutputRefsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryXMRSpentOutputRefsRequest(
      vaultPubKey: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryXMRSpentOutputRefsRequest;
  @override
  QueryXMRSpentOutputRefsResponse onQueryResponse(List<int> bytes) {
    return QueryXMRSpentOutputRefsResponse.deserialize(bytes);
  }

  @override
  QueryXMRSpentOutputRefsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryXMRSpentOutputRefsResponse.fromJson(json);
  }
}

class QueryXMRSpentOutputRefsResponse extends CosmosProtoMessage {
  final List<common_common.OutputRef> spentOutputRefs;

  const QueryXMRSpentOutputRefsResponse({this.spentOutputRefs = const []});

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
  List<Object?> get protoValues => [spentOutputRefs];

  @override
  Map<String, dynamic> toJson() {
    return {
      'spent_output_refs': spentOutputRefs.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryXMRSpentOutputRefsResponse.fromJson(Map<String, dynamic> json) {
    return QueryXMRSpentOutputRefsResponse(
      spentOutputRefs:
          (json.valueEnsureAsList<dynamic>(
                'spent_output_refs',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  common_common.OutputRef,
                  Map<String, dynamic>
                >(value: e, parse: (v) => common_common.OutputRef.fromJson(v)),
              )
              .toList(),
    );
  }

  factory QueryXMRSpentOutputRefsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryXMRSpentOutputRefsResponse(
      spentOutputRefs:
          decode
              .getListOfBytes(1)
              .map((b) => common_common.OutputRef.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryXMRSpentOutputRefsResponse;
}

class VaultRouter extends CosmosProtoMessage {
  final String? chain;

  final String? router;

  const VaultRouter({this.chain, this.router});

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
  List<Object?> get protoValues => [chain, router];

  @override
  Map<String, dynamic> toJson() {
    return {'chain': chain, 'router': router};
  }

  factory VaultRouter.fromJson(Map<String, dynamic> json) {
    return VaultRouter(
      chain: json.valueAsString<String?>('chain', acceptCamelCase: true),
      router: json.valueAsString<String?>('router', acceptCamelCase: true),
    );
  }

  factory VaultRouter.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return VaultRouter(
      chain: decode.getString<String?>(1),
      router: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesVaultRouter;
}

class VaultAddress extends CosmosProtoMessage {
  final String? chain;

  final String? address;

  const VaultAddress({this.chain, this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [chain, address];

  @override
  Map<String, dynamic> toJson() {
    return {'chain': chain, 'address': address};
  }

  factory VaultAddress.fromJson(Map<String, dynamic> json) {
    return VaultAddress(
      chain: json.valueAsString<String?>('chain', acceptCamelCase: true),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory VaultAddress.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return VaultAddress(
      chain: decode.getString<String?>(1),
      address: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesVaultAddress;
}

class QueryVaultSolvencyRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryVaultSolvencyResponse> {
  final String? height;

  const QueryVaultSolvencyRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/vaults/solvency",
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

  factory QueryVaultSolvencyRequest.fromJson(Map<String, dynamic> json) {
    return QueryVaultSolvencyRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryVaultSolvencyRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVaultSolvencyRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryVaultSolvencyRequest;
  @override
  QueryVaultSolvencyResponse onQueryResponse(List<int> bytes) {
    return QueryVaultSolvencyResponse.deserialize(bytes);
  }

  @override
  QueryVaultSolvencyResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryVaultSolvencyResponse.fromJson(json);
  }
}

class VaultSolvencyAsset extends CosmosProtoMessage {
  final common_common.Asset? asset;

  final String? amount;

  const VaultSolvencyAsset({this.asset, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [asset, amount];

  @override
  Map<String, dynamic> toJson() {
    return {'asset': asset?.toJson(), 'amount': amount};
  }

  factory VaultSolvencyAsset.fromJson(Map<String, dynamic> json) {
    return VaultSolvencyAsset(
      asset: json.valueTo<common_common.Asset?, Map<String, dynamic>>(
        key: 'asset',
        parse: (v) => common_common.Asset.fromJson(v),
        acceptCamelCase: true,
      ),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
    );
  }

  factory VaultSolvencyAsset.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return VaultSolvencyAsset(
      asset: decode.messageTo<common_common.Asset?>(
        1,
        (b) => common_common.Asset.deserialize(b),
      ),
      amount: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesVaultSolvencyAsset;
}

class QueryVaultSolvencyResponse extends CosmosProtoMessage {
  final List<VaultSolvencyAsset> assets;

  const QueryVaultSolvencyResponse({this.assets = const []});

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

  factory QueryVaultSolvencyResponse.fromJson(Map<String, dynamic> json) {
    return QueryVaultSolvencyResponse(
      assets:
          (json.valueEnsureAsList<dynamic>('assets', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  VaultSolvencyAsset,
                  Map<String, dynamic>
                >(value: e, parse: (v) => VaultSolvencyAsset.fromJson(v)),
              )
              .toList(),
    );
  }

  factory QueryVaultSolvencyResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVaultSolvencyResponse(
      assets:
          decode
              .getListOfBytes(1)
              .map((b) => VaultSolvencyAsset.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryVaultSolvencyResponse;
}
