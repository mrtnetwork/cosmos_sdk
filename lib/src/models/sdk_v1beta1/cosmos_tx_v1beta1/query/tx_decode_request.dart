import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/query/tx_decode_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// TxDecodeRequest is the request type for the Service.TxDecode RPC method.
/// Since: cosmos-sdk 0.47
class TxDecodeRequest extends CosmosMessage
    with QueryMessage<TxDecodeResponse> {
  /// tx_bytes is the raw transaction.
  final List<int> txBytes;
  TxDecodeRequest({required List<int> txBytes})
      : txBytes = BytesUtils.toBytes(txBytes, unmodifiable: true);

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"tx_bytes": BytesUtils.toHexString(txBytes)};
  }

  @override
  TypeUrl get typeUrl => TxV1beta1Types.txDecodeRequest;

  @override
  Map<String, dynamic> get body => toJson();

  @override
  List get values => [txBytes];
  @override
  TxDecodeResponse onResponse(List<int> bytes) {
    return TxDecodeResponse.deserialize(bytes);
  }

  @override
  TxDecodeResponse onJsonResponse(Map<String, dynamic> json) {
    return TxDecodeResponse.fromJson(json);
  }
}
