import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/query/query_params_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryParamsRequest is the request type for the Query/Params RPC method.
class QueryMintParamsRequest extends CosmosMessage
    with QueryMessage<QueryMintParamsResponse> {
  ///  This message has no fields.
  const QueryMintParamsRequest();

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl => MintV1beta1Types.queryMintParamsRequest.typeUrl;

  @override
  List get values => [];

  @override
  String get queryPath => MintV1beta1Types.queryMintParams.typeUrl;

  @override
  QueryMintParamsResponse onResponse(List<int> bytes) {
    return QueryMintParamsResponse.deserialize(bytes);
  }
}
