import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// TxEncodeResponse is the response type for the Service.TxEncode method.
/// Since: cosmos-sdk 0.47
class TxEncodeResponse extends CosmosMessage {
  /// tx_bytes is the encoded transaction bytes.
  final List<int> txBytes;
  TxEncodeResponse({required List<int> txBytes})
      : txBytes = BytesUtils.toBytes(txBytes, unmodifiable: true);

  factory TxEncodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return TxEncodeResponse(txBytes: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"tx_bytes": BytesUtils.toHexString(txBytes)};
  }

  @override
  String get typeUrl => TxV1beta1Types.txEncodeResponse.typeUrl;

  @override
  List get values => [txBytes];
}
