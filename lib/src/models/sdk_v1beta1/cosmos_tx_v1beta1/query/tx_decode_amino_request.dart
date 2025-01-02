import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/query/tx_decode_amino_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// TxDecodeAminoRequest is the request type for the Service.TxDecodeAmino RPC method.
/// Since: cosmos-sdk 0.47
class TxDecodeAminoRequest extends CosmosMessage
    with QueryMessage<TxDecodeAminoResponse> {
  final List<int> aminoBinary;
  TxDecodeAminoRequest({required List<int> aminoBinary})
      : aminoBinary = BytesUtils.toBytes(aminoBinary, unmodifiable: true);

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"amino_binary": BytesUtils.toHexString(aminoBinary)};
  }

  @override
  TypeUrl get typeUrl => TxV1beta1Types.txDecodeAminoRequest;

  @override
  List get values => [aminoBinary];

  @override
  TxDecodeAminoResponse onResponse(List<int> bytes) {
    return TxDecodeAminoResponse.deserialize(bytes);
  }

  @override
  TxDecodeAminoResponse onJsonResponse(Map<String, dynamic> json) {
    throw UnimplementedError();
  }
}
