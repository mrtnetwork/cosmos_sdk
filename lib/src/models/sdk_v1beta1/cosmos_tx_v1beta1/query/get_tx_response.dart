import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/messages/tx.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_abci_v1beta1/messages/tx_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GetTxResponse is the response type for the Service.GetTx method.
class GetTxResponse extends CosmosMessage {
  /// tx is the queried transaction.
  final Tx tx;

  /// tx_response is the queried TxResponses.
  final TxResponse txResponse;
  const GetTxResponse({required this.tx, required this.txResponse});
  factory GetTxResponse.fromJson(Map<String, dynamic> json) {
    return GetTxResponse(
      tx: Tx.fromJson(json["tx"]),
      txResponse: TxResponse.fromJson(json["tx_response"]),
    );
  }
  factory GetTxResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GetTxResponse(
      tx: Tx.deserialize(decode.getField(1)),
      txResponse: TxResponse.deserialize(decode.getField(2)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"tx": tx.toJson(), "tx_response": txResponse.toJson()};
  }

  @override
  TypeUrl get typeUrl => TxV1beta1Types.getTxResponse;

  @override
  List get values => [tx, txResponse];
}
