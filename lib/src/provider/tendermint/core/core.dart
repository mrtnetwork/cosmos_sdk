import 'package:blockchain_utils/service/service.dart';
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

  /// Converts the request parameters to [TendermintRequestDetails] with a unique identifier.
  @override
  TendermintRequestDetails buildRequest(int id) {
    final pathParams = CosmosUtils.extractParams(method);
    if (pathParams.length != pathParameters.length) {
      throw DartCosmosSdkPluginException("Invalid Path Parameters.", details: {
        "pathParams": pathParameters,
        "ExceptedPathParametersLength": pathParams.length
      });
    }
    String params = method;
    for (int i = 0; i < pathParams.length; i++) {
      params = params.replaceFirst(pathParams[i], pathParameters[i]);
    }
    final queryParameters = Map<String, String>.from(
        parameters..removeWhere((key, value) => value == null));
    if (queryParameters.isNotEmpty) {
      params = Uri.parse(params)
          .replace(queryParameters: queryParameters)
          .normalizePath()
          .toString();
    }

    return TendermintRequestDetails(requestID: id, pathParams: params);
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
    super.headers = const {},
  }) : super(type: RequestServiceType.get);

  /// URL path parameters
  final String pathParams;

  /// Request body
  @override
  List<int>? body() {
    return null;
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
