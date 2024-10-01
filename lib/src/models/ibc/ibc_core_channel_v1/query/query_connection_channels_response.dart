import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/identified_channel.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryConnectionChannelsResponse is the Response type for the Query/QueryConnectionChannels RPC method.
class QueryConnectionChannelsResponse extends CosmosMessage {
  /// list of channels associated with a connection.
  final List<IbcChannelIdentifiedChannel>? channels;

  /// pagination response
  final PageResponse? pagination;

  /// query block height
  final IbcClientHeight height;
  QueryConnectionChannelsResponse(
      {List<IbcChannelIdentifiedChannel>? channels,
      this.pagination,
      required this.height})
      : channels = channels?.emptyAsNull?.immutable;
  factory QueryConnectionChannelsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryConnectionChannelsResponse(
      channels: decode
          .getFields(1)
          .map((e) => IbcChannelIdentifiedChannel.deserialize(e))
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
      "channels": channels?.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson(),
      "height": height.toJson()
    };
  }

  @override
  String get typeUrl => IbcTypes.queryConnectionChannelsResponse.typeUrl;

  @override
  List get values => [channels, pagination, height];
}
