import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/messages/vote.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryVoteResponse is the response type for the Query/Vote RPC method.
class GovQueryVoteResponse extends CosmosMessage {
  /// vote defines the queried vote.
  final GovVote vote;
  const GovQueryVoteResponse(this.vote);
  factory GovQueryVoteResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovQueryVoteResponse(GovVote.deserialize(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"vote": vote.toJson()};
  }

  @override
  String get typeUrl => GovV1beta1types.govQueryVoteResponse.typeUrl;

  @override
  List get values => [vote];
}
