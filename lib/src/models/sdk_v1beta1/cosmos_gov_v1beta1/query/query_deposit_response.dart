import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/messages/deposit.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDepositResponse is the response type for the Query/Deposit RPC method.
class GovQueryDepositResponse extends CosmosMessage {
  /// deposit defines the requested deposit.
  final GovDeposit deposit;
  const GovQueryDepositResponse(this.deposit);
  factory GovQueryDepositResponse.fromRpc(Map<String, dynamic> json) {
    return GovQueryDepositResponse(GovDeposit.fromRpc(json["deposit"]));
  }
  factory GovQueryDepositResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovQueryDepositResponse(GovDeposit.deserialize(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"deposit": deposit.toJson()};
  }

  @override
  TypeUrl get typeUrl => GovV1beta1types.govQueryDepositResponse;

  @override
  List get values => [deposit];
}
