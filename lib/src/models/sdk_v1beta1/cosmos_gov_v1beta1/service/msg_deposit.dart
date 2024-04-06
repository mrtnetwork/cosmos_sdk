import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgDeposit defines a message to submit a deposit to an existing proposal.
class GovMsgDeposit extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// proposal_id defines the unique id of the proposal.
  final BigInt proposalId;

  /// depositor defines the deposit addresses from the proposals.
  final BaseAddress? depositor;

  /// amount to be deposited by depositor.
  final List<Coin> amount;
  GovMsgDeposit(
      {required this.proposalId, this.depositor, required this.amount});
  factory GovMsgDeposit.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovMsgDeposit(
        proposalId: decode.getField(1),
        depositor:
            decode.getResult(2)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        amount: decode.getFields(3).map((e) => Coin.deserialize(e)).toList());
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  String get service => GovV1beta1types.serviceGovDeposit.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "proposal_id": proposalId.toString(),
      "depositor": depositor?.address,
      "amount": amount.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => GovV1beta1types.govMsgDeposit.typeUrl;

  @override
  List get values => [proposalId, depositor, amount];
  @override
  List<String?> get signers => [depositor?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        GovV1beta1types.govMsgDepositResponse.typeUrl);
  }
}
