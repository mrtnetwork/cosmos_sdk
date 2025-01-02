import 'package:blockchain_utils/utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QueryTraceBlockResponse defines TraceBlock response
class EVMV1QueryTraceBlockResponse extends CosmosMessage {
  // data is the response serialized in bytes
  final List<int> data;
  const EVMV1QueryTraceBlockResponse(this.data);
  factory EVMV1QueryTraceBlockResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1QueryTraceBlockResponse(decode.getField(1));
  }
  factory EVMV1QueryTraceBlockResponse.fromRpc(Map<String, dynamic> json) {
    return EVMV1QueryTraceBlockResponse(CosmosUtils.toBytes(json["data"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"data": BytesUtils.toHexString(data)};
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.traceBlockResponse;

  @override
  List get values => [data];
}
