import 'dart:async';

import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/methods/rpc/rpc_request.dart';
import 'package:cosmos_sdk/src/provider/tendermint/service/service.dart';

/// Facilitates communication with the tendermint by making requests using a provided [TendermintProvider].
class TendermintProvider {
  /// The underlying tendermint service provider used for network communication.
  final TendermintServiceProvider rpc;

  /// Constructs a new [TendermintProvider] instance with the specified [rpc] service provider.
  TendermintProvider(this.rpc);

  int _id = 0;

  static dynamic _findError(TendermintRequestParam request, dynamic val) {
    if (val is Map) {
      if (request is TendermintRequestRPCMessage) {
        if (val.containsKey("code") && val.containsKey("message")) {
          throw RPCError(
              message: val["message"]!.toString(),
              errorCode: int.tryParse(val["code"]?.toString() ?? "0") ?? 0,
              data: val,
              request: {});
        }
        return val;
      } else {
        if (val.containsKey("error")) {
          throw RPCError(
              message: val["error"]!.toString(),
              errorCode: int.tryParse(val["code"] ?? "0") ?? 0,
              data: val,
              request: {});
        }
        return val["result"];
      }
    }
    return val;
  }

  /// Sends a request to the tendermint using the specified [request] parameter.
  ///
  /// The [timeout] parameter, if provided, sets the maximum duration for the request.
  /// Whatever is received will be returned
  Future<dynamic> requestDynamic(TendermintRequestParam request,
      [Duration? timeout]) async {
    final id = ++_id;
    final params = request.toRequest(id);
    final data = await rpc.get(params, timeout);
    return _findError(request, data);
  }

  /// Sends a request to the tendermint using the specified [request] parameter.
  ///
  /// The [timeout] parameter, if provided, sets the maximum duration for the request.
  Future<T> request<T, E>(TendermintRequestParam<T, E> request,
      [Duration? timeout]) async {
    final data = await requestDynamic(request, timeout);
    print("data $data");
    final Object? result;
    if (E == List<Map<String, dynamic>>) {
      result = (data as List).map((e) => Map<String, dynamic>.from(e)).toList();
    } else {
      result = data;
    }
    return request.onResonse(result as E);
  }
}
