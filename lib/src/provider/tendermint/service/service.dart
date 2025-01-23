import 'package:blockchain_utils/service/models/params.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';

typedef TendermintServiceResponse<T> = BaseServiceResponse<T>;

/// A mixin defining the service provider contract for interacting with the tendermint RPC.
mixin TendermintServiceProvider
    implements BaseServiceProvider<TendermintRequestDetails> {
  /// Example:
  ///  @override
  ///   Future<`TendermintServiceResponse<T>`> doRequest<`T`>(TendermintRequestDetails params,
  ///       {Duration? timeout}) async {
  ///     if (params.type.isPostRequest) {
  ///       final response = await client
  ///           .post(params.toUri(url),
  ///               headers: {
  ///                 ...params.headers,
  ///               },
  ///               body: params.body())
  ///           .timeout(timeout ?? defaultRequestTimeout);
  ///       return params.toResponse(response.bodyBytes, response.statusCode);
  ///     }
  ///     final response = await client.get(params.toUri(url),
  ///         headers: {...params.headers}).timeout(timeout ?? defaultRequestTimeout);
  ///     return params.toResponse(response.bodyBytes, response.statusCode);
  ///   }
  @override
  Future<TendermintServiceResponse<T>> doRequest<T>(
      TendermintRequestDetails params,
      {Duration? timeout});
}
