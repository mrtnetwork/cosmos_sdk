import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'msg_ethereum_tx_response.dart';

/// MsgEthereumTx encapsulates an Ethereum transaction as an SDK message.
class MsgEthereumTx extends CosmosMessage
    with ServiceMessage<MsgEthereumTxResponse> {
  /// data is inner transaction data of the Ethereum transaction
  final AnyMessage data;

  /// size is the encoded storage size of the transaction (DEPRECATED)
  final double? size;

  /// hash of the transaction in hex format
  final String hash;

  /// from is the ethereum signer address in hex format. This address value is checked
  /// against the address derived from the signature (V, R, S) using the
  /// secp256k1 elliptic curve
  final String from;
  factory MsgEthereumTx.fromRpc(Map<String, dynamic> json) {
    return MsgEthereumTx(
        data: AnyMessage.fromRpc(json["data"]),
        size: (json["size"] as num?)?.toDouble(),
        hash: json["hash"],
        from: json["from"]);
  }
  const MsgEthereumTx(
      {required this.data, this.size, required this.hash, required this.from});
  factory MsgEthereumTx.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgEthereumTx(
        data: decode
            .getResult(1)!
            .to<AnyMessage, List<int>>((e) => AnyMessage.deserialize(e)),
        hash: decode.getField(3),
        from: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {"data": data.toJson(), "size": size, "hash": hash, "from": from};
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.msgEthereumTx;

  @override
  List get values => [data, size, hash, from];

  @override
  MsgEthereumTxResponse onResponse(List<int> bytes) {
    return MsgEthereumTxResponse.deserialize(bytes);
  }

  @override
  TypeUrl get service => EvmV1Types.ethereumTx;

  @override
  List<String?> get signers => [from];
}
