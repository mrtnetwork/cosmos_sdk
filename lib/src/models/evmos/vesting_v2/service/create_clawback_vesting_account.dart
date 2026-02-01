import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/models/evmos/core/service.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgCreateClawbackVestingAccount defines a message that enables creating a
/// ClawbackVestingAccount.
class EvmosVestingV2MsgCreateClawbackVestingAccount
    extends EvmosService<EmptyServiceRequestResponse>
    with AminoMessage {
  /// funderAddress specifies the account that will be able to fund the vesting account
  final String? funderAddress;

  /// vesting_address specifies the address that will receive the vesting tokens
  final String? vestingAddress;

  /// enable_gov_clawback specifies whether the governance module can clawback this account
  final bool? enableGovClawback;

  const EvmosVestingV2MsgCreateClawbackVestingAccount({
    this.funderAddress,
    this.vestingAddress,
    this.enableGovClawback,
  });

  factory EvmosVestingV2MsgCreateClawbackVestingAccount.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosVestingV2MsgCreateClawbackVestingAccount(
      funderAddress: decode.getField(1),
      vestingAddress: decode.getField(2),
      enableGovClawback: decode.getField(3),
    );
  }
  factory EvmosVestingV2MsgCreateClawbackVestingAccount.fromJson(
    Map<String, dynamic> json,
  ) {
    return EvmosVestingV2MsgCreateClawbackVestingAccount(
      funderAddress: json.as("funder_address"),
      vestingAddress: json.as("vesting_address"),
      enableGovClawback: json.as("enable_gov_clawback"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "funder_address": funderAddress,
      "vesting_address": vestingAddress,
      "enable_gov_clawback": enableGovClawback,
    };
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.msgCreateClawbackVestingAccount;

  @override
  List get values => [funderAddress, vestingAddress, enableGovClawback];
  @override
  List<String?> get signers => [funderAddress];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      EvmosErc20V1Types.msgCreateClawbackVestingAccountResponse,
    );
  }
}
