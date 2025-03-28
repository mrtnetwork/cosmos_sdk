import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_fee_v1/messages/identified_packet_fees.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryIncentivizedPacketsResponse defines the response type for the IncentivizedPackets rpc
class QueryIncentivizedPacketsResponse extends CosmosMessage {
  /// list of identified fees for incentivized packets
  final List<IbcFeeIdentifiedPacketFees> incentivizedPackets;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  QueryIncentivizedPacketsResponse(
      {required List<IbcFeeIdentifiedPacketFees> incentivizedPackets,
      this.pagination})
      : incentivizedPackets = incentivizedPackets.immutable;

  factory QueryIncentivizedPacketsResponse.fromJson(Map<String, dynamic> json) {
    return QueryIncentivizedPacketsResponse(
      incentivizedPackets: (json["incentivized_packets"] as List?)
              ?.map((e) => IbcFeeIdentifiedPacketFees.fromJson(e))
              .toList() ??
          [],
      pagination: json["pagination"] == null
          ? null
          : PageResponse.fromJson(json["pagination"]),
    );
  }

  factory QueryIncentivizedPacketsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryIncentivizedPacketsResponse(
        incentivizedPackets: decode
            .getFields<List<int>>(1)
            .map((e) => IbcFeeIdentifiedPacketFees.deserialize(e))
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
      "incentivized_packets":
          incentivizedPackets.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryIncentivizedPacketsResponse;

  @override
  List get values => [incentivizedPackets, pagination];
}
