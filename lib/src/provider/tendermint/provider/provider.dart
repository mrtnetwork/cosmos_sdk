import 'dart:async';
import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/service/service.dart';

/// Facilitates communication with the tendermint by making requests using a provided [TendermintProvider].
class TendermintProvider implements BaseProvider<TendermintRequestDetails> {
  /// The underlying tendermint service provider used for network communication.
  final TendermintServiceProvider rpc;

  /// Constructs a new [TendermintProvider] instance with the specified [rpc] service provider.
  TendermintProvider(this.rpc);

  static SERVICERESPONSE _findError<SERVICERESPONSE>({
    required BaseServiceRequest request,
    required BaseServiceResponse<Map<String, dynamic>> response,
    required TendermintRequestDetails params,
  }) {
    final r = response.getResult(params);
    if (r.containsKey("code") || r.containsKey("error")) {
      final errorCode = IntUtils.tryParse(r["code"]);
      final message = (r["error"] ?? r["message"])?.toString();
      throw RPCError(
        message: message ?? 'tendermint request failed.',
        request: params.toJson(),
        errorCode: errorCode,
        details: {},
      );
    }
    return ServiceProviderUtils.parseResponse(
      object: r["result"] ?? r,
      params: params,
    );
  }

  /// Sends a request to the tendermint using the specified [request] parameter.
  ///
  /// The [timeout] parameter, if provided, sets the maximum duration for the request.
  @override
  Future<RESULT> request<RESULT, SERVICERESPONSE>(
    BaseServiceRequest<RESULT, SERVICERESPONSE, TendermintRequestDetails>
    request, {
    Duration? timeout,
  }) async {
    final r = await requestDynamic(request, timeout: timeout);
    return request.onResonse(r);
  }

  int _id = 0;

  /// Sends a request to the tendermint using the specified [request] parameter.
  ///
  /// The [timeout] parameter, if provided, sets the maximum duration for the request.
  /// Whatever is received will be returned
  @override
  Future<SERVICERESPONSE> requestDynamic<RESULT, SERVICERESPONSE>(
    BaseServiceRequest<RESULT, SERVICERESPONSE, TendermintRequestDetails>
    request, {
    Duration? timeout,
  }) async {
    final params = request.buildRequest(_id++);
    final response = await rpc.doRequest<Map<String, dynamic>>(
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
