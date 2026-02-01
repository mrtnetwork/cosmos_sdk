import 'package:cosmos_sdk/src/models/cctp/core/service.dart';
import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

import 'deposit_for_burn_with_caller_response.dart';

class CCTPV1MsgDepositForBurnWithCaller
    extends CCTPV1Service<CCTPV1MsgDepositForBurnWithCallerResponse>
    with AminoMessage<CCTPV1MsgDepositForBurnWithCallerResponse> {
  final String? from;
  final String? amount;
  final int? destinationDomain;
  final List<int>? mintRecipient;
  final String? burnToken;
  final List<int>? destinationCaller;
  const CCTPV1MsgDepositForBurnWithCaller({
    this.from,
    this.amount,
    this.destinationDomain,
    this.mintRecipient,
    this.burnToken,
    this.destinationCaller,
  });

  factory CCTPV1MsgDepositForBurnWithCaller.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgDepositForBurnWithCaller(
      from: decode.getField(1),
      amount: decode.getField(2),
      destinationDomain: decode.getField(3),
      burnToken: decode.getField(5),
      mintRecipient: decode.getField(4),
      destinationCaller: decode.getField(6),
    );
  }
  factory CCTPV1MsgDepositForBurnWithCaller.fromJson(
    Map<String, dynamic> json,
  ) {
    return CCTPV1MsgDepositForBurnWithCaller(
      from: json.as("from"),
      amount: json.as("amount"),
      destinationDomain: json.as("destination_domain"),
      burnToken: json.as("burn_token"),
      mintRecipient: json.asBytes("mint_recipient"),
      destinationCaller: json.asBytes("destination_caller"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "from": from,
      "amount": amount,
      "destination_domain": destinationDomain,
      "burn_token": burnToken,
      "mint_recipient": CosmosUtils.tryToBase64(mintRecipient),
      "destination_caller": CosmosUtils.tryToBase64(destinationCaller),
    };
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgDepositForBurnWithCaller;

  @override
  List get values => [
    from,
    amount,
    destinationDomain,
    mintRecipient,
    burnToken,
    destinationCaller,
  ];
  @override
  List<String?> get signers => [from];

  @override
  CCTPV1MsgDepositForBurnWithCallerResponse onResponse(List<int> bytes) {
    return CCTPV1MsgDepositForBurnWithCallerResponse.deserialize(bytes);
  }
}
