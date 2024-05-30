import 'package:blockchain_utils/exception/exception.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// An abstract class representing request parameters for tendermint API calls.
abstract class ThoreNodeRequestParams {
  /// method for the request.
  abstract final String method;

  /// list of path parameters variable
  abstract final List<String> pathParameters;

  Map<String, String?> get parameters;
}

/// An abstract class representing request parameters for tendermint API calls.
abstract class ThorNodeRequestParam<RESULT, RESPONSE>
    implements ThoreNodeRequestParams {
  ThorNodeRequestParam();

  /// Converts the response result to the specified type [RESULT].
  RESULT onResonse(RESPONSE result) {
    return result as RESULT;
  }

  /// Converts the request parameters to [ThorNodeRequestDetails] with a unique identifier.
  ThorNodeRequestDetails toRequest(int id) {
    final pathParams = CosmosUtils.extractParams(method);
    if (pathParams.length != pathParameters.length) {
      throw MessageException("Invalid Path Parameters.", details: {
        "pathParams": pathParameters,
        "ExceptedPathParametersLength": pathParams.length
      });
    }
    String params = method;
    for (int i = 0; i < pathParams.length; i++) {
      params = params.replaceFirst(pathParams[i], pathParameters[i]);
    }
    final existsParams = Map<String, String>.from(
        parameters..removeWhere((key, value) => value == null));
    if (existsParams.isNotEmpty) {
      params = Uri.parse(params)
          .replace(queryParameters: existsParams)
          .normalizePath()
          .toString();
    }

    return ThorNodeRequestDetails(id: id, pathParams: params);
  }
}

/// Represents the details of a Tendermint request.
class ThorNodeRequestDetails {
  /// Constructs a new [ThorNodeRequestDetails] instance with the specified parameters.
  const ThorNodeRequestDetails(
      {required this.id,
      required this.pathParams,
      this.header = const {},
      this.body});

  ThorNodeRequestDetails copyWith({
    int? id,
    String? pathParams,
    Map<String, String>? header,
    Object? body,
  }) {
    return ThorNodeRequestDetails(
      id: id ?? this.id,
      pathParams: pathParams ?? this.pathParams,
      header: header ?? this.header,
      body: body ?? this.body,
    );
  }

  /// Unique identifier for the request.
  final int id;

  /// URL path parameters
  final String pathParams;

  final Map<String, String> header;

  final Object? body;

  /// Generates the complete request URL by combining the base URI and method-specific URI.
  String url(String uri) {
    String url = uri;
    if (url.endsWith("/")) {
      url = url.substring(0, url.length - 1);
    }

    return "$url$pathParams";
  }
}
