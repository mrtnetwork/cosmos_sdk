import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v2/messages/packet_state.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// QueryPacketAcknowledgemetsResponse is the request type for the
/// Query/QueryPacketAcknowledgements RPC method
class IbcChannelV2QueryPacketAcknowledgementsResponse extends CosmosMessage {
  final List<IbcChannelV2PacketState>? acknowledgements;

  /// pagination response
  final PageResponse? pagination;

  /// query block height.
  final IbcClientHeight height;
  factory IbcChannelV2QueryPacketAcknowledgementsResponse.fromJson(
      Map<String, dynamic> json) {
    return IbcChannelV2QueryPacketAcknowledgementsResponse(
      acknowledgements: json
          .asListOfMap("acknowledgements")
          ?.map((e) => IbcChannelV2PacketState.fromJson(e))
          .toList(),
      pagination: json.maybeAs<PageResponse, Map<String, dynamic>>(
          key: "pagination", onValue: PageResponse.fromJson),
      height: IbcClientHeight.fromJson(json.asMap("height")),
    );
  }
  IbcChannelV2QueryPacketAcknowledgementsResponse(
      {List<IbcChannelV2PacketState>? acknowledgements,
      this.pagination,
      required this.height})
      : acknowledgements = acknowledgements?.immutable;
  factory IbcChannelV2QueryPacketAcknowledgementsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelV2QueryPacketAcknowledgementsResponse(
        acknowledgements: decode
            .getFields<List<int>>(1)
            .map((e) => IbcChannelV2PacketState.deserialize(e))
            .toList(),
        pagination: decode
            .getResult(2)
            ?.to<PageResponse, List<int>>(PageResponse.deserialize),
        height: IbcClientHeight.deserialize(decode.getField(3)));
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
  TypeUrl get typeUrl => IbcTypes.channelV2QueryPacketAcknowledgementsResponse;

  @override
  List get values => [acknowledgements, pagination, height];
}
