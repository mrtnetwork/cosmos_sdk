import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';

/// A mixin defining the service provider contract for interacting with the tendermint RPC.
mixin ThorNodeServiceProvider {
  /// The base URL of the tendermint RPC endpoint.
  String get url;

  /// Makes an HTTP POST request to the tendermint with the specified [params].
  ///
  /// The optional [timeout] parameter sets the maximum duration for the request.
  Future<dynamic> post(ThorNodeRequestDetails params, [Duration? timeout]);

  /// Makes an HTTP GET request to the tendermint with the specified [params].
  ///
  /// The optional [timeout] parameter sets the maximum duration for the request.
  Future<dynamic> get(ThorNodeRequestDetails params, [Duration? timeout]);
}
