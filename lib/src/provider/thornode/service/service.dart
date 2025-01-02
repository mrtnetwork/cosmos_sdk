import 'package:blockchain_utils/service/models/params.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';

typedef ThorNodeServiceResponse<T> = BaseServiceResponse<T>;

/// A mixin defining the service provider contract for interacting with the thornode network.
mixin ThorNodeServiceProvider
    implements BaseServiceProvider<ThorNodeRequestDetails> {
  // Future<ThorNodeServiceResponse<T>> doRequest<T>(ThorNodeRequestDetails params,
  //     {Duration? timeout}) async {
  //   final uri = params.toUri(url);
  //   if (params.type.isPostRequest) {
  //     final response = await client
  //         .post(uri, headers: params.headers, body: params.body())
  //         .timeout(timeout ?? defaultRequestTimeout);
  //     return params.toResponse(response.bodyBytes, response.statusCode);
  //   }
  //   final response = await client.get(uri,
  //       headers: {...params.headers}).timeout(timeout ?? defaultRequestTimeout);
  //   return params.toResponse(response.bodyBytes, response.statusCode);
  // }
  @override
  Future<BaseServiceResponse<T>> doRequest<T>(ThorNodeRequestDetails params,
      {Duration? timeout});
}
