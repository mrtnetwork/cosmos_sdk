import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_transfer_v2/messages/denom.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/sdk_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDenomsResponse is the response type for the Query/Denoms RPC
/// method.
class IbcTransferV2QueryDenomsResponse extends CosmosMessage {
  /// denoms returns all denominations.
  final List<IbcTransferV2Denom> denoms;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;

  IbcTransferV2QueryDenomsResponse({
    required List<IbcTransferV2Denom> denoms,
    this.pagination,
  }) : denoms = denoms.immutable;
  factory IbcTransferV2QueryDenomsResponse.fromJson(Map<String, dynamic> json) {
    return IbcTransferV2QueryDenomsResponse(
      denoms:
          (json["denoms"] as List?)
              ?.map((e) => IbcTransferV2Denom.fromJson(e))
              .toList() ??
          [],
      pagination:
          json["pagination"] == null
              ? null
              : PageResponse.fromJson(json["pagination"]),
    );
  }
  factory IbcTransferV2QueryDenomsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcTransferV2QueryDenomsResponse(
      denoms:
          decode
              .getFields<List<int>>(1)
              .map((e) => IbcTransferV2Denom.deserialize(e))
              .toList(),
      pagination: decode
          .getResult(2)
          ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pagination": pagination?.toJson(),
      "denoms": denoms.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryDenomsRespone;

  @override
  List get values => [denoms, pagination];
}
