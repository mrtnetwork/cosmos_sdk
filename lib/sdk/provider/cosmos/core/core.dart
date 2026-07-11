import 'package:blockchain_utils/cbor/cbor.dart';
import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:blockchain_utils/networks/types/network.dart';
import 'package:blockchain_utils/service/service.dart';
import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/sdk/exception/exception.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/constants/const.dart';
import 'package:cosmos_sdk/sdk/provider/types/types.dart';

abstract class CosmosRequest<
  RESULT,
  RESPONSE,
  R extends BaseCosmosRequestDetails
>
    extends BaseServiceRequest<RESULT, RESPONSE, R> {}

/// An abstract class representing request parameters for tendermint API calls.
abstract class TendermintRequest<RESULT, RESPONSE>
    extends CosmosRequest<RESULT, RESPONSE, TendermintRequestDetails> {
  TendermintRequest();

  /// method for the request.
  abstract final String method;

  /// list of path parameters variable
  abstract final List<String> pathParameters;

  Map<String, String?> get parameters;

  Map<String, dynamic> get body => {};

  /// Converts the request parameters to [TendermintRequestDetails] with a unique identifier.
  @override
  TendermintRequestDetails buildRequest(int id) {
    final pathParams = CosmosProviderUtils.extractParams(method);
    if (pathParams.length != pathParameters.length) {
      throw DartCosmosSdkPluginException(
        "Invalid Path Parameters.",
        details: {
          "pathParams": pathParameters.join(","),
          "ExceptedPathParametersLength": pathParams.length.toString(),
        },
      );
    }
    String params = method;
    for (int i = 0; i < pathParams.length; i++) {
      params = params.replaceFirst(pathParams[i], pathParameters[i]);
    }
    final queryParameters = Map<String, String>.from(
      parameters..removeWhere((key, value) => value == null),
    );
    if (queryParameters.isNotEmpty) {
      params =
          Uri.parse(params)
              .replace(queryParameters: queryParameters)
              .normalizePath()
              .toString();
    }
    return TendermintRequestDetails(
      requestID: id,
      path: params,
      requestMethod: requestMethod,
      bodyString: requestMethod.isPost ? StringUtils.fromJson(body) : null,
      responseEncoding: ServiceReponseEncoding.map,
      headers:
          requestMethod.isPost ? ServiceConst.defaultPostHeaders : const {},
    );
  }

  @override
  RequestMethod get requestMethod => RequestMethod.get;
}

/// An abstract class representing request parameters for tendermint API calls.
abstract class CosmosRestRequest<RESULT, RESPONSE>
    extends CosmosRequest<RESULT, RESPONSE, CosmosRestRequestDetails> {
  CosmosRestRequest();

  /// method for the request.
  abstract final String path;
  Map<String, dynamic> get parameters;
  Map<String, dynamic>? get body => null;

  /// Converts the request parameters to [TendermintRequestDetails] with a unique identifier.
  @override
  CosmosRestRequestDetails buildRequest(int id) {
    final body = this.body;
    return CosmosRestRequestDetails(
      requestID: id,
      path:
          Uri.parse(
            path,
          ).replace(queryParameters: parameters).normalizePath().toString(),
      requestMethod: requestMethod,
      bodyString:
          requestMethod.isPost && body != null
              ? StringUtils.fromJson(body)
              : null,
      responseEncoding: ServiceReponseEncoding.map,
      headers:
          requestMethod.isPost ? ServiceConst.defaultPostHeaders : const {},
    );
  }

  @override
  RequestMethod get requestMethod => RequestMethod.get;
}

abstract class CosmosGrpcRequest<RESULT>
    extends IGRPCServiceRequest<RESULT, CosmosGrpcRequestDetails> {
  const CosmosGrpcRequest();
  String get method;

  List<int> toBuffer();

  @override
  CosmosGrpcRequestDetails buildRequest(int _) {
    return CosmosGrpcRequestDetails(buffer: toBuffer(), requestMethod: method);
  }
}

abstract class BaseCosmosRequestDetails extends CosmosServiceRequestParams {
  const BaseCosmosRequestDetails({
    required super.requestID,
    required super.path,
    required super.responseEncoding,
    required super.api,
    super.requestMethod = RequestMethod.get,
    super.errorStatusCodes = const [500],
    super.headers = const {},
    super.bodyString,
  }) : super(bodyBytes: null);
  @override
  Uri encodeUrl(String uri) {
    if (uri.endsWith("/")) {
      uri = uri.substring(0, uri.length - 1);
    }
    return Uri.parse("$uri${path ?? ''}");
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'body': bodyString ?? BytesUtils.tryToHexString(bodyBytes),
      "api": api.name,
    };
  }

  @override
  SerializationIdentifier get serializationIdentifier =>
      BlockchainNetwork.cosmosAndRelated.identifier;

  @override
  List<CborObject?> get serializationItems => [
    api.value.toCbor(),
    CborMapValue.definite(
      headers.map((k, v) => MapEntry(CborStringValue(k), CborStringValue(v))),
    ),
    responseEncoding.value.toCbor(),
    path?.toCbor(),
    requestID.toCbor(),
    requestMethod.value.toCbor(),
    bodyString?.toCbor(),
    CborTagSerializable.listFromDynamic(
      errorStatusCodes?.map((e) => CborIntValue(e)).toList() ?? [],
    ),
  ];
}

