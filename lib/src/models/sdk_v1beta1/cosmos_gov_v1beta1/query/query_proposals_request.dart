import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/messages/proposal_status.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/query/query_proposals_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryProposalsRequest is the request type for the Query/Proposals RPC method.
class GovQueryProposalsRequest extends CosmosMessage
    with QueryMessage<GovQueryProposalsResponse> {
  /// proposal_status defines the status of the proposals.
  final ProposalStatus? proposalStatus;

  /// voter defines the voter address for the proposals.
  final CosmosBaseAddress? voter;

  /// depositor defines the deposit addresses from the proposals.
  final CosmosBaseAddress? depositor;

  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;

  const GovQueryProposalsRequest({
    this.proposalStatus,
    this.voter,
    this.depositor,
    this.pagination,
  });
  factory GovQueryProposalsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovQueryProposalsRequest(
      proposalStatus: decode
          .getResult(1)
          ?.to<ProposalStatus, int>((e) => ProposalStatus.fromValue(e)),
      voter: decode
          .getResult(2)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      depositor: decode
          .getResult(3)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      pagination: decode
          .getResult(4)
          ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "proposal_status": proposalStatus?.value,
      "voter": voter?.address,
      "depositor": depositor?.address,
      "pagination": pagination?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => GovV1beta1types.govQueryProposalsRequest;

  @override
  List get values => [
    proposalStatus?.value,
    voter?.address,
    depositor?.address,
    pagination,
  ];

  @override
  GovQueryProposalsResponse onResponse(List<int> bytes) {
    return GovQueryProposalsResponse.deserialize(bytes);
  }

  @override
  GovQueryProposalsResponse onJsonResponse(Map<String, dynamic> json) {
    return GovQueryProposalsResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters => {
    "proposal_status": proposalStatus?.value.toString(),
    "voter": voter?.address,
    "depositor": depositor?.address,
    ...pagination?.queryParameters ?? {},
  };
}
