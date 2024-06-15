import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryCodeResponse is the response type for the Query/Code RPC method.
class IbcLightClientsWasmQueryCodeResponse extends CosmosMessage {
  final List<int>? data;
  IbcLightClientsWasmQueryCodeResponse({List<int>? data})
      : data = BytesUtils.tryToBytes(data, unmodifiable: true);
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
  String get typeUrl => IbcTypes.ibcLightClientsWasmQueryCodeResponse.typeUrl;

  @override
  List get values => [data];
}
