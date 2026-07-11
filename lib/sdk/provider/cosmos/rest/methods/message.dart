import 'package:blockchain_utils/service/grpc/src/http_request_builder.dart';
import 'package:blockchain_utils/service/models/params.dart';
import 'package:cosmos_sdk/sdk/serialization/src/protobuf.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';

class CosmosRestRequestMessage<Response extends CosmosProtoMessage>
    extends CosmosRestRequest<Response, Map<String, dynamic>> {
  final HttpRequestSpec spec;
  CosmosRestRequestMessage({required this.request})
    : spec = request.requestSpec();

  final ICosmosProtoQueryMessage<Response> request;
  @override
  String get path => spec.path;

  @override
  RequestMethod get requestMethod => spec.method;

  @override
  Map<String, dynamic> get body => spec.jsonBody ?? {};

  @override
  Map<String, dynamic> get parameters => spec.queryParameters;

  @override
  Response onResonse(Map<String, dynamic> result) {
    return request.onQueryResponseJson(result);
  }
}
