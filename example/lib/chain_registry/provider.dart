import 'package:blockchain_utils/service/service.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:http/http.dart' as http;

class ChainRegistryHTTPProvider implements ChainRegistryServiceProvider {
  ChainRegistryHTTPProvider(
      {this.url = CCRConst.chainRegisteryUri,
      http.Client? client,
      this.defaultRequestTimeout = const Duration(seconds: 30)})
      : client = client ?? http.Client();

  final String url;
  final http.Client client;
  final Duration defaultRequestTimeout;

  @override
  Future<BaseServiceResponse<T>> doRequest<T>(
      ChainRegistryRequestRequestDetails params,
      {Duration? timeout}) async {
    final uri = params.toUri(url);
    final response = await client.get(uri,
        headers: {...params.headers}).timeout(timeout ?? defaultRequestTimeout);
    return params.parseResponse(response.bodyBytes, response.statusCode);
  }
}
