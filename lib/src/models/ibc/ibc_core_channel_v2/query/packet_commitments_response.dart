import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v2/messages/packet_state.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// QueryPacketCommitmentResponse is the response type for the Query/PacketCommitment RPC method.
class IbcChannelV2QueryPacketCommitmentsResponse extends CosmosMessage {
  /// collection of packet commitments for the requested channel identifier
  final List<IbcChannelV2PacketState>? commitments;

  /// pagination response
  final PageResponse? pagination;

  /// query block height.
  final IbcClientHeight height;
  factory IbcChannelV2QueryPacketCommitmentsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return IbcChannelV2QueryPacketCommitmentsResponse(
      commitments:
          json
              .asListOfMap("commitments")
              ?.map((e) => IbcChannelV2PacketState.fromJson(e))
              .toList(),
      pagination: json.maybeAs<PageResponse, Map<String, dynamic>>(
        key: "pagination",
        onValue: PageResponse.fromJson,
      ),
      height: IbcClientHeight.fromJson(json.asMap("height")),
    );
  }
  IbcChannelV2QueryPacketCommitmentsResponse({
    List<IbcChannelV2PacketState>? commitments,
    this.pagination,
    required this.height,
  }) : commitments = commitments?.immutable;
  factory IbcChannelV2QueryPacketCommitmentsResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelV2QueryPacketCommitmentsResponse(
      commitments:
          decode
              .getFields<List<int>>(1)
              .map((e) => IbcChannelV2PacketState.deserialize(e))
              .toList(),
      pagination: decode
          .getResult(2)
          ?.to<PageResponse, List<int>>(PageResponse.deserialize),
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
      "height": height.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2QueryPacketCommitmentsResponse;

  @override
  List get values => [commitments, pagination, height];
}
