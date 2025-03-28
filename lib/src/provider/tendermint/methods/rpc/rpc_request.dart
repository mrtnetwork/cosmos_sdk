import 'package:blockchain_utils/service/models/params.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

class TendermintRequestRPCMessage<Response>
    extends TendermintRequest<Response, Map<String, dynamic>> {
  TendermintRequestRPCMessage({required this.request});

  final QueryMessage<Response> request;
  String rpcUrl({List<dynamic> pathParameters = const []}) {
    final paths = CosmosUtils.extractParams(request.typeUrl.rpc!);
    String params = request.typeUrl.rpc!;
    for (int i = 0; i < pathParameters.length; i++) {
      params = params.replaceFirst(paths[i], pathParameters[i].toString());
    }
    return params;
  }

  /// Query the application for some information.
  @override
  String get method => rpcUrl(pathParameters: request.pathParameters);

  @override
  RequestServiceType get requestType => request.typeUrl.method;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, dynamic> get body => request.body;

  @override
  Map<String, String?> get parameters => request.queryParameters;
  @override
  Response onResonse(Map<String, dynamic> result) {
    return request.onJsonResponse(result);
  }
}
