import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/messages/vote.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryVotesResponse is the response type for the Query/Votes RPC method.
class GovQueryVotesResponse extends CosmosMessage {
  /// votes defines the queried votes.
  final List<GovVote> votes;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  factory GovQueryVotesResponse.fromJson(Map<String, dynamic> json) {
    return GovQueryVotesResponse(
      votes:
          (json["votes"] as List?)?.map((e) => GovVote.fromJson(e)).toList() ??
              [],
      pagination: json["pagination"] == null
          ? null
          : PageResponse.fromJson(json["pagination"]),
    );
  }
  GovQueryVotesResponse({required List<GovVote> votes, this.pagination})
      : votes = votes.immutable;
  factory GovQueryVotesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovQueryVotesResponse(
        votes: decode
            .getFields<List<int>>(1)
            .map((e) => GovVote.deserialize(e))
            .toList(),
        pagination: decode
            .getResult(2)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "votes": votes.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => GovV1beta1types.govQueryVotesResponse;

  @override
  List get values => [votes, pagination];
}
