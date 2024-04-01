import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// QueryConsensusStateHeightsResponse is the response type for the Query/ConsensusStateHeights RPC method
class QueryConsensusStateHeightsResponse extends CosmosMessage {
  /// consensus state heights
  final List<IbcClientHeight> consensusStateHeights;

  /// pagination response
  final PageResponse? pagination;
  QueryConsensusStateHeightsResponse(
      {required List<IbcClientHeight> consensusStateHeights, this.pagination})
      : consensusStateHeights = consensusStateHeights.mutable;

  factory QueryConsensusStateHeightsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryConsensusStateHeightsResponse(
        consensusStateHeights: decode
            .getFileds(1)
            .map((e) => IbcClientHeight.deserialize(e))
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
      "consensus_state_heights":
          consensusStateHeights.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl => IbcTypes.queryConsensusStateHeightsResponse.typeUrl;

  @override
  List get values => [consensusStateHeights, pagination];
}
