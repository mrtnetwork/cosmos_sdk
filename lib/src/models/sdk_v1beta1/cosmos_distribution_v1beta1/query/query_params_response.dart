import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/messages/params.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryParamsResponse is the response type for the Query/Params RPC method.
class DistributionQueryParamsResponse extends CosmosMessage {
  /// params defines the parameters of the module.
  final DistributionParams params;
  const DistributionQueryParamsResponse(this.params);
  factory DistributionQueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryParamsResponse(
        DistributionParams.deserialize(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params.toJson()};
  }

  @override
  String get typeUrl =>
      DistributionV1beta1Types.distributionQueryParamsResponse.typeUrl;

  @override
  List get values => [params];
}
