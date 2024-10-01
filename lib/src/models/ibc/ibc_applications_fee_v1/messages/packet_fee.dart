import 'package:cosmos_sdk/src/models/ibc/ibc_applications_fee_v1/messages/fee.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// PacketFee contains ICS29 relayer fees, refund address and optional list of permitted relayers
class IbcFeePacketFee extends CosmosMessage {
  /// fee encapsulates the recv, ack and timeout fees associated with an IBC packet
  final IbcFeeFee fee;

  /// the refund address for unspent fees
  final String? refundAddress;

  /// optional list of relayers permitted to receive fees
  final List<String>? relayers;
  IbcFeePacketFee(
      {required this.fee, this.refundAddress, List<String>? relayers})
      : relayers = relayers?.emptyAsNull?.immutable;
  factory IbcFeePacketFee.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcFeePacketFee(
        fee: IbcFeeFee.deserialize(decode.getField(1)),
        refundAddress: decode.getField(2),
        relayers: decode.getFields<String>(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "fee": fee.toJson(),
      "refund_address": refundAddress,
      "relayers": relayers
    };
  }

  @override
  String get typeUrl => IbcTypes.packetFee.typeUrl;

  @override
  List get values => [fee, refundAddress, relayers];
}
