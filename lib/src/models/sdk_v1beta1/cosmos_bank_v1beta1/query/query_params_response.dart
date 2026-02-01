import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/messages/params.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';

/// QueryParamsResponse defines the response type for querying x/bank parameters.
class QueryParamsResponse extends CosmosMessage {
  /// params provides the parameters of the bank module.
  final BankParams params;

  const QueryParamsResponse({required this.params});
  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryParamsResponse(
      params: BankParams.deserialize(decode.getField(1)),
    );
  }
  factory QueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryParamsResponse(params: BankParams.fromJson(json["params"]));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params.toJson()};
  }

  @override
  TypeUrl get typeUrl => BankV1beta1Types.paramsResponse;

  @override
  List get values => [params];
}
