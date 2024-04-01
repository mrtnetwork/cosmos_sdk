import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryInflationResponse is the response type for the Query/Inflation RPC method.
class QueryInflationResponse extends CosmosMessage {
  /// inflation is the current minting inflation value.
  final List<int> inflation;
  QueryInflationResponse({required List<int> inflation})
      : inflation = BytesUtils.toBytes(inflation, unmodifiable: true);
  factory QueryInflationResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryInflationResponse(inflation: decode.getField(1));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"inflation": BytesUtils.toHexString(inflation)};
  }

  @override
  String get typeUrl => MintV1beta1Types.queryInflationResponse.typeUrl;

  @override
  List get values => [inflation];
}
