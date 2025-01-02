import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/messages/broadcast_mode.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/query/broadcast_tx_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// BroadcastTxRequest is the request type for the Service.BroadcastTxRequest RPC method.
class BroadcastTxRequest extends CosmosMessage
    with QueryMessage<BroadcastTxResponse> {
  /// tx_bytes is the raw transaction.
  final List<int> txBytes;
  final BroadcastMode? mode;
  BroadcastTxRequest({required List<int> txBytes, this.mode})
      : txBytes = BytesUtils.toBytes(txBytes, unmodifiable: true);

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"tx_bytes": BytesUtils.toHexString(txBytes), "mode": mode?.value};
  }

  @override
  TypeUrl get typeUrl => TxV1beta1Types.broadcastTxRequest;

  @override
  List get values => [txBytes, mode?.value];

  @override
  Map<String, dynamic> get body => toJson();
  @override
  BroadcastTxResponse onResponse(List<int> bytes) {
    return BroadcastTxResponse.deserialize(bytes);
  }

  @override
  BroadcastTxResponse onJsonResponse(Map<String, dynamic> json) {
    return BroadcastTxResponse.fromRpc(json);
  }
}
