import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/core/service.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgRemoveChecksum defines the request type for the MsgRemoveChecksum rpc
class IbcLightClientsWasmMsgRemoveChecksum
    extends IbcService<EmptyServiceRequestResponse> {
  /// signer address
  final String? signer;

  /// checksum is the sha256 hash to be removed from the store
  final List<int>? checksum;
  IbcLightClientsWasmMsgRemoveChecksum({this.signer, List<int>? checksum})
    : checksum = BytesUtils.tryToBytes(checksum, unmodifiable: true);
  factory IbcLightClientsWasmMsgRemoveChecksum.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcLightClientsWasmMsgRemoveChecksum(
      signer: decode.getField(1),
      checksum: decode.getField(2),
    );
  }
  factory IbcLightClientsWasmMsgRemoveChecksum.fromJson(
    Map<String, dynamic> json,
  ) {
    return IbcLightClientsWasmMsgRemoveChecksum(
      signer: json.as("signer"),
      checksum: json.asBytes("checksum"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"signer": signer, "checksum": BytesUtils.tryToHexString(checksum)};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcLightClientsWasmMsgRemoveChecksum;

  @override
  List get values => [signer, checksum];

  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      IbcTypes.ibcLightClientsWasmMsgRemoveChecksumResponse,
    );
  }
}
