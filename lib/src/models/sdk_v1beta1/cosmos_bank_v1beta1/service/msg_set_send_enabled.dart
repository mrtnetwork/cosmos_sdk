import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/messages/send_enabled.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgSetSendEnabled is the Msg/SetSendEnabled request type.
/// Only entries to add/update/delete need to be included. Existing SendEnabled entries that are not included in this message are left unchanged.
/// Since: cosmos-sdk 0.47
class MsgSetSendEnabled
    extends BankV1Beta1Service<EmptyServiceRequestResponse> {
  /// authority is the address that controls the module.
  final CosmosBaseAddress authority;

  /// send_enabled is the list of entries to add or update.
  final List<SendEnabled> sendEnabled;

  /// use_default_for is a list of denoms that should use the params.default_send_enabled value.
  /// Denoms listed here will have their SendEnabled entries deleted.
  /// If a denom is included that doesn't have a SendEnabled entry,
  /// it will be ignored.
  final List<String> useDefaultFor;

  const MsgSetSendEnabled({
    required this.authority,
    required this.sendEnabled,
    required this.useDefaultFor,
  });
  factory MsgSetSendEnabled.fromJson(Map<String, dynamic> json) {
    return MsgSetSendEnabled(
      authority: CosmosBaseAddress(json.as("authority")),
      sendEnabled:
          json
              .asListOfMap("send_enabled")!
              .map((e) => SendEnabled.fromJson(e))
              .toList(),
      useDefaultFor: json.asListOfString("use_default_for")!,
    );
  }

  factory MsgSetSendEnabled.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgSetSendEnabled(
      authority: CosmosBaseAddress(decode.getField(1)),
      sendEnabled:
          decode
              .getFields<List<int>>(2)
              .map((e) => SendEnabled.deserialize(e))
              .toList(),
      useDefaultFor: decode.getFields<String>(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "authority": authority.address,
      "send_enabled": sendEnabled.map((e) => e.toJson()).toList(),
      "use_default_for": useDefaultFor,
    };
  }

  @override
  List get values => [authority.address, sendEnabled, useDefaultFor];

  @override
  @override
  TypeUrl get typeUrl => BankV1beta1Types.msgSetSendEnabled;

  @override
  List<String?> get signers => [authority.address];
  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      BankV1beta1Types.msgSetSendEnabledResponse,
    );
  }
}
