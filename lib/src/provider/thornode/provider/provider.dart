import 'dart:async';
import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/exception/exception.dart';
import 'package:cosmos_sdk/src/provider/thornode/service/service.dart';

/// Facilitates communication with the tendermint by making requests using a provided [ThorNodeProvider].
class ThorNodeProvider {
  /// The underlying tendermint service provider used for network communication.
  final ThorNodeServiceProvider rpc;

  /// Constructs a new [ThorNodeProvider] instance with the specified [rpc] service provider.
  ThorNodeProvider(this.rpc);

  int _id = 0;

  /// Sends a request to the tendermint using the specified [request] parameter.
  ///
  /// The [timeout] parameter, if provided, sets the maximum duration for the request.
  /// Whatever is received will be returned
  Future<dynamic> requestDynamic(ThorNodeRequestParam request,
      [Duration? timeout]) async {
    final id = ++_id;
    final params = request.toRequest(id);
    final data = await rpc.get(params, timeout);
    _findError(data);
    return data;
  }

  static void _findError(dynamic val) {
    if (val is Map && val.containsKey("error")) {
      throw ThorNodeApiException(val["error"]);
    }
  }

  /// Sends a request to the tendermint using the specified [request] parameter.
  ///
  /// The [timeout] parameter, if provided, sets the maximum duration for the request.
  Future<T> request<T, E>(ThorNodeRequestParam<T, E> request,
      [Duration? timeout]) async {
    final data = await requestDynamic(request, timeout);
    final Object? result;
    if (E == List<Map<String, dynamic>>) {
      result = (data as List).map((e) => Map<String, dynamic>.from(e)).toList();
    } else {
      result = data;
    }
    return request.onResonse(result as E);
  }
}
