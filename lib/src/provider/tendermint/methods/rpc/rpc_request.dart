import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';

class TendermintRequestRPCMessage<Response>
    extends TendermintRequestParam<Response, Map<String, dynamic>> {
  TendermintRequestRPCMessage({required this.request});

  final RPCMessage<Response> request;

  /// Query the application for some information.
  @override
  String get method => request.rpcPath;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => request.queryParameters;
  @override
  Response onResonse(Map<String, dynamic> result) {
    return request.onJsonResponse(result);
  }
}
