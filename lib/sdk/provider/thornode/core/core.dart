import 'package:blockchain_utils/cbor/cbor.dart';
import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:blockchain_utils/networks/types/network.dart';
import 'package:blockchain_utils/service/service.dart';
import 'package:cosmos_sdk/sdk/exception/exception.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/constants/const.dart';
import 'package:cosmos_sdk/sdk/provider/types/types.dart';

/// https://gateway.liquify.com/chain/thorchain_api/thorchain/doc/
/// An abstract class representing request parameters for tendermint API calls.
abstract class ThorNodeRequestParam<RESULT, RESPONSE>
    extends BaseServiceRequest<RESULT, RESPONSE, ThorNodeRequestDetails> {
  ThorNodeRequestParam();

  /// method for the request.
  abstract final String method;

  /// list of path parameters variable
  abstract final List<String> pathParameters;

  Map<String, String?> get parameters;

  /// Converts the request parameters to [ThorNodeRequestDetails] with a unique identifier.
  @override
  ThorNodeRequestDetails buildRequest(int id) {
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
    final existsParams = Map<String, String>.from(
      parameters..removeWhere((key, value) => value == null),
    );
    if (existsParams.isNotEmpty) {
      params =
          Uri.parse(
            params,
          ).replace(queryParameters: existsParams).normalizePath().toString();
    }

    return ThorNodeRequestDetails(
      requestID: id,
      path: params,
      responseEncoding: ServiceReponseEncoding.fromType<RESPONSE>(),
    );
  }

  @override
  RequestMethod get requestMethod => RequestMethod.get;
}

class ThorNodeRequestDetails extends CosmosServiceRequestParams {
  const ThorNodeRequestDetails({
    required super.requestID,
    required super.path,
    required super.responseEncoding,
    super.errorStatusCodes = const [400],
    super.headers = const {"Accept": "application/json"},
  }) : super(
         api: CosmosProviderApi.thorNode,
         bodyBytes: null,
         requestMethod: RequestMethod.get,
         bodyString: null,
       );
  factory ThorNodeRequestDetails.deserialize({
    List<int>? bytes,
    CborObject? obj,
  }) {
    final values = CborTagSerializable.decodeTaggedValue(
      identifier: BlockchainNetwork.cosmosAndRelated.identifier,
      cborBytes: bytes,
      cborObject: obj,
    );
    return ThorNodeRequestDetails(
      headers: values
          .mapAt<CborStringValue, CborStringValue>(1)
          .map((k, v) => MapEntry(k.value, v.value)),
      responseEncoding: ServiceReponseEncoding.fromValue(values.rawValueAt(2)),
      path: values.rawValueAt(3),
      requestID: values.rawValueAt(4),
      errorStatusCodes:
          values
              .listAt<CborIntValue>(5)
              .map((e) => e.value)
              .toList()
              .emptyAsNull,
    );
  }

  ThorNodeRequestDetails copyWith({
    int? requestID,
    String? path,
    Map<String, String>? headers,
    ServiceReponseEncoding? responseEncoding,
    List<int>? errorStatusCodes,
  }) {
    return ThorNodeRequestDetails(
      requestID: requestID ?? this.requestID,
      headers: headers ?? this.headers,
      path: path ?? this.path,
      responseEncoding: responseEncoding ?? this.responseEncoding,
      errorStatusCodes: errorStatusCodes ?? this.errorStatusCodes,
    );
  }

  @override
  Uri encodeUrl(String uri) {
    if (uri.endsWith("/")) {
      uri = uri.substring(0, uri.length - 1);
    }
    return Uri.parse("$uri${path ?? ''}");
  }

  @override
  Map<String, dynamic> toJson() {
    return {'path': path};
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
    CborTagSerializable.listFromDynamic(
      errorStatusCodes?.map((e) => CborIntValue(e)).toList() ?? [],
    ),
  ];
}
