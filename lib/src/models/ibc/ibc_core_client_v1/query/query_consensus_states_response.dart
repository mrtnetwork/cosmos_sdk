import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/consensus_state_with_height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryConsensusStatesResponse is the response type for the Query/ConsensusStates RPC method
class QueryConsensusStatesResponse extends CosmosMessage {
  /// consensus states associated with the identifier
  final List<ConsensusStateWithHeight> consensusStates;

  /// pagination response
  final PageResponse? pagination;
  factory QueryConsensusStatesResponse.fromRpc(Map<String, dynamic> json) {
    return QueryConsensusStatesResponse(
      consensusStates: (json[""] as List?)
              ?.map((e) => ConsensusStateWithHeight.fromRpc(e))
              .toList() ??
          [],
      pagination: json["pagination"] == null
          ? null
          : PageResponse.fromRpc(json["pagination"]),
    );
  }
  QueryConsensusStatesResponse(
      {required List<ConsensusStateWithHeight> consensusStates,
      this.pagination})
      : consensusStates = consensusStates.immutable;
  factory QueryConsensusStatesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryConsensusStatesResponse(
        consensusStates: decode
            .getFields(1)
            .map((e) => ConsensusStateWithHeight.deserialize(e))
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
      "consensus_states": consensusStates.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryConsensusStatesResponse;

  @override
  List get values => [consensusStates, pagination];
}
