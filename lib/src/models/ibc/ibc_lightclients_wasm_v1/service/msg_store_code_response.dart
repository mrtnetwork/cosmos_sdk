import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgStoreCodeResponse defines the response type for the StoreCode rpc
class IbcLightClientsWasmMsgStoreCodeResponse extends CosmosMessage {
  /// checksum is the sha256 hash of the stored code
  final List<int>? checksum;
  IbcLightClientsWasmMsgStoreCodeResponse({List<int>? checksum})
    : checksum = BytesUtils.tryToBytes(checksum, unmodifiable: true);
  factory IbcLightClientsWasmMsgStoreCodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcLightClientsWasmMsgStoreCodeResponse(
      checksum: decode.getField(1),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"checksum": BytesUtils.tryToHexString(checksum)};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcLightClientsWasmMsgStoreCodeResponse;

  @override
  List get values => [checksum];
}
