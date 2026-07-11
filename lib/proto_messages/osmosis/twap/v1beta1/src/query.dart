import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/osmosis/twap/v1beta1/src/genesis.dart"
    as osmosis_twap_v1beta1_genesis;

class ArithmeticTwapRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ArithmeticTwapResponse> {
  final BigInt? poolId;

  final String? baseAsset;

  final String? quoteAsset;

  final google_protobuf_timestamp.Timestamp? startTime;

  final google_protobuf_timestamp.Timestamp? endTime;

  const ArithmeticTwapRequest({
    this.poolId,
    this.baseAsset,
    this.quoteAsset,
    this.startTime,
    this.endTime,
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
          path: "/osmosis/twap/v1beta1/ArithmeticTwap",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.message(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    poolId,
    baseAsset,
    quoteAsset,
    startTime,
    endTime,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'pool_id': poolId?.toString(),
      'base_asset': baseAsset,
      'quote_asset': quoteAsset,
      'start_time': startTime?.toRfc3339(),
      'end_time': endTime?.toRfc3339(),
    };
  }

  factory ArithmeticTwapRequest.fromJson(Map<String, dynamic> json) {
    return ArithmeticTwapRequest(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      baseAsset: json.valueAsString<String?>(
        'base_asset',
        acceptCamelCase: true,
      ),
      quoteAsset: json.valueAsString<String?>(
        'quote_asset',
        acceptCamelCase: true,
      ),
      startTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'start_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      endTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'end_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory ArithmeticTwapRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ArithmeticTwapRequest(
      poolId: decode.getBigInt<BigInt?>(1),
      baseAsset: decode.getString<String?>(2),
      quoteAsset: decode.getString<String?>(3),
      startTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        4,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      endTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        5,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTwapV1beta1ArithmeticTwapRequest;
  @override
  ArithmeticTwapResponse onQueryResponse(List<int> bytes) {
    return ArithmeticTwapResponse.deserialize(bytes);
  }

  @override
  ArithmeticTwapResponse onQueryResponseJson(Map<String, dynamic> json) {
    return ArithmeticTwapResponse.fromJson(json);
  }
}

class ArithmeticTwapResponse extends CosmosProtoMessage {
  final String? arithmeticTwap;

  const ArithmeticTwapResponse({this.arithmeticTwap});

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
  List<Object?> get protoValues => [arithmeticTwap];

  @override
  Map<String, dynamic> toJson() {
    return {'arithmetic_twap': arithmeticTwap};
  }

  factory ArithmeticTwapResponse.fromJson(Map<String, dynamic> json) {
    return ArithmeticTwapResponse(
      arithmeticTwap: json.valueAsString<String?>(
        'arithmetic_twap',
        acceptCamelCase: true,
      ),
    );
  }

  factory ArithmeticTwapResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ArithmeticTwapResponse(arithmeticTwap: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTwapV1beta1ArithmeticTwapResponse;
}

class ArithmeticTwapToNowRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ArithmeticTwapToNowResponse> {
  final BigInt? poolId;

  final String? baseAsset;

  final String? quoteAsset;

  final google_protobuf_timestamp.Timestamp? startTime;

  const ArithmeticTwapToNowRequest({
    this.poolId,
    this.baseAsset,
    this.quoteAsset,
    this.startTime,
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
          path: "/osmosis/twap/v1beta1/ArithmeticTwapToNow",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [poolId, baseAsset, quoteAsset, startTime];

  @override
  Map<String, dynamic> toJson() {
    return {
      'pool_id': poolId?.toString(),
      'base_asset': baseAsset,
      'quote_asset': quoteAsset,
      'start_time': startTime?.toRfc3339(),
    };
  }

  factory ArithmeticTwapToNowRequest.fromJson(Map<String, dynamic> json) {
    return ArithmeticTwapToNowRequest(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      baseAsset: json.valueAsString<String?>(
        'base_asset',
        acceptCamelCase: true,
      ),
      quoteAsset: json.valueAsString<String?>(
        'quote_asset',
        acceptCamelCase: true,
      ),
      startTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'start_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory ArithmeticTwapToNowRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ArithmeticTwapToNowRequest(
      poolId: decode.getBigInt<BigInt?>(1),
      baseAsset: decode.getString<String?>(2),
      quoteAsset: decode.getString<String?>(3),
      startTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        4,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTwapV1beta1ArithmeticTwapToNowRequest;
  @override
  ArithmeticTwapToNowResponse onQueryResponse(List<int> bytes) {
    return ArithmeticTwapToNowResponse.deserialize(bytes);
  }

  @override
  ArithmeticTwapToNowResponse onQueryResponseJson(Map<String, dynamic> json) {
    return ArithmeticTwapToNowResponse.fromJson(json);
  }
}

class ArithmeticTwapToNowResponse extends CosmosProtoMessage {
  final String? arithmeticTwap;

  const ArithmeticTwapToNowResponse({this.arithmeticTwap});

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
  List<Object?> get protoValues => [arithmeticTwap];

  @override
  Map<String, dynamic> toJson() {
    return {'arithmetic_twap': arithmeticTwap};
  }

  factory ArithmeticTwapToNowResponse.fromJson(Map<String, dynamic> json) {
    return ArithmeticTwapToNowResponse(
      arithmeticTwap: json.valueAsString<String?>(
        'arithmetic_twap',
        acceptCamelCase: true,
      ),
    );
  }

  factory ArithmeticTwapToNowResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ArithmeticTwapToNowResponse(
      arithmeticTwap: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTwapV1beta1ArithmeticTwapToNowResponse;
}

class GeometricTwapRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GeometricTwapResponse> {
  final BigInt? poolId;

  final String? baseAsset;

  final String? quoteAsset;

  final google_protobuf_timestamp.Timestamp? startTime;

  final google_protobuf_timestamp.Timestamp? endTime;

  const GeometricTwapRequest({
    this.poolId,
    this.baseAsset,
    this.quoteAsset,
    this.startTime,
    this.endTime,
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
          path: "/osmosis/twap/v1beta1/GeometricTwap",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.message(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    poolId,
    baseAsset,
    quoteAsset,
    startTime,
    endTime,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'pool_id': poolId?.toString(),
      'base_asset': baseAsset,
      'quote_asset': quoteAsset,
      'start_time': startTime?.toRfc3339(),
      'end_time': endTime?.toRfc3339(),
    };
  }

  factory GeometricTwapRequest.fromJson(Map<String, dynamic> json) {
    return GeometricTwapRequest(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      baseAsset: json.valueAsString<String?>(
        'base_asset',
        acceptCamelCase: true,
      ),
      quoteAsset: json.valueAsString<String?>(
        'quote_asset',
        acceptCamelCase: true,
      ),
      startTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'start_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      endTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'end_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory GeometricTwapRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GeometricTwapRequest(
      poolId: decode.getBigInt<BigInt?>(1),
      baseAsset: decode.getString<String?>(2),
      quoteAsset: decode.getString<String?>(3),
      startTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        4,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      endTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        5,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTwapV1beta1GeometricTwapRequest;
  @override
  GeometricTwapResponse onQueryResponse(List<int> bytes) {
    return GeometricTwapResponse.deserialize(bytes);
  }

  @override
  GeometricTwapResponse onQueryResponseJson(Map<String, dynamic> json) {
    return GeometricTwapResponse.fromJson(json);
  }
}

class GeometricTwapResponse extends CosmosProtoMessage {
  final String? geometricTwap;

  const GeometricTwapResponse({this.geometricTwap});

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
  List<Object?> get protoValues => [geometricTwap];

  @override
  Map<String, dynamic> toJson() {
    return {'geometric_twap': geometricTwap};
  }

  factory GeometricTwapResponse.fromJson(Map<String, dynamic> json) {
    return GeometricTwapResponse(
      geometricTwap: json.valueAsString<String?>(
        'geometric_twap',
        acceptCamelCase: true,
      ),
    );
  }

  factory GeometricTwapResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GeometricTwapResponse(geometricTwap: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTwapV1beta1GeometricTwapResponse;
}

class GeometricTwapToNowRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GeometricTwapToNowResponse> {
  final BigInt? poolId;

  final String? baseAsset;

  final String? quoteAsset;

  final google_protobuf_timestamp.Timestamp? startTime;

  const GeometricTwapToNowRequest({
    this.poolId,
    this.baseAsset,
    this.quoteAsset,
    this.startTime,
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
          path: "/osmosis/twap/v1beta1/GeometricTwapToNow",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [poolId, baseAsset, quoteAsset, startTime];

  @override
  Map<String, dynamic> toJson() {
    return {
      'pool_id': poolId?.toString(),
      'base_asset': baseAsset,
      'quote_asset': quoteAsset,
      'start_time': startTime?.toRfc3339(),
    };
  }

  factory GeometricTwapToNowRequest.fromJson(Map<String, dynamic> json) {
    return GeometricTwapToNowRequest(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      baseAsset: json.valueAsString<String?>(
        'base_asset',
        acceptCamelCase: true,
      ),
      quoteAsset: json.valueAsString<String?>(
        'quote_asset',
        acceptCamelCase: true,
      ),
      startTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'start_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory GeometricTwapToNowRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GeometricTwapToNowRequest(
      poolId: decode.getBigInt<BigInt?>(1),
      baseAsset: decode.getString<String?>(2),
      quoteAsset: decode.getString<String?>(3),
      startTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        4,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTwapV1beta1GeometricTwapToNowRequest;
  @override
  GeometricTwapToNowResponse onQueryResponse(List<int> bytes) {
    return GeometricTwapToNowResponse.deserialize(bytes);
  }

  @override
  GeometricTwapToNowResponse onQueryResponseJson(Map<String, dynamic> json) {
    return GeometricTwapToNowResponse.fromJson(json);
  }
}

class GeometricTwapToNowResponse extends CosmosProtoMessage {
  final String? geometricTwap;

  const GeometricTwapToNowResponse({this.geometricTwap});

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
  List<Object?> get protoValues => [geometricTwap];

  @override
  Map<String, dynamic> toJson() {
    return {'geometric_twap': geometricTwap};
  }

  factory GeometricTwapToNowResponse.fromJson(Map<String, dynamic> json) {
    return GeometricTwapToNowResponse(
      geometricTwap: json.valueAsString<String?>(
        'geometric_twap',
        acceptCamelCase: true,
      ),
    );
  }

  factory GeometricTwapToNowResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GeometricTwapToNowResponse(
      geometricTwap: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTwapV1beta1GeometricTwapToNowResponse;
}

class ParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ParamsResponse> {
  const ParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/twap/v1beta1/Params",
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

  factory ParamsRequest.fromJson(Map<String, dynamic> json) {
    return ParamsRequest();
  }

  factory ParamsRequest.deserialize(List<int> bytes) {
    return ParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTwapV1beta1ParamsRequest;
  @override
  ParamsResponse onQueryResponse(List<int> bytes) {
    return ParamsResponse.deserialize(bytes);
  }

  @override
  ParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return ParamsResponse.fromJson(json);
  }
}

class ParamsResponse extends CosmosProtoMessage {
  final osmosis_twap_v1beta1_genesis.Params? params;

  const ParamsResponse({this.params});

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

  factory ParamsResponse.fromJson(Map<String, dynamic> json) {
    return ParamsResponse(
      params: json
          .valueTo<osmosis_twap_v1beta1_genesis.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => osmosis_twap_v1beta1_genesis.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory ParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ParamsResponse(
      params: decode.messageTo<osmosis_twap_v1beta1_genesis.Params?>(
        1,
        (b) => osmosis_twap_v1beta1_genesis.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTwapV1beta1ParamsResponse;
}
