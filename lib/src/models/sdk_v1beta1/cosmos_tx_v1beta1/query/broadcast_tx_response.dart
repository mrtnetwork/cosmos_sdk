import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_abci_v1beta1/messages/tx_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// BroadcastTxResponse is the response type for the Service.BroadcastTx method.
class BroadcastTxResponse extends CosmosMessage {
  /// tx_response is the queried TxResponses.
  final TxResponse txResponse;
  const BroadcastTxResponse({required this.txResponse});
  factory BroadcastTxResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return BroadcastTxResponse(
        txResponse: TxResponse.deserialize(decode.getField(1)));
  }
  factory BroadcastTxResponse.fromRpc(Map<String, dynamic> json) {
    return BroadcastTxResponse(
        txResponse: TxResponse.fromRpc(json["tx_response"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"tx_response": txResponse.toJson()};
  }

  @override
  TypeUrl get typeUrl => TxV1beta1Types.broadcastTxResponse;

  @override
  List get values => [txResponse];
}
