import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// TxEncodeAminoResponse is the response type for the Service.TxEncodeAmino RPC method.
/// Since: cosmos-sdk 0.47
class TxEncodeAminoResponse extends CosmosMessage {
  final List<int> aminoBinary;
  TxEncodeAminoResponse({required List<int> aminoBinary})
      : aminoBinary = BytesUtils.toBytes(aminoBinary, unmodifiable: true);
  factory TxEncodeAminoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return TxEncodeAminoResponse(aminoBinary: decode.getField(1));
  }

  factory TxEncodeAminoResponse.fromRpc(Map<String, dynamic> json) {
    return TxEncodeAminoResponse(
        aminoBinary: CosmosUtils.toBytes(json["amino_binary"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"amino_binary": CosmosUtils.toBase64(aminoBinary)};
  }

  @override
  TypeUrl get typeUrl => TxV1beta1Types.txEncodeAminoResponse;

  @override
  List get values => [aminoBinary];
}
