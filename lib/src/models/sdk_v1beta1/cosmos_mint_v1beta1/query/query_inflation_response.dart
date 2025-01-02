import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QueryInflationResponse is the response type for the Query/Inflation RPC method.
class QueryInflationResponse extends CosmosMessage {
  /// inflation is the current minting inflation value.
  final List<int> inflation;
  QueryInflationResponse({required List<int> inflation})
      : inflation = BytesUtils.toBytes(inflation, unmodifiable: true);
  factory QueryInflationResponse.fromRpc(Map<String, dynamic> json) {
    return QueryInflationResponse(
        inflation: CosmosUtils.toBytes(json["inflation"]));
  }
  factory QueryInflationResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryInflationResponse(inflation: decode.getField(1));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"inflation": CosmosUtils.toBase64(inflation)};
  }

  @override
  TypeUrl get typeUrl => MintV1beta1Types.queryInflationResponse;

  @override
  List get values => [inflation];
}
