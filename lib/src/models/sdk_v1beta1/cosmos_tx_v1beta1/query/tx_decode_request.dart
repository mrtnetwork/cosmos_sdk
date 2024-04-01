import 'package:blockchain_utils/binary/utils.dart';
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
  String get queryPath => TxV1beta1Types.txDecode.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"tx_bytes": BytesUtils.toHexString(txBytes)};
  }

  @override
  String get typeUrl => TxV1beta1Types.txDecodeRequest.typeUrl;

  @override
  List get values => [txBytes];
  @override
  TxDecodeResponse onResponse(List<int> bytes) {
    return TxDecodeResponse.deserialize(bytes);
  }
}
