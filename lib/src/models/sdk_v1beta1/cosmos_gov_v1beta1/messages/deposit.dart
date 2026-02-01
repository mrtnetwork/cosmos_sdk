import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// Deposit defines an amount deposited by an account address to an active proposal.
class GovDeposit extends CosmosMessage {
  /// proposal_id defines the unique id of the proposal.
  final BigInt? proposalId;

  /// depositor defines the deposit addresses from the proposals.
  final CosmosBaseAddress? depositor;

  /// amount to be deposited by depositor.
  final List<Coin> amount;
  factory GovDeposit.fromJson(Map<String, dynamic> json) {
    return GovDeposit(
      proposalId: BigintUtils.tryParse(json["proposal_id"]),
      depositor:
          json["depositor"] == null
              ? null
              : CosmosBaseAddress(json["depositor"]),
      amount:
          (json["amount"] as List?)?.map((e) => Coin.fromJson(e)).toList() ??
          [],
    );
  }
  GovDeposit({this.proposalId, this.depositor, required List<Coin> amount})
    : amount = amount.immutable;
  factory GovDeposit.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovDeposit(
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

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "proposal_id": proposalId?.toString(),
      "depositor": depositor?.address,
      "amount": amount.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => GovV1beta1types.govDeposit;

  @override
  List get values => [proposalId, depositor, amount];
}
