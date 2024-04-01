import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';

/// A mixin defining the service provider contract for interacting with the tendermint RPC.
mixin TendermintServiceProvider {
  /// The base URL of the tendermint RPC endpoint.
  String get url;

  /// Makes an HTTP POST request to the tendermint with the specified [params].
  ///
  /// The optional [timeout] parameter sets the maximum duration for the request.
  Future<dynamic> post(TendermintRequestDetails params, [Duration? timeout]);

  /// Makes an HTTP GET request to the tendermint with the specified [params].
  ///
  /// The optional [timeout] parameter sets the maximum duration for the request.
  Future<Map<String, dynamic>> get(TendermintRequestDetails params,
      [Duration? timeout]);
}
