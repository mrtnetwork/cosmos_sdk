import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class IbcConnectionMsgConnectionOpenConfirm
    extends IbcService<EmptyServiceRequestResponse> {
  final String? connectionId;
  final List<int>? proofAck;
  final IbcClientHeight proofHeight;
  final String? signer;
  IbcConnectionMsgConnectionOpenConfirm({
    this.connectionId,
    List<int>? proofAck,
    required this.proofHeight,
    this.signer,
  }) : proofAck = BytesUtils.tryToBytes(proofAck);
  factory IbcConnectionMsgConnectionOpenConfirm.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionMsgConnectionOpenConfirm(
      connectionId: decode.getField(1),
      proofAck: decode.getField(2),
      proofHeight: IbcClientHeight.deserialize(decode.getField(3)),
      signer: decode.getField(4),
    );
  }
  factory IbcConnectionMsgConnectionOpenConfirm.fromJson(
    Map<String, dynamic> json,
  ) {
    return IbcConnectionMsgConnectionOpenConfirm(
      connectionId: json.as("connection_id"),
      proofAck: json.asBytes("proof_ack"),
      proofHeight: IbcClientHeight.fromJson(json.asMap("proof_height")),
      signer: json.as("signer"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "connection_id": connectionId,
      "proof_ack": BytesUtils.tryToHexString(proofAck),
      "proof_height": proofHeight.toJson(),
      "signer": signer,
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgConnectionOpenConfirmResponse;

  @override
  List get values => [connectionId, proofAck, proofHeight, signer];
  @override
  List<String?> get signers => [signer];
  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      IbcTypes.msgConnectionOpenConfirmResponse,
    );
  }
}
