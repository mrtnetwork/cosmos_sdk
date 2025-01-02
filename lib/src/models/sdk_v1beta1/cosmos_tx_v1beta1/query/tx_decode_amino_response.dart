import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// TxDecodeAminoResponse is the response type for the Service.TxDecodeAmino RPC method.
///
// Since: cosmos-sdk 0.47
class TxDecodeAminoResponse extends CosmosMessage {
  final String aminoJson;
  const TxDecodeAminoResponse(this.aminoJson);
  factory TxDecodeAminoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return TxDecodeAminoResponse(decode.getField(1));
  }
  factory TxDecodeAminoResponse.fromRpc(Map<String, dynamic> json) {
    return TxDecodeAminoResponse(json["amino_json"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"amino_json": aminoJson};
  }

  @override
  TypeUrl get typeUrl => TxV1beta1Types.txDecodeAminoResponse;

  @override
  List get values => [aminoJson];
}
