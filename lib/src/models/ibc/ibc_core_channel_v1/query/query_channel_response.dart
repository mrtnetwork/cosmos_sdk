import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/channel.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

// QueryChannelResponse is the response type for the Query/Channel RPC method.
//Besides the Channel end, it includes a proof and the height from which the proof was retrieved.
class QueryChannelResponse extends CosmosMessage {
  /// channel associated with the request identifiers
  final IbcChannelChannel? channel;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final IbcClientHeight proofHeight;
  factory QueryChannelResponse.fromJson(Map<String, dynamic> json) {
    return QueryChannelResponse(
      channel:
          json["channel"] == null
              ? null
              : IbcChannelChannel.fromJson(json["channel"]),
      proof: CosmosUtils.tryToBytes(json["proof"]),
      proofHeight: IbcClientHeight.fromJson(json["proof_height"]),
    );
  }
  QueryChannelResponse({
    this.channel,
    List<int>? proof,
    required this.proofHeight,
  }) : proof = BytesUtils.tryToBytes(proof, unmodifiable: true);
  factory QueryChannelResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryChannelResponse(
      channel: decode
          .getResult(1)
          ?.to<IbcChannelChannel, List<int>>(
            (e) => IbcChannelChannel.deserialize(e),
          ),
      proof: decode.getField(2),
      proofHeight: IbcClientHeight.deserialize(decode.getField(3)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "channel": channel?.toJson(),
      "proof": BytesUtils.tryToHexString(proof),
      "proof_height": proofHeight.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryChannelResponse;

  @override
  List get values => [channel, proof, proofHeight];
}
