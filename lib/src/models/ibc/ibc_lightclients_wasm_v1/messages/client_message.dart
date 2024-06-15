import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Wasm light client message (either header(s) or misbehaviour)
class IbcLightClientsWasmClientMessage extends CosmosMessage {
  final List<int>? data;
  IbcLightClientsWasmClientMessage({List<int>? data})
      : data = BytesUtils.tryToBytes(data);
  factory IbcLightClientsWasmClientMessage.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcLightClientsWasmClientMessage(data: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"data": BytesUtils.tryToHexString(data)};
  }

  @override
  String get typeUrl => IbcTypes.ibcLightClientsWasmClientMessage.typeUrl;

  @override
  List get values => [data];
}
