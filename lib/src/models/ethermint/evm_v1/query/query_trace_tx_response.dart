import 'package:blockchain_utils/utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QueryTraceTxResponse defines TraceTx response
class EVMV1QueryTraceTxResponse extends CosmosMessage {
  // data is the response serialized in bytes
  final List<int> data;
  const EVMV1QueryTraceTxResponse(this.data);
  factory EVMV1QueryTraceTxResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1QueryTraceTxResponse(decode.getField(1));
  }
  factory EVMV1QueryTraceTxResponse.fromRpc(Map<String, dynamic> json) {
    return EVMV1QueryTraceTxResponse(CosmosUtils.toBytes(json["value"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"data": BytesUtils.toHexString(data)};
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.traceTxResponse;

  @override
  List get values => [data];
}
