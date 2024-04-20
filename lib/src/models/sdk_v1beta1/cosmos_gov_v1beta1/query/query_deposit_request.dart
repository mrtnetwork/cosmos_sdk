import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/query/query_deposit_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDepositRequest is the request type for the Query/Deposit RPC method.
class GovQueryDepositRequest extends CosmosMessage
    with QueryMessage<GovQueryDepositResponse> {
  /// proposal_id defines the unique id of the proposal.
  final BigInt? proposalId;

  /// depositor defines the deposit addresses from the proposals.
  final CosmosBaseAddress? depositor;
  const GovQueryDepositRequest({this.proposalId, this.depositor});
  factory GovQueryDepositRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovQueryDepositRequest(
        proposalId: decode.getField(1),
        depositor: decode
            .getResult(2)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get queryPath => GovV1beta1types.queryGovDeposit.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "proposal_id": proposalId?.toString(),
      "depositor": depositor?.address
    };
  }

  @override
  String get typeUrl => GovV1beta1types.govQueryDepositRequest.typeUrl;

  @override
  List get values => [proposalId, depositor?.address];

  @override
  GovQueryDepositResponse onResponse(List<int> bytes) {
    return GovQueryDepositResponse.deserialize(bytes);
  }
}
