import 'package:cosmos_sdk/src/models/ibc/ibc_applications_transfer_v2/messages/denom.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Token defines a struct which represents a token to be transferred
class IbcTransferV2Token extends CosmosMessage {
  /// the token denomination
  final IbcTransferV2Denom denom;

  /// the token amount to be transferred
  final String amount;
  const IbcTransferV2Token({required this.denom, required this.amount});
  factory IbcTransferV2Token.fromJson(Map<String, dynamic> json) {
    return IbcTransferV2Token(
      denom: IbcTransferV2Denom.fromJson(json["denom"]),
      amount: json["amount"],
    );
  }
  factory IbcTransferV2Token.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcTransferV2Token(
      denom: IbcTransferV2Denom.deserialize(decode.getField(1)),
      amount: decode.getField(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"denom": denom.toJson(), "amount": amount};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.token;

  @override
  List get values => [denom, amount];
}
