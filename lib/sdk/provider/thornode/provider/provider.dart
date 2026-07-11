import 'dart:async';
import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/sdk/provider/thornode/core/core.dart';

/// Facilitates communication with the tendermint by making requests using a provided [ThorNodeProvider].
class ThorNodeProvider<SERVICE extends IServiceProvider>
    implements IProvider<SERVICE, ThorNodeRequestDetails> {
  /// The underlying tendermint service provider used for network communication.
  @override
  final SERVICE service;

  ThorNodeProvider(this.service);

  static SERVICERESPONSE _findError<SERVICERESPONSE>({
    required IServiceRequest request,
    required BaseServiceResponse response,
    required ThorNodeRequestDetails params,
  }) {
    if (response.type == ServiceResponseType.error) {
      final error = response.cast<BaseServiceErrorResponse>();
      if (!error.validate) throw error.defaultError();
      final toJson = error.tryToJson();
      throw RPCError(
        message: toJson?.valueAsString("message") ?? ServiceConst.defaultError,
        request: params.toJson(),
        errorCode: toJson?.valueAsInt("code"),
        jsonRpcErrpr: toJson,
        relatedNetwork: BlockchainNetwork.cosmosAndRelated,
      );
    }
    return params.toEncodingResponse(response);
  }

  /// Sends a request to the tendermint using the specified [request] parameter.
  ///
  /// The [timeout] parameter, if provided, sets the maximum duration for the request.
  @override
  Future<RESULT> request<RESULT, SERVICERESPONSE>(
    IServiceRequest<RESULT, SERVICERESPONSE, ThorNodeRequestDetails> request, {
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
    IServiceRequest<RESULT, SERVICERESPONSE, ThorNodeRequestDetails> request, {
    Duration? timeout,
  }) async {
    final params = request.buildRequest(_id++);
    final response = await service.doRequest(params, timeout: timeout);
    return _findError(params: params, response: response, request: request);
  }
}
