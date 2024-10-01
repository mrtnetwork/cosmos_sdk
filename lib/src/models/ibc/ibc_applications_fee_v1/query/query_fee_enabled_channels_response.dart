import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_fee_v1/messages/fee_enabled_channel.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryFeeEnabledChannelsResponse defines the response type for the FeeEnabledChannels rpc
class QueryFeeEnabledChannelsResponse extends CosmosMessage {
  /// list of fee enabled channels
  final List<IbcFeeFeeEnabledChannel> feeEnabledChannels;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  QueryFeeEnabledChannelsResponse(
      {required List<IbcFeeFeeEnabledChannel> feeEnabledChannels,
      this.pagination})
      : feeEnabledChannels = feeEnabledChannels.immutable;
  factory QueryFeeEnabledChannelsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryFeeEnabledChannelsResponse(
        feeEnabledChannels: decode
            .getFields(1)
            .map((e) => IbcFeeFeeEnabledChannel.deserialize(e))
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
      "fee_enabled_channels":
          feeEnabledChannels.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl => IbcTypes.queryFeeEnabledChannelsResponse.typeUrl;

  @override
  List get values => [feeEnabledChannels, pagination];
}
