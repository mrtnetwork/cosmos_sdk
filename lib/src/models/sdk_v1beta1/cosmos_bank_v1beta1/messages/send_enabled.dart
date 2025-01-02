import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';

/// SendEnabled maps coin denom to a send_enabled status (whether a denom is sendable).
class SendEnabled extends CosmosMessage {
  final String denom;
  final bool enabled;
  const SendEnabled({required this.denom, required this.enabled});
  factory SendEnabled.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SendEnabled(denom: decode.getField(1), enabled: decode.getField(2));
  }
  factory SendEnabled.fromRpc(Map<String, dynamic> json) {
    return SendEnabled(denom: json["denom"], enabled: json["enabled"]);
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"denom": denom, "enabled": enabled};
  }

  @override
  TypeUrl get typeUrl => BankV1beta1Types.sendEnabled;

  @override
  List get values => [denom, enabled];
}
