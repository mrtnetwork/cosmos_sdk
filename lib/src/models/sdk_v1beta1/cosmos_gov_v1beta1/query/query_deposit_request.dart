import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/query/query_deposit_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDepositRequest is the request type for the Query/Deposit RPC method.
class GovQueryDepositRequest extends CosmosMessage
    with QueryMessage<GovQueryDepositResponse> {
  /// proposal_id defines the unique id of the proposal.
  final BigInt proposalId;

  /// depositor defines the deposit addresses from the proposals.
  final CosmosBaseAddress depositor;
  const GovQueryDepositRequest(
      {required this.proposalId, required this.depositor});
  factory GovQueryDepositRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovQueryDepositRequest(
        proposalId: decode.getField(1),
        depositor: CosmosBaseAddress(decode.getField(2)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "proposal_id": proposalId.toString(),
      "depositor": depositor.address
    };
  }

  @override
  TypeUrl get typeUrl => GovV1beta1types.govQueryDepositRequest;

  @override
  List get values => [proposalId, depositor.address];

  @override
  GovQueryDepositResponse onResponse(List<int> bytes) {
    return GovQueryDepositResponse.deserialize(bytes);
  }

  @override
  GovQueryDepositResponse onJsonResponse(Map<String, dynamic> json) {
    return GovQueryDepositResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [proposalId.toString(), depositor.address];
}
