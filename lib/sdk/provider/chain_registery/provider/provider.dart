import 'dart:async';
import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/sdk/provider/chain_registery/core/core.dart';

class ChainRegistryProvider<SERVICE extends IServiceProvider>
    implements IProvider<SERVICE, ChainRegistryRequestRequestDetails> {
  @override
  final SERVICE service;

  ChainRegistryProvider(this.service);

  static SERVICERESPONSE _findError<SERVICERESPONSE>({
    required IServiceRequest request,
    required BaseServiceResponse response,
    required ChainRegistryRequestRequestDetails params,
  }) {
    return params.toEncodingResponse<SERVICERESPONSE>(response);
  }

  @override
  Future<RESULT> request<RESULT, SERVICERESPONSE>(
    IServiceRequest<RESULT, SERVICERESPONSE, ChainRegistryRequestRequestDetails>
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

  @override
  Future<SERVICERESPONSE> requestDynamic<RESULT, SERVICERESPONSE>(
    IServiceRequest<RESULT, SERVICERESPONSE, ChainRegistryRequestRequestDetails>
    request, {
    Duration? timeout,
  }) async {
    final params = request.buildRequest(_id++);
    final response = await service.doRequest(params, timeout: timeout);
    return _findError<SERVICERESPONSE>(
      params: params,
      response: response,
      request: request,
    );
  }
}
