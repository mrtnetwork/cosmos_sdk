import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgDeposit defines a message to submit a deposit to an existing proposal.
class GovMsgDeposit extends GovV1Beta1Service<EmptyServiceRequestResponse>
    with AminoMessage<EmptyServiceRequestResponse> {
  /// proposal_id defines the unique id of the proposal.
  final BigInt proposalId;

  /// depositor defines the deposit addresses from the proposals.
  final CosmosBaseAddress? depositor;

  /// amount to be deposited by depositor.
  final List<Coin> amount;
  GovMsgDeposit({
    required this.proposalId,
    this.depositor,
    required this.amount,
  });
  factory GovMsgDeposit.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovMsgDeposit(
      proposalId: decode.getField(1),
      depositor: decode
          .getResult(2)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      amount:
          decode
              .getFields<List<int>>(3)
              .map((e) => Coin.deserialize(e))
              .toList(),
    );
  }
  factory GovMsgDeposit.fromJson(Map<String, dynamic> json) {
    return GovMsgDeposit(
      proposalId: json.asBigInt("proposal_id"),
      depositor: json.asAddress("depositor"),
      amount:
          json.asListOfMap("amount")?.map((e) => Coin.fromJson(e)).toList() ??
          [],
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "proposal_id": proposalId.toString(),
      "depositor": depositor?.address,
      "amount": amount.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => GovV1beta1types.govMsgDeposit;

  @override
  List get values => [proposalId, depositor?.address, amount];
  @override
  List<String?> get signers => [depositor?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(GovV1beta1types.govMsgDepositResponse);
  }
}
