import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QueryCodeResponse is the response type for the Query/Code RPC method.
class IbcLightClientsWasmQueryCodeResponse extends CosmosMessage {
  final List<int>? data;
  IbcLightClientsWasmQueryCodeResponse({List<int>? data})
      : data = BytesUtils.tryToBytes(data, unmodifiable: true);
  factory IbcLightClientsWasmQueryCodeResponse.fromJson(
      Map<String, dynamic> json) {
    return IbcLightClientsWasmQueryCodeResponse(
        data: CosmosUtils.tryToBytes(json["data"]));
  }
  factory IbcLightClientsWasmQueryCodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcLightClientsWasmQueryCodeResponse(data: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"data": BytesUtils.tryToHexString(data)};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcLightClientsWasmQueryCodeResponse;

  @override
  List get values => [data];
}
