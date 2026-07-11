import 'dart:async';
import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/types/types.dart';

/// Facilitates communication with the tendermint by making requests using a provided [CosmosProvider].
class CosmosProvider<SERVICE extends IServiceProvider>
    implements
        IGrpcProvider<
          SERVICE,
          BaseCosmosServiceRequestParams,
          CosmosGrpcRequestDetails
        > {
  /// The underlying tendermint service provider used for network communication.
  @override
  final SERVICE service;

  /// Constructs a new [CosmosProvider] instance with the specified [service] service provider.
  CosmosProvider(this.service);

  static SERVICERESPONSE _findError<SERVICERESPONSE>({
    required IServiceRequest request,
    required BaseServiceResponse response,
    required CosmosServiceRequestParams params,
  }) {
    if (response.type == ServiceResponseType.error) {
      final error = response.cast<BaseServiceErrorResponse>();
      throw RPCError(
        message: error.findErrorMessage(),
        request: params.toJson(),
        relatedNetwork: BlockchainNetwork.cosmosAndRelated,
        statusCode: response.statusCode,
        errorCode: error.tryFineErrorCode(),
      );
    }

    final result = params.toEncodingResponse<Map<String, dynamic>>(response);
    if (params.api == CosmosProviderApi.rest) {
      if (result.hasValue("error")) {
        throw RPCError(
          message:
              result.valueAsString<String?>("message") ??
              result.valueAsString<String?>("error") ??
              ServiceProviderUtils.getDefaultError(response.statusCode),
          request: params.toJson(),
          relatedNetwork: BlockchainNetwork.cosmosAndRelated,
          statusCode: response.statusCode,
          errorCode: result.valueAsInt("code"),
        );
      }
      return ServiceProviderUtils.toResponse<SERVICERESPONSE>(
        object: result,
        params: params,
      );
    }
    return ServiceProviderUtils.toResponse<SERVICERESPONSE>(
      object: result["result"],
      params: params,
    );
  }

  /// Sends a request to the tendermint using the specified [request] parameter.
  ///
  /// The [timeout] parameter, if provided, sets the maximum duration for the request.
  @override
  Future<RESULT> request<RESULT, SERVICERESPONSE>(
    IServiceRequest<RESULT, SERVICERESPONSE, BaseCosmosServiceRequestParams>
    request, {
    Duration? timeout,
  }) async {
    final r = await requestDynamic<RESULT, SERVICERESPONSE>(
      request,
      timeout: timeout,
    );
    return request.onResonse(r);
  }

  int _id = 0;

  /// Sends a request to the tendermint using the specified [request] parameter.
  ///
  /// The [timeout] parameter, if provided, sets the maximum duration for the request.
  /// Whatever is received will be returned
  @override
  Future<SERVICERESPONSE> requestDynamic<RESULT, SERVICERESPONSE>(
    IServiceRequest<RESULT, SERVICERESPONSE, BaseCosmosServiceRequestParams>
    request, {
    Duration? timeout,
  }) async {
    switch (request) {
      case CosmosRestRequest request:
        final params = request.buildRequest(_id++);
        final response = await service.doRequest(params, timeout: timeout);
        return _findError<SERVICERESPONSE>(
          params: params,
          response: response,
          request: request,
        );
      case TendermintRequest request:
        final params = request.buildRequest(_id++);
        final response = await service.doRequest(params, timeout: timeout);
        return _findError<SERVICERESPONSE>(
          params: params,
          response: response,
          request: request,
        );
      case CosmosGrpcRequest request:
        final params = request.buildRequest(_id++);
        final response = await service.doGrpcRequest(params, timeout: timeout);
        return JsonParser.valueAs<SERVICERESPONSE>(response);
      default:
        throw ArgumentException.invalidOperationArguments(
          'requestDynamic',
          reason: "Unexpected request type ${request.runtimeType}. ",
        );
    }
  }

  @override
  Stream<RESULT> requestStream<RESULT>(
    IGRPCServiceRequest<RESULT, CosmosGrpcRequestDetails> request, {
    Duration? timeout,
  }) {
    final result = service.doGrpcRequestStream(
      request.buildRequest(0),
      timeout: timeout,
    );
    return result.map((e) => request.onResonse(e));
  }

  @override
  Future<List<RESULT>> requestOnce<RESULT>(
    IGRPCServiceRequest<RESULT, CosmosGrpcRequestDetails> request, {
    Duration? timeout,
  }) async {
    final result = requestStream<RESULT>(request, timeout: timeout);
    return await result.toList();
  }

  @override
  Future<Stream<RESULT>> requestStreamAsync<RESULT>(
    IGRPCServiceRequest<RESULT, CosmosGrpcRequestDetails> request, {
    Duration? timeout,
  }) async {
    final result = await service.doGrpcRequestStreamAsync(
      request.buildRequest(0),
      timeout: timeout,
    );
    return result.map((e) => request.onResonse(e));
  }

  @override
  Future<List<RESULT>> requestOnceAsync<RESULT>(
    IGRPCServiceRequest<RESULT, CosmosGrpcRequestDetails> request, {
    Duration? timeout,
  }) async {
    final result = await requestStreamAsync<RESULT>(request, timeout: timeout);
    return await result.toList();
  }
}
