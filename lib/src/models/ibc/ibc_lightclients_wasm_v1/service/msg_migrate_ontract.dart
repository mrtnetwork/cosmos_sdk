import 'package:blockchain_utils/blockchain_utils.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgMigrateContract defines the request type for the MigrateContract rpc.
class IbcLightClientsWasmMsgMigrateContract extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// signer address
  final String? signer;

  /// the client id of the contract
  final String? clientId;

  /// checksum is the sha256 hash of the new wasm byte code for the contract
  final List<int>? checksum;

  /// the json encoded message to be passed to the contract on migration
  final List<int>? msg;
  IbcLightClientsWasmMsgMigrateContract(
      {this.signer, this.clientId, List<int>? checksum, List<int>? msg})
      : checksum = BytesUtils.tryToBytes(checksum, unmodifiable: true),
        msg = BytesUtils.tryToBytes(msg, unmodifiable: true);
  factory IbcLightClientsWasmMsgMigrateContract.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcLightClientsWasmMsgMigrateContract(
      signer: decode.getField(1),
      clientId: decode.getField(2),
      checksum: decode.getField(3),
      msg: decode.getField(4),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  String get service => IbcTypes.ibcLightClientsWasmMigrateContract.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "signer": signer,
      "client_id": clientId,
      "checksum": BytesUtils.tryToHexString(checksum),
      "msg": BytesUtils.tryToHexString(msg)
    };
  }

  @override
  String get typeUrl => IbcTypes.ibcLightClientsWasmMsgMigrateContract.typeUrl;

  @override
  List get values => [signer, clientId, checksum, msg];

  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        IbcTypes.ibcLightClientsWasmMsgMigrateContractResponse.typeUrl);
  }
}
