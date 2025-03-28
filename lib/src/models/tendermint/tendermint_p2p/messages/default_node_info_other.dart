import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class DefaultNodeInfoOther extends CosmosMessage {
  final String? txIndex;
  final String? rpcAddress;
  const DefaultNodeInfoOther({this.txIndex, this.rpcAddress});
  factory DefaultNodeInfoOther.fromJson(Map<String, dynamic> json) {
    return DefaultNodeInfoOther(
        rpcAddress: json["rpc_address"], txIndex: json["tx_index"]);
  }
  factory DefaultNodeInfoOther.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DefaultNodeInfoOther(
        txIndex: decode.getField(1), rpcAddress: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"tx_index": txIndex, "rpc_address": rpcAddress};
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.defaultNodeInfoOther;

  @override
  List get values => [txIndex, rpcAddress];
}
