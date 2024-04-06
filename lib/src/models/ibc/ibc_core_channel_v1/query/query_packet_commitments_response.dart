import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/packet_state.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// QueryPacketCommitmentsResponse is the request type for the Query/QueryPacketCommitments RPC method
class QueryPacketCommitmentsResponse extends CosmosMessage {
  final List<IbcChannelPacketState>? commitments;

  /// pagination response
  final PageResponse? pagination;

  /// query block height
  final IbcClientHeight height;
  QueryPacketCommitmentsResponse(
      {List<IbcChannelPacketState>? commitments,
      this.pagination,
      required this.height})
      : commitments = commitments?.nullOnEmpy;
  factory QueryPacketCommitmentsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryPacketCommitmentsResponse(
      commitments: decode
          .getFields(1)
          .map((e) => IbcChannelPacketState.deserialize(e))
          .toList(),
      pagination: decode
          .getResult(2)
          ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)),
      height: IbcClientHeight.deserialize(decode.getField(3)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "commitments": commitments?.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson(),
      "height": height.toJson()
    };
  }

  @override
  String get typeUrl => IbcTypes.queryPacketCommitmentsResponse.typeUrl;

  @override
  List get values => [commitments, pagination, height];
}
