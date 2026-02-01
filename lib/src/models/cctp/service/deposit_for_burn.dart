import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/models/cctp/core/service.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

import 'deposit_for_burn_response.dart';

class CCTPV1MsgDepositForBurn
    extends CCTPV1Service<CCTPV1MsgDepositForBurnResponse>
    with AminoMessage<CCTPV1MsgDepositForBurnResponse> {
  final String? from;
  final String? amount;
  final int? destinationDomain;
  final List<int>? mintRecipient;
  final String? burnToken;
  const CCTPV1MsgDepositForBurn({
    this.from,
    this.amount,
    this.destinationDomain,
    this.mintRecipient,
    this.burnToken,
  });

  factory CCTPV1MsgDepositForBurn.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgDepositForBurn(
      from: decode.getField(1),
      amount: decode.getField(2),
      destinationDomain: decode.getField(3),
      burnToken: decode.getField(5),
      mintRecipient: decode.getField(4),
    );
  }
  factory CCTPV1MsgDepositForBurn.fromJson(Map<String, dynamic> json) {
    return CCTPV1MsgDepositForBurn(
      from: json.as("from"),
      amount: json.as("amount"),
      destinationDomain: json.as("destination_domain"),
      burnToken: json.as("burn_token"),
      mintRecipient: json.asBytes("mint_recipient"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "from": from,
      "amount": amount,
      "destination_domain": destinationDomain,
      "burn_token": burnToken,
      "mint_recipient": CosmosUtils.tryToBase64(mintRecipient),
    };
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgDepositForBurn;

  @override
  List get values => [
    from,
    amount,
    destinationDomain,
    mintRecipient,
    burnToken,
  ];
  @override
  List<String?> get signers => [from];

  @override
  CCTPV1MsgDepositForBurnResponse onResponse(List<int> bytes) {
    return CCTPV1MsgDepositForBurnResponse.deserialize(bytes);
  }
}
