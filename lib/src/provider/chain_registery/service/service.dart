import 'package:blockchain_utils/service/models/params.dart';
import 'package:cosmos_sdk/src/provider/chain_registery/core/core.dart';

typedef ChainRegistryResponse<T> = BaseServiceResponse<T>;

/// A mixin defining the service provider contract for interacting with the tendermint RPC.
mixin ChainRegistryServiceProvider
    implements BaseServiceProvider<ChainRegistryRequestRequestDetails> {
  /// Example:
  ///  @override
  ///   Future<`ChainRegistryResponse<T>`> doRequest<`T`>(ChainRegistryRequestRequestDetails params,
  ///       {Duration? timeout}) async {
  ///     final response = await client.get(params.toUri(url),
  ///         headers: {...params.headers}).timeout(timeout ?? defaultRequestTimeout);
  ///     return params.toResponse(response.bodyBytes, response.statusCode);
  ///   }
  @override
  Future<ChainRegistryResponse<T>> doRequest<T>(
      ChainRegistryRequestRequestDetails params,
      {Duration? timeout});
}
