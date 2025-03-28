import 'package:blockchain_utils/service/service.dart';

abstract class ChainRegistryRequest<RESULT, RESPONSE>
    extends BaseServiceRequest<RESULT, RESPONSE,
        ChainRegistryRequestRequestDetails> {
  ChainRegistryRequest();

  List<String?> get pathParameters => [];

  Map<String, String?> get parameters => {};

  @override
  ChainRegistryRequestRequestDetails buildRequest(int requestID) {
    Uri params =
        Uri(pathSegments: pathParameters.where((e) => e != null).cast());
    final queryParameters = Map<String, String>.from(
        parameters..removeWhere((key, value) => value == null));
    if (queryParameters.isNotEmpty) {
      params = params.replace(queryParameters: queryParameters);
    }
    return ChainRegistryRequestRequestDetails(
        requestID: requestID, pathParams: params.normalizePath().toString());
  }

  @override
  RequestServiceType get requestType => RequestServiceType.get;
}

class ChainRegistryRequestRequestDetails extends BaseServiceRequestParams {
  /// Constructs a new [ChainRegistryRequestRequestDetails] instance with the specified parameters.
  const ChainRegistryRequestRequestDetails({
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
    if (!url.endsWith("/")) {
      url = "$url/";
    }
    return Uri.parse("$url$pathParams");
  }
}
