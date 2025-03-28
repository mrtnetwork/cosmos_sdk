import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/query/tx_encode_amino_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// TxEncodeAminoRequest is the request type for the Service.TxEncodeAmino RPC method.
///
// Since: cosmos-sdk 0.47
class TxEncodeAminoRequest extends CosmosMessage
    with QueryMessage<TxEncodeAminoResponse> {
  final String aminoJson;
  const TxEncodeAminoRequest(this.aminoJson);
  factory TxEncodeAminoRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return TxEncodeAminoRequest(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"amino_json": aminoJson};
  }

  @override
  Map<String, dynamic> get body => toJson();
  @override
  TypeUrl get typeUrl => TxV1beta1Types.txEncodeAminoRequest;

  @override
  List get values => [aminoJson];

  @override
  TxEncodeAminoResponse onResponse(List<int> bytes) {
    return TxEncodeAminoResponse.deserialize(bytes);
  }

  @override
  TxEncodeAminoResponse onJsonResponse(Map<String, dynamic> json) {
    return TxEncodeAminoResponse.fromJson(json);
  }
}