class TendermintRequestDetails extends BaseCosmosRequestDetails {
  const TendermintRequestDetails({
    required super.requestID,
    required super.path,
    required super.responseEncoding,
    super.requestMethod = RequestMethod.get,
    super.errorStatusCodes = const [500],
    super.headers = const {},
    super.bodyString,
  }) : super(api: CosmosProviderApi.tendermint);
  factory TendermintRequestDetails.deserialize({
    List<int>? bytes,
    CborObject? obj,
  }) {
    final values = CborTagSerializable.decodeTaggedValue(
      identifier: BlockchainNetwork.cosmosAndRelated.identifier,
      cborBytes: bytes,
      cborObject: obj,
    );
    return TendermintRequestDetails(
      headers: values
          .mapAt<CborStringValue, CborStringValue>(1)
          .map((k, v) => MapEntry(k.value, v.value)),
      responseEncoding: ServiceReponseEncoding.fromValue(values.rawValueAt(2)),
      path: values.rawValueAt(3),
      requestID: values.rawValueAt(4),
      requestMethod: RequestMethod.fromValue(values.rawValueAt(5)),
      bodyString: values.rawValueAt(6),
      errorStatusCodes:
          values
              .listAt<CborIntValue>(7)
              .map((e) => e.value)
              .toList()
              .emptyAsNull,
    );
  }
  TendermintRequestDetails copyWith({
    int? requestID,
    String? path,
    Map<String, String>? headers,
    ServiceReponseEncoding? responseEncoding,
    RequestMethod? requestMethod,
    String? bodyString,
    List<int>? errorStatusCodes,
  }) {
    return TendermintRequestDetails(
      requestID: requestID ?? this.requestID,
      headers: headers ?? this.headers,
      path: path ?? this.path,
      responseEncoding: responseEncoding ?? this.responseEncoding,
      requestMethod: requestMethod ?? this.requestMethod,
      bodyString: bodyString ?? this.bodyString,
      errorStatusCodes: errorStatusCodes ?? this.errorStatusCodes,
    );
  }
}

class CosmosRestRequestDetails extends BaseCosmosRequestDetails {
  const CosmosRestRequestDetails({
    required super.requestID,
    required super.path,
    required super.responseEncoding,
    super.requestMethod = RequestMethod.get,
    super.errorStatusCodes = const [500, 404],
    super.headers = const {},
    super.bodyString,
  }) : super(api: CosmosProviderApi.rest);
  factory CosmosRestRequestDetails.deserialize({
    List<int>? bytes,
    CborObject? obj,
  }) {
    final values = CborTagSerializable.decodeTaggedValue(
      identifier: BlockchainNetwork.cosmosAndRelated.identifier,
      cborBytes: bytes,
      cborObject: obj,
    );
    return CosmosRestRequestDetails(
      headers: values
          .mapAt<CborStringValue, CborStringValue>(1)
          .map((k, v) => MapEntry(k.value, v.value)),
      responseEncoding: ServiceReponseEncoding.fromValue(values.rawValueAt(2)),
      path: values.rawValueAt(3),
      requestID: values.rawValueAt(4),
      requestMethod: RequestMethod.fromValue(values.rawValueAt(5)),
      bodyString: values.rawValueAt(6),
      errorStatusCodes:
          values
              .listAt<CborIntValue>(7)
              .map((e) => e.value)
              .toList()
              .emptyAsNull,
    );
  }
  CosmosRestRequestDetails copyWith({
    int? requestID,
    String? path,
    Map<String, String>? headers,
    ServiceReponseEncoding? responseEncoding,
    RequestMethod? requestMethod,
    String? bodyString,
    List<int>? errorStatusCodes,
  }) {
    return CosmosRestRequestDetails(
      requestID: requestID ?? this.requestID,
      headers: headers ?? this.headers,
      path: path ?? this.path,
      responseEncoding: responseEncoding ?? this.responseEncoding,
      requestMethod: requestMethod ?? this.requestMethod,
      bodyString: bodyString ?? this.bodyString,
      errorStatusCodes: errorStatusCodes ?? this.errorStatusCodes,
    );
  }
}

class CosmosGrpcRequestDetails extends BaseCosmosServiceRequestParams
    with CborTagSerializable
    implements BaseGRPCServiceRequestParams {
  final String requestMethod;
  final List<int> buffer;

  CosmosGrpcRequestDetails({
    required List<int> buffer,
    required this.requestMethod,
  }) : buffer = buffer.asImmutableBytes,
       super(CosmosProviderApi.grpc);
  factory CosmosGrpcRequestDetails.deserialize({
    List<int>? bytes,
    CborObject? obj,
  }) {
    final values = CborTagSerializable.decodeTaggedValue(
      identifier: BlockchainNetwork.cosmosAndRelated.identifier,
      cborBytes: bytes,
      cborObject: obj,
    );
    return CosmosGrpcRequestDetails(
      buffer: values.rawValueAt(1),
      requestMethod: values.rawValueAt(2),
    );
  }

  @override
  String method() {
    return requestMethod;
  }

  @override
  List<int> toBuffer() {
    return buffer;
  }

  @override
  SerializationIdentifier get serializationIdentifier =>
      BlockchainNetwork.cosmosAndRelated.identifier;

  @override
  List<CborObject?> get serializationItems => [
    api.value.toCbor(),
    CborBytesValue(buffer),
    requestMethod.toCbor(),
  ];

  @override
  Uri encodeUrl(String uri) {
    return Uri.parse(uri);
  }
}
