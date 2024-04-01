import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/query/tx_encode_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/messages/tx.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// TxEncodeRequest is the request type for the Service.TxEncode RPC method.
///
// Since: cosmos-sdk 0.47
class TxEncodeRequest extends CosmosMessage
    with QueryMessage<TxEncodeResponse> {
  /// tx is the transaction to encode.
  final Tx tx;
  const TxEncodeRequest(this.tx);
  factory TxEncodeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return TxEncodeRequest(Tx.deserialize(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"tx": tx.toJson()};
  }

  @override
  String get typeUrl => TxV1beta1Types.txEncodeRequest.typeUrl;

  @override
  List get values => [tx];

  @override
  String get queryPath => TxV1beta1Types.txEncode.typeUrl;

  @override
  TxEncodeResponse onResponse(List<int> bytes) {
    return TxEncodeResponse.deserialize(bytes);
  }
}
