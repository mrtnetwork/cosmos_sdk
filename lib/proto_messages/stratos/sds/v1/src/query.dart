import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/stratos/sds/v1/src/sds.dart"
    as stratos_sds_v1_sds;

/// QueryFileuploadRequest is request type for the Query/Fileupload RPC method
class QueryFileUploadRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryFileUploadResponse> {
  /// network_addr defines the node network address to query for.
  final String? fileHash;

  const QueryFileUploadRequest({this.fileHash});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/sds/v1/file_upload/{file_hash}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [fileHash];

  @override
  Map<String, dynamic> toJson() {
    return {'file_hash': fileHash};
  }

  factory QueryFileUploadRequest.fromJson(Map<String, dynamic> json) {
    return QueryFileUploadRequest(
      fileHash: json.valueAsString<String?>('file_hash', acceptCamelCase: true),
    );
  }

  factory QueryFileUploadRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryFileUploadRequest(fileHash: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosSdsV1QueryFileUploadRequest;
  @override
  QueryFileUploadResponse onQueryResponse(List<int> bytes) {
    return QueryFileUploadResponse.deserialize(bytes);
  }

  @override
  QueryFileUploadResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryFileUploadResponse.fromJson(json);
  }
}

/// QueryFileuploadResponse is response type for the Query/Fileupload RPC method
class QueryFileUploadResponse extends CosmosProtoMessage {
  final stratos_sds_v1_sds.FileInfo? fileInfo;

  const QueryFileUploadResponse({this.fileInfo});

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
  List<Object?> get protoValues => [fileInfo];

  @override
  Map<String, dynamic> toJson() {
    return {'file_info': fileInfo?.toJson()};
  }

  factory QueryFileUploadResponse.fromJson(Map<String, dynamic> json) {
    return QueryFileUploadResponse(
      fileInfo: json
          .valueTo<stratos_sds_v1_sds.FileInfo?, Map<String, dynamic>>(
            key: 'file_info',
            parse: (v) => stratos_sds_v1_sds.FileInfo.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryFileUploadResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryFileUploadResponse(
      fileInfo: decode.messageTo<stratos_sds_v1_sds.FileInfo?>(
        1,
        (b) => stratos_sds_v1_sds.FileInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosSdsV1QueryFileUploadResponse;
}

class QuerySimPrepayRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySimPrepayResponse> {
  final String? amount;

  const QuerySimPrepayRequest({this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/sds/v1/sim_prepay/{amount}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [amount];

  @override
  Map<String, dynamic> toJson() {
    return {'amount': amount};
  }

  factory QuerySimPrepayRequest.fromJson(Map<String, dynamic> json) {
    return QuerySimPrepayRequest(
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
    );
  }

  factory QuerySimPrepayRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySimPrepayRequest(amount: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosSdsV1QuerySimPrepayRequest;
  @override
  QuerySimPrepayResponse onQueryResponse(List<int> bytes) {
    return QuerySimPrepayResponse.deserialize(bytes);
  }

  @override
  QuerySimPrepayResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySimPrepayResponse.fromJson(json);
  }
}

class QuerySimPrepayResponse extends CosmosProtoMessage {
  final String? noz;

  const QuerySimPrepayResponse({this.noz});

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
  List<Object?> get protoValues => [noz];

  @override
  Map<String, dynamic> toJson() {
    return {'noz': noz};
  }

  factory QuerySimPrepayResponse.fromJson(Map<String, dynamic> json) {
    return QuerySimPrepayResponse(
      noz: json.valueAsString<String?>('noz', acceptCamelCase: true),
    );
  }

  factory QuerySimPrepayResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySimPrepayResponse(noz: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosSdsV1QuerySimPrepayResponse;
}

class QueryNozPriceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryNozPriceResponse> {
  const QueryNozPriceRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/sds/v1/noz_price",
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

  factory QueryNozPriceRequest.fromJson(Map<String, dynamic> json) {
    return QueryNozPriceRequest();
  }

  factory QueryNozPriceRequest.deserialize(List<int> bytes) {
    return QueryNozPriceRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosSdsV1QueryNozPriceRequest;
  @override
  QueryNozPriceResponse onQueryResponse(List<int> bytes) {
    return QueryNozPriceResponse.deserialize(bytes);
  }

  @override
  QueryNozPriceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryNozPriceResponse.fromJson(json);
  }
}

class QueryNozPriceResponse extends CosmosProtoMessage {
  final String? price;

  const QueryNozPriceResponse({this.price});

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
  List<Object?> get protoValues => [price];

  @override
  Map<String, dynamic> toJson() {
    return {'price': price};
  }

  factory QueryNozPriceResponse.fromJson(Map<String, dynamic> json) {
    return QueryNozPriceResponse(
      price: json.valueAsString<String?>('price', acceptCamelCase: true),
    );
  }

  factory QueryNozPriceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNozPriceResponse(price: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosSdsV1QueryNozPriceResponse;
}

class QueryNozSupplyRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryNozSupplyResponse> {
  const QueryNozSupplyRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/sds/v1/noz_supply",
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

  factory QueryNozSupplyRequest.fromJson(Map<String, dynamic> json) {
    return QueryNozSupplyRequest();
  }

  factory QueryNozSupplyRequest.deserialize(List<int> bytes) {
    return QueryNozSupplyRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosSdsV1QueryNozSupplyRequest;
  @override
  QueryNozSupplyResponse onQueryResponse(List<int> bytes) {
    return QueryNozSupplyResponse.deserialize(bytes);
  }

  @override
  QueryNozSupplyResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryNozSupplyResponse.fromJson(json);
  }
}

class QueryNozSupplyResponse extends CosmosProtoMessage {
  final String? remaining;

  final String? total;

  const QueryNozSupplyResponse({this.remaining, this.total});

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
  List<Object?> get protoValues => [remaining, total];

  @override
  Map<String, dynamic> toJson() {
    return {'remaining': remaining, 'total': total};
  }

  factory QueryNozSupplyResponse.fromJson(Map<String, dynamic> json) {
    return QueryNozSupplyResponse(
      remaining: json.valueAsString<String?>(
        'remaining',
        acceptCamelCase: true,
      ),
      total: json.valueAsString<String?>('total', acceptCamelCase: true),
    );
  }

  factory QueryNozSupplyResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNozSupplyResponse(
      remaining: decode.getString<String?>(1),
      total: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosSdsV1QueryNozSupplyResponse;
}

/// QueryParamsRequest is request type for the Query/Params RPC method.
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
          path: "/stratos/sds/v1/params",
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
      DefaultCosmosProtoTypeUrl.stratosSdsV1QueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

/// QueryParamsResponse is response type for the Query/Params RPC method.
class QueryParamsResponse extends CosmosProtoMessage {
  /// params holds all the parameters of this module.
  final stratos_sds_v1_sds.Params? params;

  const QueryParamsResponse({this.params});

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
  List<Object?> get protoValues => [params];

  @override
  Map<String, dynamic> toJson() {
    return {'params': params?.toJson()};
  }

  factory QueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryParamsResponse(
      params: json.valueTo<stratos_sds_v1_sds.Params?, Map<String, dynamic>>(
        key: 'params',
        parse: (v) => stratos_sds_v1_sds.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<stratos_sds_v1_sds.Params?>(
        1,
        (b) => stratos_sds_v1_sds.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosSdsV1QueryParamsResponse;
}
