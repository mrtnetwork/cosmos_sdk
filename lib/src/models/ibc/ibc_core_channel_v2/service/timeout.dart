import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v2/messages/packet.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/ibc_core_client_v1.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';
import 'timeout_response.dart';

/// MsgTimeout receives timed-out packet.
class IbcChannelV2MsgTimeout
    extends IbcService<IbcChannelV2MsgTimeoutResponse> {
  final IbcChannelV2Packet? packet;
  final List<int>? proofUnreceived;
  final IbcClientHeight? proofHeight;
  final String? signer;
  IbcChannelV2MsgTimeout({
    required this.packet,
    List<int>? proofUnreceived,
    required this.proofHeight,
    this.signer,
  }) : proofUnreceived = proofUnreceived?.asImmutableBytes;
  factory IbcChannelV2MsgTimeout.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelV2MsgTimeout(
      packet: decode
          .getResult(1)
          ?.to<IbcChannelV2Packet, List<int>>(IbcChannelV2Packet.deserialize),
      proofUnreceived: decode.getField(2),
      proofHeight: decode
          .getResult(3)
          ?.to<IbcClientHeight, List<int>>(IbcClientHeight.deserialize),
      signer: decode.getField(5),
    );
  }
  factory IbcChannelV2MsgTimeout.fromJson(Map<String, dynamic> json) {
    return IbcChannelV2MsgTimeout(
      packet: json.maybeAs<IbcChannelV2Packet, Map<String, dynamic>>(
        key: "packet",
        onValue: IbcChannelV2Packet.fromJson,
      ),
      proofUnreceived: json.asBytes("proof_unreceived"),
      proofHeight: json.maybeAs<IbcClientHeight, Map<String, dynamic>>(
        key: "proof_height",
        onValue: IbcClientHeight.fromJson,
      ),
      signer: json.as("signer"),
    );
  }
  @override
  List<int> get fieldIds => [1, 2, 3, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "packet": packet?.toJson(),
      "proof_unreceived": CosmosUtils.tryToBase64(proofUnreceived),
      "proof_height": proofHeight?.toJson(),
      "signer": signer,
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2MsgTimeout;

  @override
  List get values => [packet, proofUnreceived, proofHeight, signer];
  @override
  List<String?> get signers => [signer];

  @override
  IbcChannelV2MsgTimeoutResponse onResponse(List<int> bytes) {
    return IbcChannelV2MsgTimeoutResponse.deserialize(bytes);
  }
}
