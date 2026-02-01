import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/messages/validator_signing_info.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QuerySigningInfosResponse is the response type for the Query/SigningInfos RPC method
class SlashingQuerySigningInfosResponse extends CosmosMessage {
  /// info is the signing info of all validators
  final List<SlashingValidatorSigningInfo> info;
  final PageResponse? pagination;
  factory SlashingQuerySigningInfosResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return SlashingQuerySigningInfosResponse(
      info:
          (json["info"] as List?)
              ?.map((e) => SlashingValidatorSigningInfo.fromJson(e))
              .toList() ??
          [],
      pagination:
          json["pagination"] == null
              ? null
              : PageResponse.fromJson(json["pagination"]),
    );
  }
  SlashingQuerySigningInfosResponse({
    required List<SlashingValidatorSigningInfo> info,
    this.pagination,
  }) : info = info.immutable;
  factory SlashingQuerySigningInfosResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SlashingQuerySigningInfosResponse(
      pagination: decode
          .getResult(2)
          ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)),
      info:
          decode
              .getFields<List<int>>(1)
              .map((e) => SlashingValidatorSigningInfo.deserialize(e))
              .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "info": info.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => SlashingV1beta1Types.slashingQuerySigningInfosResponse;

  @override
  List get values => [info, pagination];
}
