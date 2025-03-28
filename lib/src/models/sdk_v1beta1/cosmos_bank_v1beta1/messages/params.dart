import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/messages/send_enabled.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// Params defines the parameters for the bank module.
class BankParams extends CosmosMessage {
  /// Deprecated: Use of SendEnabled in params is deprecated.
  /// For genesis, use the newly added send_enabled field in the genesis object.
  /// Storage, lookup, and manipulation of this information is now in the keeper.
  ///
  /// As of cosmos-sdk 0.47, this only exists for backwards compatibility of genesis files.
  final List<SendEnabled> sendEnabled;
  final bool defaultSendEnabled;
  const BankParams(
      {this.sendEnabled = const [], required this.defaultSendEnabled});
  factory BankParams.fromJson(Map<String, dynamic> json) {
    return BankParams(
        sendEnabled: json
                .asListOfMap("send_enabled", throwOnNull: true)
                ?.map((e) => SendEnabled.fromJson(e))
                .toList() ??
            [],
        defaultSendEnabled: json.as("default_send_enabled"));
  }
  factory BankParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return BankParams(
        defaultSendEnabled: decode.getField(2),
        sendEnabled: decode
            .getFields<List<int>>(1)
            .map((e) => SendEnabled.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "send_enabled": sendEnabled.map((e) => e.toJson()).toList(),
      "default_send_enabled": defaultSendEnabled
    };
  }

  @override
  TypeUrl get typeUrl => BankV1beta1Types.params;

  @override
  List get values => [sendEnabled, defaultSendEnabled];
}
