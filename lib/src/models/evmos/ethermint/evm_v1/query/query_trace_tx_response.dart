import 'package:blockchain_utils/utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QueryTraceTxResponse defines TraceTx response
class EvmosEthermintEVMV1QueryTraceTxResponse extends CosmosMessage {
  // data is the response serialized in bytes
  final List<int> data;
  const EvmosEthermintEVMV1QueryTraceTxResponse(this.data);
  factory EvmosEthermintEVMV1QueryTraceTxResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1QueryTraceTxResponse(decode.getField(1));
  }
  factory EvmosEthermintEVMV1QueryTraceTxResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return EvmosEthermintEVMV1QueryTraceTxResponse(
      CosmosUtils.toBytes(json["value"]),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"data": BytesUtils.toHexString(data)};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.traceTxResponse;

  @override
  List get values => [data];
}
