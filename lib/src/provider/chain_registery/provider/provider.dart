import 'dart:async';
import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/provider/chain_registery/core/core.dart';
import 'package:cosmos_sdk/src/provider/chain_registery/service/service.dart';

class ChainRegistryProvider
    implements BaseProvider<ChainRegistryRequestRequestDetails> {
  final ChainRegistryServiceProvider rpc;

  ChainRegistryProvider(this.rpc);

  static SERVICERESPONSE _findError<SERVICERESPONSE>({
    required BaseServiceRequest request,
    required BaseServiceResponse<SERVICERESPONSE> response,
    required ChainRegistryRequestRequestDetails params,
  }) {
    final r = response.getResult(params);
    return ServiceProviderUtils.parseResponse(object: r, params: params);
  }

  @override
  Future<RESULT> request<RESULT, SERVICERESPONSE>(
    BaseServiceRequest<
      RESULT,
      SERVICERESPONSE,
      ChainRegistryRequestRequestDetails
    >
    request, {
    Duration? timeout,
  }) async {
    final r = await requestDynamic(request, timeout: timeout);
    return request.onResonse(r);
  }

  int _id = 0;

  @override
  Future<SERVICERESPONSE> requestDynamic<RESULT, SERVICERESPONSE>(
    BaseServiceRequest<
      RESULT,
      SERVICERESPONSE,
      ChainRegistryRequestRequestDetails
    >
    request, {
    Duration? timeout,
  }) async {
    final params = request.buildRequest(_id++);
    final response = await rpc.doRequest<SERVICERESPONSE>(
      params,
      timeout: timeout,
    );
    return _findError<SERVICERESPONSE>(
      params: params,
      response: response,
      request: request,
    );
  }
}
