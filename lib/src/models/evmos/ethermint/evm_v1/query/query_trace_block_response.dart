import 'package:blockchain_utils/utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QueryTraceBlockResponse defines TraceBlock response
class EvmosEthermintEVMV1QueryTraceBlockResponse extends CosmosMessage {
  // data is the response serialized in bytes
  final List<int> data;
  const EvmosEthermintEVMV1QueryTraceBlockResponse(this.data);
  factory EvmosEthermintEVMV1QueryTraceBlockResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1QueryTraceBlockResponse(decode.getField(1));
  }
  factory EvmosEthermintEVMV1QueryTraceBlockResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return EvmosEthermintEVMV1QueryTraceBlockResponse(
      CosmosUtils.toBytes(json["data"]),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"data": BytesUtils.toHexString(data)};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.traceBlockResponse;

  @override
  List get values => [data];
}
