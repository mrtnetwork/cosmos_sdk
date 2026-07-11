import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/common/src/common.dart"
    as common_common;

class QueryReferenceMemoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryReferenceMemoResponse> {
  final String? height;

  final String? asset;

  final String? reference;

  const QueryReferenceMemoRequest({this.height, this.asset, this.reference});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/memo/{asset}/{reference}",
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
  List<Object?> get protoValues => [height, asset, reference];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height, 'asset': asset, 'reference': reference};
  }

  factory QueryReferenceMemoRequest.fromJson(Map<String, dynamic> json) {
    return QueryReferenceMemoRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
      asset: json.valueAsString<String?>('asset', acceptCamelCase: true),
      reference: json.valueAsString<String?>(
        'reference',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryReferenceMemoRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryReferenceMemoRequest(
      height: decode.getString<String?>(1),
      asset: decode.getString<String?>(2),
      reference: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryReferenceMemoRequest;
  @override
  QueryReferenceMemoResponse onQueryResponse(List<int> bytes) {
    return QueryReferenceMemoResponse.deserialize(bytes);
  }

  @override
  QueryReferenceMemoResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryReferenceMemoResponse.fromJson(json);
  }
}

class QueryReferenceMemoResponse extends CosmosProtoMessage {
  final common_common.Asset? asset;

  final String? memo;

  final String? reference;

  final BigInt? height;

  final String? registrationHash;

  final List<int>? registeredBy;

  final List<String> usedByTxs;

  const QueryReferenceMemoResponse({
    this.asset,
    this.memo,
    this.reference,
    this.height,
    this.registrationHash,
    this.registeredBy,
    this.usedByTxs = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.int64(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.bytes(6, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    asset,
    memo,
    reference,
    height,
    registrationHash,
    registeredBy,
    usedByTxs,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'asset': asset?.toJson(),
      'memo': memo,
      'reference': reference,
      'height': height?.toString(),
      'registration_hash': registrationHash,
      'registered_by': switch (registeredBy) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'used_by_txs': usedByTxs.map((e) => e).toList(),
    };
  }

  factory QueryReferenceMemoResponse.fromJson(Map<String, dynamic> json) {
    return QueryReferenceMemoResponse(
      asset: json.valueTo<common_common.Asset?, Map<String, dynamic>>(
        key: 'asset',
        parse: (v) => common_common.Asset.fromJson(v),
        acceptCamelCase: true,
      ),
      memo: json.valueAsString<String?>('memo', acceptCamelCase: true),
      reference: json.valueAsString<String?>(
        'reference',
        acceptCamelCase: true,
      ),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      registrationHash: json.valueAsString<String?>(
        'registration_hash',
        acceptCamelCase: true,
      ),
      registeredBy: json.valueAsBytes<List<int>?>(
        'registered_by',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      usedByTxs:
          (json.valueEnsureAsList<dynamic>(
            'used_by_txs',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QueryReferenceMemoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryReferenceMemoResponse(
      asset: decode.messageTo<common_common.Asset?>(
        1,
        (b) => common_common.Asset.deserialize(b),
      ),
      memo: decode.getString<String?>(2),
      reference: decode.getString<String?>(3),
      height: decode.getBigInt<BigInt?>(4),
      registrationHash: decode.getString<String?>(5),
      registeredBy: decode.getBytes<List<int>?>(6),
      usedByTxs: decode.getListOrEmpty<String>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryReferenceMemoResponse;
}

class QueryReferenceMemoByHashRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryReferenceMemoByHashResponse> {
  final String? height;

  final String? hash;

  const QueryReferenceMemoByHashRequest({this.height, this.hash});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/memo/{hash}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [height, hash];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height, 'hash': hash};
  }

  factory QueryReferenceMemoByHashRequest.fromJson(Map<String, dynamic> json) {
    return QueryReferenceMemoByHashRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
      hash: json.valueAsString<String?>('hash', acceptCamelCase: true),
    );
  }

  factory QueryReferenceMemoByHashRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryReferenceMemoByHashRequest(
      height: decode.getString<String?>(1),
      hash: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryReferenceMemoByHashRequest;
  @override
  QueryReferenceMemoByHashResponse onQueryResponse(List<int> bytes) {
    return QueryReferenceMemoByHashResponse.deserialize(bytes);
  }

  @override
  QueryReferenceMemoByHashResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryReferenceMemoByHashResponse.fromJson(json);
  }
}

class QueryReferenceMemoByHashResponse extends CosmosProtoMessage {
  final common_common.Asset? asset;

  final String? memo;

  final String? reference;

  final BigInt? height;

  final String? registrationHash;

  final List<int>? registeredBy;

  final List<String> usedByTxs;

  const QueryReferenceMemoByHashResponse({
    this.asset,
    this.memo,
    this.reference,
    this.height,
    this.registrationHash,
    this.registeredBy,
    this.usedByTxs = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.int64(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.bytes(6, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    asset,
    memo,
    reference,
    height,
    registrationHash,
    registeredBy,
    usedByTxs,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'asset': asset?.toJson(),
      'memo': memo,
      'reference': reference,
      'height': height?.toString(),
      'registration_hash': registrationHash,
      'registered_by': switch (registeredBy) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'used_by_txs': usedByTxs.map((e) => e).toList(),
    };
  }

  factory QueryReferenceMemoByHashResponse.fromJson(Map<String, dynamic> json) {
    return QueryReferenceMemoByHashResponse(
      asset: json.valueTo<common_common.Asset?, Map<String, dynamic>>(
        key: 'asset',
        parse: (v) => common_common.Asset.fromJson(v),
        acceptCamelCase: true,
      ),
      memo: json.valueAsString<String?>('memo', acceptCamelCase: true),
      reference: json.valueAsString<String?>(
        'reference',
        acceptCamelCase: true,
      ),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      registrationHash: json.valueAsString<String?>(
        'registration_hash',
        acceptCamelCase: true,
      ),
      registeredBy: json.valueAsBytes<List<int>?>(
        'registered_by',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      usedByTxs:
          (json.valueEnsureAsList<dynamic>(
            'used_by_txs',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QueryReferenceMemoByHashResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryReferenceMemoByHashResponse(
      asset: decode.messageTo<common_common.Asset?>(
        1,
        (b) => common_common.Asset.deserialize(b),
      ),
      memo: decode.getString<String?>(2),
      reference: decode.getString<String?>(3),
      height: decode.getBigInt<BigInt?>(4),
      registrationHash: decode.getString<String?>(5),
      registeredBy: decode.getBytes<List<int>?>(6),
      usedByTxs: decode.getListOrEmpty<String>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryReferenceMemoByHashResponse;
}

class QueryReferenceMemoPreflightRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryReferenceMemoPreflightResponse> {
  final String? height;

  final String? asset;

  final String? amount;

  const QueryReferenceMemoPreflightRequest({
    this.height,
    this.asset,
    this.amount,
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
          path: "/thorchain/memo/check/{asset}/{amount}",
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
  List<Object?> get protoValues => [height, asset, amount];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height, 'asset': asset, 'amount': amount};
  }

  factory QueryReferenceMemoPreflightRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryReferenceMemoPreflightRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
      asset: json.valueAsString<String?>('asset', acceptCamelCase: true),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
    );
  }

  factory QueryReferenceMemoPreflightRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryReferenceMemoPreflightRequest(
      height: decode.getString<String?>(1),
      asset: decode.getString<String?>(2),
      amount: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryReferenceMemoPreflightRequest;
  @override
  QueryReferenceMemoPreflightResponse onQueryResponse(List<int> bytes) {
    return QueryReferenceMemoPreflightResponse.deserialize(bytes);
  }

  @override
  QueryReferenceMemoPreflightResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryReferenceMemoPreflightResponse.fromJson(json);
  }
}

/// The transaction amount in base units
class QueryReferenceMemoPreflightResponse extends CosmosProtoMessage {
  final String? reference;

  /// The reference ID that would be generated from the amount
  final bool? available;

  /// Whether this reference is currently available
  final BigInt? expiresAt;

  /// Block height when current registration expires (0 if available)
  final BigInt? usageCount;

  /// Number of times the reference has been used
  final BigInt? maxUse;

  /// Maximum allowed uses (0 = unlimited)
  final bool? canRegister;

  /// Whether a new registration would succeed for this reference
  final String? memo;

  const QueryReferenceMemoPreflightResponse({
    this.reference,
    this.available,
    this.expiresAt,
    this.usageCount,
    this.maxUse,
    this.canRegister,
    this.memo,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.bool(2),
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.bool(6),
        ProtoFieldConfig.string(7),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    reference,
    available,
    expiresAt,
    usageCount,
    maxUse,
    canRegister,
    memo,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'reference': reference,
      'available': available,
      'expires_at': expiresAt?.toString(),
      'usage_count': usageCount?.toString(),
      'max_use': maxUse?.toString(),
      'can_register': canRegister,
      'memo': memo,
    };
  }

  factory QueryReferenceMemoPreflightResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryReferenceMemoPreflightResponse(
      reference: json.valueAsString<String?>(
        'reference',
        acceptCamelCase: true,
      ),
      available: json.valueAsBool<bool?>('available', acceptCamelCase: true),
      expiresAt: json.valueAsBigInt<BigInt?>(
        'expires_at',
        acceptCamelCase: true,
      ),
      usageCount: json.valueAsBigInt<BigInt?>(
        'usage_count',
        acceptCamelCase: true,
      ),
      maxUse: json.valueAsBigInt<BigInt?>('max_use', acceptCamelCase: true),
      canRegister: json.valueAsBool<bool?>(
        'can_register',
        acceptCamelCase: true,
      ),
      memo: json.valueAsString<String?>('memo', acceptCamelCase: true),
    );
  }

  factory QueryReferenceMemoPreflightResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryReferenceMemoPreflightResponse(
      reference: decode.getString<String?>(1),
      available: decode.getBool<bool?>(2),
      expiresAt: decode.getBigInt<BigInt?>(3),
      usageCount: decode.getBigInt<BigInt?>(4),
      maxUse: decode.getBigInt<BigInt?>(5),
      canRegister: decode.getBool<bool?>(6),
      memo: decode.getString<String?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryReferenceMemoPreflightResponse;
}
