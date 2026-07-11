import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryOutboundFeeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryOutboundFeesResponse> {
  final String? asset;

  final String? height;

  const QueryOutboundFeeRequest({this.asset, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/outbound_fee/{asset}",
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

  factory QueryOutboundFeeRequest.fromJson(Map<String, dynamic> json) {
    return QueryOutboundFeeRequest(
      asset: json.valueAsString<String?>('asset', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryOutboundFeeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOutboundFeeRequest(
      asset: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryOutboundFeeRequest;
  @override
  QueryOutboundFeesResponse onQueryResponse(List<int> bytes) {
    return QueryOutboundFeesResponse.deserialize(bytes);
  }

  @override
  QueryOutboundFeesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryOutboundFeesResponse.fromJson(json);
  }
}

class QueryOutboundFeeResponse extends CosmosProtoMessage {
  /// the asset to display the outbound fee for
  final String? asset;

  /// the asset's outbound fee, in (1e8-format) units of the asset
  final String? outboundFee;

  /// Total RUNE the network has withheld as fees to later cover gas costs for
  /// this asset's outbounds
  final String? feeWithheldRune;

  /// Total RUNE the network has spent to reimburse gas costs for this asset's
  /// outbounds
  final String? feeSpentRune;

  /// amount of RUNE by which the fee_withheld_rune exceeds the fee_spent_rune
  final String? surplusRune;

  /// dynamic multiplier basis points, based on the surplus_rune, affecting the
  /// size of the outbound_fee
  final String? dynamicMultiplierBasisPoints;

  const QueryOutboundFeeResponse({
    this.asset,
    this.outboundFee,
    this.feeWithheldRune,
    this.feeSpentRune,
    this.surplusRune,
    this.dynamicMultiplierBasisPoints,
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
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.string(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    asset,
    outboundFee,
    feeWithheldRune,
    feeSpentRune,
    surplusRune,
    dynamicMultiplierBasisPoints,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'asset': asset,
      'outbound_fee': outboundFee,
      'fee_withheld_rune': feeWithheldRune,
      'fee_spent_rune': feeSpentRune,
      'surplus_rune': surplusRune,
      'dynamic_multiplier_basis_points': dynamicMultiplierBasisPoints,
    };
  }

  factory QueryOutboundFeeResponse.fromJson(Map<String, dynamic> json) {
    return QueryOutboundFeeResponse(
      asset: json.valueAsString<String?>('asset', acceptCamelCase: true),
      outboundFee: json.valueAsString<String?>(
        'outbound_fee',
        acceptCamelCase: true,
      ),
      feeWithheldRune: json.valueAsString<String?>(
        'fee_withheld_rune',
        acceptCamelCase: true,
      ),
      feeSpentRune: json.valueAsString<String?>(
        'fee_spent_rune',
        acceptCamelCase: true,
      ),
      surplusRune: json.valueAsString<String?>(
        'surplus_rune',
        acceptCamelCase: true,
      ),
      dynamicMultiplierBasisPoints: json.valueAsString<String?>(
        'dynamic_multiplier_basis_points',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryOutboundFeeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOutboundFeeResponse(
      asset: decode.getString<String?>(1),
      outboundFee: decode.getString<String?>(2),
      feeWithheldRune: decode.getString<String?>(3),
      feeSpentRune: decode.getString<String?>(4),
      surplusRune: decode.getString<String?>(5),
      dynamicMultiplierBasisPoints: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryOutboundFeeResponse;
}

class QueryOutboundFeesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryOutboundFeesResponse> {
  final String? height;

  const QueryOutboundFeesRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/outbound_fees",
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

  factory QueryOutboundFeesRequest.fromJson(Map<String, dynamic> json) {
    return QueryOutboundFeesRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryOutboundFeesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOutboundFeesRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryOutboundFeesRequest;
  @override
  QueryOutboundFeesResponse onQueryResponse(List<int> bytes) {
    return QueryOutboundFeesResponse.deserialize(bytes);
  }

  @override
  QueryOutboundFeesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryOutboundFeesResponse.fromJson(json);
  }
}

class QueryOutboundFeesResponse extends CosmosProtoMessage {
  final List<QueryOutboundFeeResponse> outboundFees;

  const QueryOutboundFeesResponse({this.outboundFees = const []});

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
  List<Object?> get protoValues => [outboundFees];

  @override
  Map<String, dynamic> toJson() {
    return {'outbound_fees': outboundFees.map((e) => e.toJson()).toList()};
  }

  factory QueryOutboundFeesResponse.fromJson(Map<String, dynamic> json) {
    return QueryOutboundFeesResponse(
      outboundFees:
          (json.valueEnsureAsList<dynamic>(
                'outbound_fees',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  QueryOutboundFeeResponse,
                  Map<String, dynamic>
                >(value: e, parse: (v) => QueryOutboundFeeResponse.fromJson(v)),
              )
              .toList(),
    );
  }

  factory QueryOutboundFeesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOutboundFeesResponse(
      outboundFees:
          decode
              .getListOfBytes(1)
              .map((b) => QueryOutboundFeeResponse.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryOutboundFeesResponse;
}
