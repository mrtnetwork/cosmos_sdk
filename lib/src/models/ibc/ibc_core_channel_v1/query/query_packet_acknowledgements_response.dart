import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/packet_state.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryPacketAcknowledgemetsResponse is the request type for the Query/QueryPacketAcknowledgements RPC method
class QueryPacketAcknowledgementsResponse extends CosmosMessage {
  final List<IbcChannelPacketState>? acknowledgements;

  /// pagination response
  final PageResponse? pagination;

  /// query block height
  final IbcClientHeight height;
  factory QueryPacketAcknowledgementsResponse.fromRpc(
      Map<String, dynamic> json) {
    return QueryPacketAcknowledgementsResponse(
      height: IbcClientHeight.fromRpc(json["height"]),
      pagination: json["pagination"] == null
          ? null
          : PageResponse.fromRpc(json["pagination"]),
    );
  }
  QueryPacketAcknowledgementsResponse(
      {List<IbcChannelPacketState>? acknowledgements,
      this.pagination,
      required this.height})
      : acknowledgements = acknowledgements?.emptyAsNull?.immutable;
  factory QueryPacketAcknowledgementsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryPacketAcknowledgementsResponse(
      acknowledgements: decode
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
      "acknowledgements": acknowledgements?.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson(),
      "height": height.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryPacketAcknowledgementsResponse;

  @override
  List get values => [acknowledgements, pagination, height];
}
