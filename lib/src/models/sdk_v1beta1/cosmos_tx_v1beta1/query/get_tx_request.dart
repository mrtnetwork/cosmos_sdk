import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/query/get_tx_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GetTx fetches a tx by hash.
class GetTxRequest extends CosmosMessage with QueryMessage<GetTxResponse> {
  /// hash is the tx hash to query, encoded as a hex string.
  final String hash;
  const GetTxRequest(this.hash);
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"hash": hash};
  }

  @override
  TypeUrl get typeUrl => TxV1beta1Types.getTxRequest;

  @override
  List get values => [hash];

  @override
  GetTxResponse onResponse(List<int> bytes) {
    print("got bytes ? $bytes");
    return GetTxResponse.deserialize(bytes);
  }

  @override
  GetTxResponse onJsonResponse(Map<String, dynamic> json) {
    return GetTxResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [hash];
}
