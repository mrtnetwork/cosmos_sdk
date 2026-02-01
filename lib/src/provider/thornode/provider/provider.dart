import 'dart:async';
import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/service/service.dart';

/// Facilitates communication with the tendermint by making requests using a provided [ThorNodeProvider].
class ThorNodeProvider implements BaseProvider<ThorNodeRequestDetails> {
  /// The underlying tendermint service provider used for network communication.
  final ThorNodeServiceProvider rpc;

  /// Constructs a new [ThorNodeProvider] instance with the specified [rpc] service provider.
  ThorNodeProvider(this.rpc);

  static SERVICERESPONSE _findError<SERVICERESPONSE>({
    required BaseServiceRequest request,
    required BaseServiceResponse<SERVICERESPONSE> response,
    required ThorNodeRequestDetails params,
  }) {
    final r = response.getResult(params);
    if (r is Map && r.containsKey("error")) {
      final errorCode = IntUtils.tryParse(r["code"]);
      final message = (r["error"] ?? r["message"])?.toString();
      throw RPCError(
        message: message ?? 'thornode request failed.',
        request: params.toJson(),
        errorCode: errorCode,
        details: {},
      );
    }
    return r;
  }

  /// Sends a request to the tendermint using the specified [request] parameter.
  ///
  /// The [timeout] parameter, if provided, sets the maximum duration for the request.
  @override
  Future<RESULT> request<RESULT, SERVICERESPONSE>(
    BaseServiceRequest<RESULT, SERVICERESPONSE, ThorNodeRequestDetails>
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
    BaseServiceRequest<RESULT, SERVICERESPONSE, ThorNodeRequestDetails>
    request, {
    Duration? timeout,
  }) async {
    final params = request.buildRequest(_id++);
    final response = await rpc.doRequest<SERVICERESPONSE>(
      params,
      timeout: timeout,
    );
    return _findError(params: params, response: response, request: request);
  }
}
