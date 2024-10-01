import 'package:cosmos_sdk/src/models/ibc/ibc_applications_fee_v1/messages/fee.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// MsgPayPacketFee defines the request type for the PayPacketFee rpc This Msg can be used
/// to pay for a packet at the next sequence send & should be combined with the Msg that will be paid for
class MsgPayPacketFee extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// fee encapsulates the recv, ack and timeout fees associated with an IBC packet
  final IbcFeeFee fee;

  /// the source port unique identifier
  final String? sourcePortId;

  /// the source channel unique identifier
  final String? sourceChannelId;

  /// account address to refund fee if necessary
  final String? signer;

  /// optional list of relayers permitted to the receive packet fees
  final List<String>? relayers;
  MsgPayPacketFee(
      {required this.fee,
      this.sourcePortId,
      this.sourceChannelId,
      this.signer,
      List<String>? relayers})
      : relayers = relayers?.emptyAsNull?.immutable;
  factory MsgPayPacketFee.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgPayPacketFee(
        fee: IbcFeeFee.deserialize(decode.getField(1)),
        sourcePortId: decode.getField(2),
        sourceChannelId: decode.getField(3),
        signer: decode.getField(4),
        relayers: decode.getFields<String>(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  String get service => IbcTypes.payPacketFee.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "fee": fee.toJson(),
      "source_port_id": sourcePortId,
      "source_channel_id": sourceChannelId,
      "signer": signer,
      "relayers": relayers
    };
  }

  @override
  String get typeUrl => IbcTypes.msgPayPacketFee.typeUrl;

  @override
  List get values => [fee, sourcePortId, sourceChannelId, signer, relayers];
  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        IbcTypes.msgPayPacketFeeResponse.typeUrl);
  }
}
