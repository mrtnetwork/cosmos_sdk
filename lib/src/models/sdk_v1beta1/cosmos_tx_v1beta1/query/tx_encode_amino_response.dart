import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

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

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"amino_binary": BytesUtils.toHexString(aminoBinary)};
  }

  @override
  String get typeUrl => TxV1beta1Types.txEncodeAminoResponse.typeUrl;

  @override
  List get values => [aminoBinary];
}
