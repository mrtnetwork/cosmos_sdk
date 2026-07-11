import 'package:cosmos_sdk/sdk/serialization/src/protobuf.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';

class CosmosGrpcRequestMessage<Response extends CosmosProtoMessage>
    extends CosmosGrpcRequest<Response> {
  CosmosGrpcRequestMessage({required this.request});

  final ICosmosProtoQueryMessage<Response> request;

  @override
  List<int> toBuffer() {
    return request.toBuffer();
  }

  @override
  String get method => request.declarationId.getServiceUrl();

  @override
  Response onResonse(List<int> result) {
    return request.onQueryResponse(result);
  }
}
