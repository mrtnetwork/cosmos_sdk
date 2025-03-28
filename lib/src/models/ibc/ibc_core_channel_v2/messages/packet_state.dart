import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// PacketState defines the generic type necessary to retrieve and store
/// packet commitments, acknowledgements, and receipts.
/// Caller is responsible for knowing the context necessary to interpret this
/// state as a commitment, acknowledgement, or a receipt.
class IbcChannelV2PacketState extends CosmosMessage {
  /// client unique identifier.
  final String? clientId;

  /// packet sequence
  final BigInt? sequence;

  /// embedded data that represents packet state
  final List<int>? data;

  IbcChannelV2PacketState(
      {required this.sequence, required this.clientId, List<int>? data})
      : data = data?.asImmutableBytes;
  factory IbcChannelV2PacketState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelV2PacketState(
        sequence: decode.getField(2),
        clientId: decode.getField(1),
        data: decode.getField(3));
  }
  factory IbcChannelV2PacketState.fromJson(Map<String, dynamic> json) {
    return IbcChannelV2PacketState(
        sequence: json.asBigInt("sequence"),
        clientId: json.as("client_id"),
        data: json.asBytes("data"));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sequence": sequence?.toString(),
      "client_id": clientId,
      "data": CosmosUtils.tryToBase64(data)
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2PacketState;

  @override
  List get values => [clientId, sequence, data];
}
