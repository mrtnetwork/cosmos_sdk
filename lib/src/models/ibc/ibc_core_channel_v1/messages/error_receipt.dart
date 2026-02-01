import 'package:blockchain_utils/utils/numbers/utils/bigint_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ErrorReceipt defines a type which encapsulates the upgrade sequence and error
/// associated with the upgrade handshake failure. When a channel upgrade handshake
/// is aborted both chains are expected to increment to the next sequence.
class IbcChannelErrorReceipt extends CosmosMessage {
  /// the channel upgrade sequence
  final BigInt? sequence;

  /// the error message detailing the cause of failure
  final String? message;
  factory IbcChannelErrorReceipt.fromJson(Map<String, dynamic> json) {
    return IbcChannelErrorReceipt(
      sequence: BigintUtils.parse(json["sequence"]),
      message: json["message"],
    );
  }
  const IbcChannelErrorReceipt({this.sequence, this.message});
  factory IbcChannelErrorReceipt.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelErrorReceipt(
      sequence: decode.getField(1),
      message: decode.getField(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"sequence": sequence, "message": message};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.errorReceipt;

  @override
  List get values => [sequence, message];
}
