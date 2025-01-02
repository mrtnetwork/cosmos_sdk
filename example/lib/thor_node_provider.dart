import 'package:blockchain_utils/service/models/params.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:http/http.dart' as http;

class ThornodeHTTPProvider implements ThorNodeServiceProvider {
  ThornodeHTTPProvider(
      {required this.url,
      http.Client? client,
      this.defaultRequestTimeout = const Duration(seconds: 30)})
      : client = client ?? http.Client();

  final String url;
  final http.Client client;
  final Duration defaultRequestTimeout;

  @override
  Future<BaseServiceResponse<T>> doRequest<T>(ThorNodeRequestDetails params,
      {Duration? timeout}) async {
    if (params.type.isPostRequest) {
      final response = await client
          .post(params.toUri(url),
              headers: {
                ...params.headers,
              },
              body: params.body())
          .timeout(timeout ?? defaultRequestTimeout);
      return params.toResponse(response.bodyBytes, response.statusCode);
    }
    final response = await client.get(params.toUri(url),
        headers: {...params.headers}).timeout(timeout ?? defaultRequestTimeout);
    return params.toResponse(response.bodyBytes, response.statusCode);
  }
}
