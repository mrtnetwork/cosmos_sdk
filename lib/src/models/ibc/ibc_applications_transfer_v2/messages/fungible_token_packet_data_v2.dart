import 'package:cosmos_sdk/src/models/ibc/ibc_applications_transfer_v2/messages/forwarding_packed_data.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_transfer_v2/messages/token.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// FungibleTokenPacketDataV2 defines a struct for the packet payload
/// See FungibleTokenPacketDataV2 spec:
/// https://github.com/cosmos/ibc/tree/master/spec/app/ics-020-fungible-token-transfer#data-structures
class FungibleTokenPacketDataV2 extends CosmosMessage {
  /// the token denomination to be transferred
  final List<IbcTransferV2Token> tokens;
  // the sender address
  final String sender;
  // the recipient address on the destination chain
  final String receiver;
  // optional memo
  final String? memo;

  /// optional forwarding information
  final ForwardingPacketData? forwarding;
  const FungibleTokenPacketDataV2({
    required this.tokens,
    required this.sender,
    required this.receiver,
    this.memo,
    this.forwarding,
  });
  factory FungibleTokenPacketDataV2.fromJson(Map<String, dynamic> json) {
    return FungibleTokenPacketDataV2(
      tokens:
          (json["tokens"] as List?)
              ?.map((e) => IbcTransferV2Token.fromJson(e))
              .toList() ??
          [],
      sender: json["sender"],
      receiver: json["receiver"],
      memo: json["memo"],
      forwarding:
          json["forwarding"] == null
              ? null
              : ForwardingPacketData.fromJson(json["forwarding"]),
    );
  }
  factory FungibleTokenPacketDataV2.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return FungibleTokenPacketDataV2(
      tokens:
          decode
              .getFields<List<int>>(1)
              .map((e) => IbcTransferV2Token.deserialize(e))
              .toList(),
      sender: decode.getField(2),
      receiver: decode.getField(3),
      memo: decode.getField(4),
      forwarding: decode
          .getResult(5)
          ?.to<ForwardingPacketData, List<int>>(
            (e) => ForwardingPacketData.deserialize(e),
          ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tokens": tokens.map((e) => e.toJson()).toList(),
      "sender": sender,
      "receiver": receiver,
      "memo": memo,
      "forwarding": forwarding?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.fungibleTokenPacketDataV2;

  @override
  List get values => [tokens, sender, receiver, memo, forwarding];
}
