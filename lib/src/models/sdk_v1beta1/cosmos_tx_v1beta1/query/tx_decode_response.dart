import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/messages/tx.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// TxDecodeResponse is the response type for the Service.TxDecode method.
///
// Since: cosmos-sdk 0.47
class TxDecodeResponse extends CosmosMessage {
  /// tx is the decoded transaction.
  final Tx tx;
  const TxDecodeResponse(this.tx);
  factory TxDecodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return TxDecodeResponse(Tx.deserialize(decode.getField(1)));
  }
  factory TxDecodeResponse.fromJson(Map<String, dynamic> json) {
    return TxDecodeResponse(Tx.fromJson(json["tx"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"tx": tx.toJson()};
  }

  @override
  TypeUrl get typeUrl => TxV1beta1Types.txDecodeResponse;

  @override
  List get values => [tx];
}
