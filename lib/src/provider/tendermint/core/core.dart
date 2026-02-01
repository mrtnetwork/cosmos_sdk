import 'package:blockchain_utils/service/service.dart';
import 'package:blockchain_utils/utils/string/string.dart';
import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// An abstract class representing request parameters for tendermint API calls.
abstract class TendermintRequest<RESULT, RESPONSE>
    extends BaseServiceRequest<RESULT, RESPONSE, TendermintRequestDetails> {
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
    final pathParams = CosmosUtils.extractParams(method);
    if (pathParams.length != pathParameters.length) {
      throw DartCosmosSdkPluginException(
        "Invalid Path Parameters.",
        details: {
          "pathParams": pathParameters,
          "ExceptedPathParametersLength": pathParams.length,
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
      pathParams: params,
      type: requestType,
      jsonBody: requestType.isPostRequest ? body : null,
      headers:
          requestType.isPostRequest
              ? ServiceConst.defaultPostHeaders
              : const {},
    );
  }

  @override
  RequestServiceType get requestType => RequestServiceType.get;
}

/// Represents the details of a Tendermint request.
class TendermintRequestDetails extends BaseServiceRequestParams {
  /// Constructs a new [TendermintRequestDetails] instance with the specified parameters.
  const TendermintRequestDetails({
    required super.requestID,
    required this.pathParams,
    this.jsonBody,
    super.type = RequestServiceType.get,
    super.headers = const {},
  });

  /// URL path parameters
  final String pathParams;
  final Map<String, dynamic>? jsonBody;

  /// Request body
  @override
  List<int>? body() {
    return StringUtils.tryEncode(StringUtils.tryFromJson(jsonBody));
  }

  @override
  Map<String, dynamic> toJson() {
    return {"pathparameters": pathParams};
  }

  /// Generates the complete request URL by combining the base URI and method-specific URI.
  @override
  Uri toUri(String uri) {
    String url = uri;
    if (url.endsWith("/")) {
      url = url.substring(0, url.length - 1);
    }
    return Uri.parse("$url$pathParams");
  }
}
