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
  String get queryPath => TxV1beta1Types.getTx.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"hash": hash};
  }

  @override
  String get typeUrl => TxV1beta1Types.getTxRequest.typeUrl;

  @override
  List get values => [hash];

  @override
  GetTxResponse onResponse(List<int> bytes) {
    return GetTxResponse.deserialize(bytes);
  }
}
